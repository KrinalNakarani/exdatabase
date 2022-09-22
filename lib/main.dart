import 'package:exdatabase/screen/exdb.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => EXDatabase(),
      },
    ),
  );
}
