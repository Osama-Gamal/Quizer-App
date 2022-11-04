import 'package:flutter/material.dart';
import 'package:quizer/Drawer/FirstLayer.dart';
import 'package:quizer/Drawer/SecondLayer.dart';
import 'package:quizer/Drawer/ThirdLayer.dart';
import 'package:quizer/Drawer/MainPage.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FirstLayer(),
          SecondLayer(),
          ThirdLayer(),
          MainPage(),
        ],
      ),
    );
  }
}
