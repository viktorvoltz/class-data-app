import 'package:classdrive/provider/classDataProvider.dart';
import 'package:classdrive/screens/dataScreen.dart';
import 'package:classdrive/screens/testscreen.dart';
import 'package:classdrive/screens/updatedata.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ClassData>(
        create: (_) => ClassData(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => const DataScreen(),
            '/second': (context) => const TestScreen(),
          },
        ));
  }
}
