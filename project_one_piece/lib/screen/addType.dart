import 'package:flutter/material.dart';
import 'package:project_one_piece/config/constant.dart';
import 'package:project_one_piece/screen/addType/addAddType.dart';
import 'package:project_one_piece/screen/addType/addViewType.dart';

class addType extends StatefulWidget {
  const addType({Key? key}) : super(key: key);

  @override
  _addTypeState createState() => _addTypeState();
}

class _addTypeState extends State<addType> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("AddType"),
          backgroundColor: appBarC,
        ),
        body: TabBarView(children: [
          addViewType(),
          addAddType(),
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
