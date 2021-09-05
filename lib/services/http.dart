import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/class_data.dart';

Future<Class_data> SendData(String level, String result) async {
  final response = await http.post(
    Uri.parse('http://10.0.2.2:8000/api/v1/class_data'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'level': level,
      'result': result,
    }),
  );
  if (response.statusCode == 201) {
    return Class_data.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create data.');
  }
}

List<dynamic> dataList = [];

Future<List<dynamic>> GetData() async {
  final response =
      await http.get(Uri.parse('http://10.0.2.2:8000/api/v1/class_data'));
  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body);
    return data;
  } else {
    throw Exception('Failed to create data.');
  }
}

bool _checker = false;

Future<Class_data> updateData(String level, String result, String id) async {
  final http.Response response = await http.put(
    Uri.parse('http://10.0.2.2:8000/api/v1/class_data/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{'level': level, 'result': result}),
  );
  

  if (response.statusCode == 200) {
    print(response.statusCode);
    _checker = true;
    return Class_data.fromJson(json.decode(response.body));
  
  } else {
    _checker = false;
    throw Exception('Failed to update.');
  }
}

Future<Class_data> deleteData(String id) async {
  final http.Response response = await http.delete(
    Uri.parse('http://10.0.2.2:8000/api/v1/class_data/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  

  if (response.statusCode == 200) {
    print('statuscode is 200');
    _checker = true;
    return Class_data.fromJson(json.decode(response.body));
    
  } else {
    print('statuscode is NOT 200');
    _checker = false;
    throw Exception('Failed to delete');
  }
}

bool checked(){
  return _checker;
}