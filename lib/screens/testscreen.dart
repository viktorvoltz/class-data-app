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
  Future<Class_data>? _futureClass;
  Future<List>? _futureList;

  /*@override
  void initState() {
    _futureList = GetData();
    super.initState();
  }*/

  void futureList() {
    setState(() {
      _futureList = GetData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HOME'),
      ),
      body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: (_futureClass == null) ? buildColumn() : buildFutureBuilder()),
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
            setState(() {
              _futureClass =
                  SendData(_controllerLevel.text, _controllerResult.text);
            });
            futureList();
          },
          child: const Text('Create Data'),
        ),
      ],
    );
  }

  FutureBuilder<List> buildFutureBuilder() {
    return FutureBuilder<List>(
      future: _futureList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return Container(
                child: Column(
                  children: [
                    ListTile(
                      title: Text(snapshot.data![index]['level'].toString()),
                    ),
                    ListTile(
                      title: Text(snapshot.data![index]['result'].toString()),
                    ),
                  ],
                ),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
