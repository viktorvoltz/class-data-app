import 'package:classdrive/screens/testscreen.dart';
import 'package:classdrive/screens/uploadScreen.dart';
import 'package:flutter/material.dart';
import '../services/http.dart';
import 'updatedata.dart';

class DataScreen extends StatefulWidget {
  const DataScreen({Key? key}) : super(key: key);

  @override
  _DataScreenState createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  Future<List>? _futureList;
  void initState() {
    _futureList = getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data'),
      ),
      body: Container(
        child: buildFutureBuilder(),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(top: 500),
        child: Column(
          children: [
            FloatingActionButton(
              heroTag: null,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TestScreen(),
                  ),
                );
              },
              child: Icon(Icons.add),
            ),
            SizedBox(height: 10,),
            FloatingActionButton(
              heroTag: null,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UploadFunction(),
                  ),
                );
              },
              child: Icon(Icons.upload),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }

  FutureBuilder<List> buildFutureBuilder() {
    return FutureBuilder<List>(
      future: _futureList,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Container(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UpdateData(
                            snapshot.data![index]['id'].toString(),
                            snapshot.data![index]['level'].toString(),
                            snapshot.data![index]['result'].toString(),
                          ),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          color: Colors.lightBlue[100],
                          child: ListTile(
                            title:
                                Text(snapshot.data![index]['level'].toString()),
                            trailing: Text(
                                snapshot.data![index]['result'].toString()),
                          ),
                        ),
                        SizedBox(height: 5),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('can`t fetch data');
          }
        }

        return Center(child: const CircularProgressIndicator());
      },
    );
  }
}
