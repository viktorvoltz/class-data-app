import 'package:flutter/material.dart';
import '../services/http.dart';

class DataScreen extends StatefulWidget {
  const DataScreen({ Key? key }) : super(key: key);

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
                child: Column(
                  children: [
                    ListTile(
                      leading: const Text('Level'),
                      title: Text(snapshot.data![index]['level'].toString()),
                    ),
                    ListTile(
                      leading: const Text('Result'),
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

        return Center(child: const CircularProgressIndicator());
      },
    );
  }
}