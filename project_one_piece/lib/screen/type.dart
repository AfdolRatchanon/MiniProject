import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:project_one_piece/config/constant.dart';

class type extends StatefulWidget {
  const type({Key? key}) : super(key: key);

  @override
  _typeState createState() => _typeState();
}

class _typeState extends State<type> {
  final dbFirebase = FirebaseDatabase.instance.reference().child("Type");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AppBar Type"),
        backgroundColor: appBarC,
      ),
      body: FirebaseAnimatedList(
        query: dbFirebase,
        itemBuilder: (context, snapshot, animation, index) {
          return Container(
            height: 100,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: pColor,
                ),
                onPressed: () {},
                child: Text('${snapshot.value['nameType']}'),
              ),
            ),
          );
          //Text('${snapshot.value['product']}');
        },
      ),
    );
  }
}
