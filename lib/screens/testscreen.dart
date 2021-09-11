import 'package:classdrive/model/class_data.dart';
import 'package:classdrive/services/http.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final TextEditingController _controllerLevel = TextEditingController();
  final TextEditingController _controllerResult = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HOME'),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/second');
                },
                child: Icon(
                  Icons.storage,
                  size: 26.0,
                ),
              ))
        ],
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.all(8.0),
        child: buildColumn(),
      ),
    );
  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: _controllerLevel,
          decoration: const InputDecoration(hintText: 'level'),
        ),
        TextField(
          controller: _controllerResult,
          decoration: const InputDecoration(hintText: 'result'),
        ),
        ElevatedButton(
          onPressed: () {
            sendData(_controllerLevel.text, _controllerResult.text);
            _controllerLevel.clear();
            _controllerResult.clear();
            FocusScope.of(context).unfocus();
          },
          child: const Text('Create Data'),
        ),
      ],
    );
  }
}
