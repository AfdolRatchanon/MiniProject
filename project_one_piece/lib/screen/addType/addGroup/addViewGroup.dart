import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:project_one_piece/config/constant.dart';
import 'package:project_one_piece/models/anyClass.dart';

class addViewGroup extends StatefulWidget {
  const addViewGroup({Key? key}) : super(key: key);

  @override
  _addViewGroupState createState() => _addViewGroupState();
}

class _addViewGroupState extends State<addViewGroup> {
  dynamic keyType;
  @override
  Widget build(BuildContext context) {
    final key = ModalRoute.of(context)!.settings.arguments as sendDataKey;
    final dbFirebase = FirebaseDatabase.instance
        .reference()
        .child("Type")
        .child(key.dataKey.toString())
        .child('Group');
    return Scaffold(
      body: FirebaseAnimatedList(
        query: dbFirebase,
        itemBuilder: (context, snapshot, animation, index) {
          return Container(
            height: 100,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: InkWell(
                  child: Card(
                    elevation: 3,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: pColor,
                        child: Icon(
                          Icons.navigate_next,
                          color: LabelWhC,
                        ),
                      ),
                      title: Text('${snapshot.value['nameGroup']}'),
                      subtitle: Row(
                        children: [],
                      ),
                      trailing: Column(
                        children: [
                          Expanded(
                            child: IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                keyType = '${snapshot.key}';
                                Navigator.pushNamed(context, 'editType',
                                    arguments: keyType);
                                //print(snapshot.key!);
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
                                    title: const Text('Alert Delate Data'),
                                    content: const Text(
                                        'Do You Want Delate Data press Ok for Delate'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, 'Cancel'),
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
