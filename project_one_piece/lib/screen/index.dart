import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:project_one_piece/config/constant.dart';

class index extends StatefulWidget {
  const index({Key? key}) : super(key: key);

  @override
  _indexState createState() => _indexState();
}

class _indexState extends State<index> {
  final dbFirebase = FirebaseDatabase.instance.reference().child("Type");

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: backgroundC,
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text('User Picture'),
            ),
            ListTile(
              title: Text("Name"),
            ),
            ListTile(
              title: Text("Email"),
            ),
            ListTile(
              title: Text("Logout"),
              leading: Icon(
                Icons.logout,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: appBarC,
        title: Text("AppBar One Piece"),
        iconTheme: IconThemeData(color: menuC),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.03,
              ),
              ElevatedButton(
                onPressed: () {
                  print("AddType Pass");
                  Navigator.pushNamed(context, 'addType');
                },
                child: Text("AddType"),
                style: ElevatedButton.styleFrom(
                  primary: pColor,
                  fixedSize: Size(size.width * 0.8, size.height * 0.05),
                  shape: StadiumBorder(),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  print("Type Pass");
                  Navigator.pushNamed(context, 'type');
                },
                child: Text("View"),
                style: ElevatedButton.styleFrom(
                  primary: /*Colors.orange*/ pColor,
                  fixedSize: Size(size.width * 0.8, size.height * 0.05),
                  shape: StadiumBorder(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
