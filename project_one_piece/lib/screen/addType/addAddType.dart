import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:project_one_piece/config/constant.dart';

class addAddType extends StatefulWidget {
  const addAddType({Key? key}) : super(key: key);

  @override
  _addAddTypeState createState() => _addAddTypeState();
}

class _addAddTypeState extends State<addAddType> {
  var nameType;
  final addTypeKey = GlobalKey<FormState>();
  final dbFirebase = FirebaseDatabase.instance.reference().child('Type');

  Future<void> createData() async {
    await dbFirebase.push().set({
      'nameType': nameType,
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
    return Scaffold(
      body: Form(
        key: addTypeKey,
        child: Container(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Column(
              children: [
                txtNameType(),
                btnSubmit(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget txtNameType() {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
      child: TextFormField(
        style: TextStyle(
          fontSize: 24.0,
          color: pColor,
        ),
        decoration: InputDecoration(
          labelText: 'NameType:',
          icon: Icon(Icons.account_circle_outlined),
          hintText: 'Input your nameType',
        ),
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'กรุณากรอกชื่อปรเเภท';
          } else if (value.length < 2) {
            return "กรุณากรอกข้อมูลมากกว่า 2 ตัวอักษร";
          }
        },
        onSaved: (String? value) {
          nameType = value!.trim();
        },
      ),
    );
  }

  Widget btnSubmit() => ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: pColor,
        ),
        onPressed: () {
          if (addTypeKey.currentState!.validate()) {
            addTypeKey.currentState!.save();
            createData();
            addTypeKey.currentState!.reset();
          }
        },
        child: Text('ADD'),
      );
}
