import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/classDataProvider.dart';

class UploadFunction extends StatelessWidget {
  const UploadFunction({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var classdata = Provider.of<ClassData>(context);

    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.black,
          child: TextButton(
            child: Text("upload", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),),
            onPressed: (){
              classdata.uploadFileFunction("../assets/frame6.png");
            }
          ),
        ),
      ),
    );
  }
}