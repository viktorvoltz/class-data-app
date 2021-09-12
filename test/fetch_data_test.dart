import 'package:classdrive/model/class_data.dart';
import 'package:classdrive/services/http.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'fetch_data_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('fetchData', () {
    test('returns List<dynamic> if the http call completes successfully', () async {
      final client = MockClient();

      when(
        client.get(
          Uri.parse('http://10.0.2.2:8000/api/v1/class_data'),
        ),
      ).thenAnswer(
        (_) async => http.Response('{"level": 100, "result": 100}', 200),
      );

      expect(await getData(), isA<List<dynamic>>());
    });

    test('throws an exception if the http call completes with an error', () {
      final client = MockClient();

      
      when(
        client.get(
          Uri.parse('http://10.0.2.2:8000/api/v1/class_data'),
        ),
      ).thenAnswer(
        (_) async => http.Response('Not Found', 404),
      );

      expect(getData(), throwsException);
    });
  });
}
