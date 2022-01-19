import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/http.dart';


class ClassData extends ChangeNotifier{
  final String? publicId;
  final String? resourceType;
  final String? createdAt;
  final String? secureUrl;
  final String? originalFilename;

  ClassData({
    this.publicId,
    this.resourceType,
    this.createdAt,
    this.secureUrl,
    this.originalFilename,
  });

  List<ClassData> items = [];

  uploadFileFunction(String fileName){
    uploadFIle(fileName);


  }

}