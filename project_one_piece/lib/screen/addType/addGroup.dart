import 'package:flutter/material.dart';
import 'package:project_one_piece/config/constant.dart';
import 'package:project_one_piece/screen/addType/addGroup/addAddGroup.dart';
import 'package:project_one_piece/screen/addType/addGroup/addViewGroup.dart';

class addGroup extends StatefulWidget {
  const addGroup({Key? key}) : super(key: key);

  @override
  _addGroupState createState() => _addGroupState();
}

class _addGroupState extends State<addGroup> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("AddGroup"),
          backgroundColor: appBarC,
        ),
        body: TabBarView(children: [
          addViewGroup(),
          addAddGroup(),
        ]),
        bottomNavigationBar: Container(
          color: Colors.amber,
          child: TabBar(
            indicatorColor: Colors.black,
            labelColor: LabelWhC,
            tabs: [
              Tab(
                text: "Edit Type",
              ),
              Tab(
                text: "Add Type",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
