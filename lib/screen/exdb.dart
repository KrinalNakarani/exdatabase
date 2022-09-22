import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class ExDB {
  Future<Database> initDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, "QuotesDatabase.sqlite");

    bool ischeck = await File(path).exists();

    if (!ischeck) {
      ByteData byteData =
          await rootBundle.load("assets/db/QuotesDatabase.sqlite");

      var data = byteData.buffer.asUint8List();

      await File(path).writeAsBytes(data, flush: true);
    }
    return await openDatabase(path);
  }

  void readDB() async {
    var database = await initDB();
    String qry = "SELECT * FROM categorytable";
    List<Map<String, dynamic>> d1 = await database.rawQuery(qry);
    print(d1);
  }
  void readDB1() async {
    var database = await initDB();
    String qry = "SELECT * FROM quotestable WHERE catid = 1";
    List<Map<String, dynamic>> d1 = await database.rawQuery(qry);
    print(d1);
  }
}

class EXDatabase extends StatefulWidget {
  const EXDatabase({Key? key}) : super(key: key);

  @override
  State<EXDatabase> createState() => _EXDatabaseState();
}

class _EXDatabaseState extends State<EXDatabase> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            ElevatedButton(
              onPressed: (){
                ExDB().readDB();
              },
              child: Text("ExDatabase"),
            ),
            ElevatedButton(
              onPressed: (){
                ExDB().readDB1();
              },
              child: Text("ExDatabase1"),
            ),
          ],
        ),
      ),
    );
  }
}
