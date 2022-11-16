import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

enum Departments { IT, CS, IS, MM }

class DepartmentDialog extends StatefulWidget {
  DepartmentDialog({super.key});

  @override
  State<DepartmentDialog> createState() => _DepartmentDialogState();
}

class _DepartmentDialogState extends State<DepartmentDialog> {
  Departments radioValue = Departments.IT;

  // List<String> departments = [
  var collection = FirebaseFirestore.instance.collection('user');
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: AlertDialog(
        // backgroundColor: Colors.blueAccent,
        title: Text('Please choose your Department'),
        content: Column(
          children: [
            ListTile(
              title: Text("IT"),
              leading: Radio(
                value: Departments.IT,
                groupValue: radioValue,
                onChanged: (value) => setState(() {
                  radioValue = value!;
                  collection
                      .doc(user!.uid)
                      .update({"department": radioValue.toString()});
                  Navigator.pop(context);
                }),
              ),
            ),
            ListTile(
              title: Text("CS"),
              leading: Radio(
                value: Departments.CS,
                groupValue: radioValue,
                onChanged: (value) => setState(() {
                  radioValue = value!;
                  collection
                      .doc(user!.uid)
                      .update({"department": radioValue.toString()});
                  Navigator.pop(context);
                }),
              ),
            ),
            ListTile(
              title: Text("IS"),
              leading: Radio(
                value: Departments.IS,
                groupValue: radioValue,
                onChanged: (value) => setState(() {
                  radioValue = value!;
                  collection
                      .doc(user!.uid)
                      .update({"department": radioValue.toString()});
                  Navigator.pop(context);
                }),
              ),
            ),
            ListTile(
              title: Text("MM"),
              leading: Radio(
                value: Departments.MM,
                groupValue: radioValue,
                onChanged: (value) => setState(() {
                  radioValue = value!;
                  collection
                      .doc(user!.uid)
                      .update({"department": radioValue.toString()});
                  Navigator.pop(context);
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
