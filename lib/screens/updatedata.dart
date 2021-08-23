import 'package:classdrive/services/http.dart';
import 'package:flutter/material.dart';

class UpdateData extends StatefulWidget {
  String id;
  String level;
  String result;

  UpdateData(this.id, this.level, this.result);

  @override
  _UpdateDataState createState() => _UpdateDataState();
}

class _UpdateDataState extends State<UpdateData> {
  final TextEditingController _controllerLevel = TextEditingController();
  final TextEditingController _controllerResult = TextEditingController();

  @override
  void initState() {
    _controllerLevel.text = widget.level;
    _controllerResult.text = widget.result;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controllerLevel,
              decoration: const InputDecoration(hintText: 'Update Level'),
            ),
            TextField(
              controller: _controllerResult,
              decoration: const InputDecoration(hintText: 'Update Result'),
            ),
            ElevatedButton(
              onPressed: () {
                updateData(_controllerLevel.text, _controllerResult.text, widget.id);
                bool checker = checked();
                if (checker == true) {
                  final snackBar = SnackBar(
                    content: Text('Updated'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              child: const Text('UPDATE Data'),
            ),
          ],
        ),
      ),
    );
  }
}
