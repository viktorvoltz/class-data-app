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
    _futureList = GetData();
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
                          title: Text(snapshot.data![index]['level'].toString()),
                          trailing:
                              Text(snapshot.data![index]['result'].toString()),
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
          return Text('${snapshot.error}');
        }

        return Center(child: const CircularProgressIndicator());
      },
    );
  }
}
