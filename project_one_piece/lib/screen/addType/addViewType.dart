import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_one_piece/config/constant.dart';
import 'package:project_one_piece/models/anyClass.dart';
import 'package:project_one_piece/screen/addType/addGroup.dart';

class addViewType extends StatefulWidget {
  const addViewType({Key? key}) : super(key: key);

  @override
  _addViewTypeState createState() => _addViewTypeState();
}

class _addViewTypeState extends State<addViewType> {
  dynamic keyType;
  final dbFirebase = FirebaseDatabase.instance
      .reference()
      .child("Type")
      .reference()
      .reference();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FirebaseAnimatedList(
        query: dbFirebase,
        itemBuilder: (context, snapshot, animation, index) {
          return Container(
            // height: 100,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: InkWell(
                  child: Card(
                    elevation: 3,
                    child: Container(
                      alignment: Alignment.topCenter,
                      child: Column(
                        children: [
                          Image.network(
                            'https://picsum.photos/250?image=9',
                            fit: BoxFit.fill,
                          ),
                          ListTile(
                            leading: CircleAvatar(
                              backgroundColor: pColor,
                              child: Icon(
                                Icons.navigate_next,
                                color: LabelWhC,
                              ),
                            ),
                            title: Text('${snapshot.value['nameType']}'),
                            subtitle: Row(
                              children: [
                                Expanded(
                                  child: IconButton(
                                    icon: Icon(Icons.mode_edit_outlined),
                                    onPressed: () {
                                      print("แก้ไข");
                                      print(snapshot.key!);
                                      keyType = '${snapshot.key!}';
                                      Navigator.pushNamed(
                                        context,
                                        'editType',
                                        arguments: sendDataKey(
                                          keyType,
                                        ),
                                      );
                                      //updateData(snapshot.key!);
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () {
                                      // Dailog Dlete
                                      showDialog<String>(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AlertDialog(
                                          title:
                                              const Text('Alert Delate Data'),
                                          content: const Text(
                                              'Do You Want Delate Data press Ok for Delate'),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  context, 'Cancel'),
                                              child: const Text('Cancel'),
                                            ),
                                            TextButton(
                                              onPressed: () => {
                                                Navigator.pop(context, 'OK'),
                                                dbFirebase
                                                    .child(snapshot.key!)
                                                    .remove(),
                                              },
                                              child: const Text('OK'),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            trailing: Column(
                              children: [],
                            ),
                          ),
                        ],
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onTap: () {
                    keyType = '${snapshot.key}';
                    Navigator.pushNamed(
                      context,
                      'addGroup',
                      arguments: sendDataKey(
                        keyType,
                      ),
                    );
                  }),
            ),
          );
        },
      ),
    );
  }
}
