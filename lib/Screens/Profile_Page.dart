import 'package:flutter/material.dart';
import 'package:smokin_joes/Widgets/AppBar.dart';

class Profile_Page extends StatelessWidget {
  Profile_Page({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: APPBAR(
        ontap: () {
          _key.currentState!.openDrawer();
        },
      ),
      body: const Center(
        child: Text("Person Profile"),
      ),
    );
  }
}
