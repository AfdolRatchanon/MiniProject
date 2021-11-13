import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:project_one_piece/config/constant.dart';
import 'package:project_one_piece/models/anyClass.dart';

class addAddGroup extends StatefulWidget {
  const addAddGroup({Key? key}) : super(key: key);

  @override
  _addAddGroupState createState() => _addAddGroupState();
}

class _addAddGroupState extends State<addAddGroup> {
  var nameGroup;
  final addGroupKey = GlobalKey<FormState>();

  Future<void> createData(dynamic db) async {
    await db.push().set({
      'nameGroup': nameGroup,
    }).then((dynamic value) {
      print(value);
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Add Type Success'),
          content: const Text('You add Data Success'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }).catchError((onError) {
      print(onError.code);
    });
  }

  @override
  Widget build(BuildContext context) {
    final key = ModalRoute.of(context)!.settings.arguments as sendDataKey;
    final dbFirebase = FirebaseDatabase.instance
        .reference()
        .child("Type")
        .child(key.dataKey.toString())
        .child('Group');
    return Scaffold(
      body: Form(
        key: addGroupKey,
        child: Container(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Column(
              children: [
                txtnameGroup(),
                btnSubmit(dbFirebase),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget txtnameGroup() {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
      child: TextFormField(
        style: TextStyle(
          fontSize: 24.0,
          color: pColor,
        ),
        decoration: InputDecoration(
          labelText: 'nameGroup:',
          icon: Icon(Icons.account_circle_outlined),
          hintText: 'Input your nameGroup',
        ),
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'กรุณากรอกชื่อปรเเภท';
          } else if (value.length < 2) {
            return "กรุณากรอกข้อมูลมากกว่า 2 ตัวอักษร";
          }
        },
        onSaved: (String? value) {
          nameGroup = value!.trim();
        },
      ),
    );
  }

  Widget btnSubmit(dynamic db) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: pColor,
        ),
        onPressed: () {
          if (addGroupKey.currentState!.validate()) {
            addGroupKey.currentState!.save();
            createData(db);
            addGroupKey.currentState!.reset();
          }
        },
        child: Text('ADD'),
      );
}
