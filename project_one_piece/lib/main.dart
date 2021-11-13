import 'package:flutter/material.dart';
import 'package:project_one_piece/screen/EditType.dart';
import 'package:project_one_piece/screen/Type.dart';
import 'package:project_one_piece/screen/addType.dart';
import 'package:project_one_piece/screen/addType/addGroup.dart';
import 'package:project_one_piece/screen/addType/addGroup/addAddGroup.dart';
import 'package:project_one_piece/screen/addType/addGroup/addViewGroup.dart';

import 'package:project_one_piece/screen/index.dart';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: index(),
      routes: {
        'index': (context) => index(),
        'addType': (context) => addType(),
        'type': (context) => type(),
        'addGroup': (context) => addGroup(),
        'addAddGroup': (context) => addAddGroup(),
        'addViewGroup': (context) => addViewGroup(),
        'editType': (context) => editType(),
        //'addLocation': (context) => addLocation(),
      },
    );
  }
}
