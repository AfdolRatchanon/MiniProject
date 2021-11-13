import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:project_one_piece/config/constant.dart';
import 'package:project_one_piece/models/anyClass.dart';

class editType extends StatefulWidget {
  const editType({Key? key}) : super(key: key);

  @override
  _editTypeState createState() => _editTypeState();
}

class _editTypeState extends State<editType> {
  Future<void> updateData(String keyType, dynamic db, String nameType) async {
    try {
      await db.child(keyType).update({
        'nameType': nameType,
      }).then((value) {
        print("Success");
      }).catchError((onError) {
        print(onError.code);
        print(onError.massage);
      });
    } catch (e) {
      print(e);
    }
  }

  var nameType;
  final addTypeKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final keyType = ModalRoute.of(context)!.settings.arguments as sendDataKey;
    final dbFirebase = FirebaseDatabase.instance.reference().child('Type');
    final dbFirebase2 = FirebaseDatabase.instance.reference().child('Type');
    return Scaffold(
      appBar: AppBar(
        title: Text("EditType"),
      ),
      body: Form(
        key: addTypeKey,
        child: FirebaseAnimatedList(
          query: dbFirebase,
          itemBuilder: (context, snapshot, animation, index) {
            return Container(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextFormField(
                      style: TextStyle(
                        fontSize: 24.0,
                        color: pColor,
                      ),
                      decoration: InputDecoration(
                        labelText: 'Type Name',
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
                      initialValue: '${snapshot.value['nameType']}',
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: pColor,
                      ),
                      onPressed: () {
                        if (addTypeKey.currentState!.validate()) {
                          addTypeKey.currentState!.save();
                          updateData(snapshot.key!, dbFirebase2, nameType);
                          //addTypeKey.currentState!.reset();
                          //addTypeKey.currentState!.toString();
                        }
                      },
                      child: Text('Update'),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
