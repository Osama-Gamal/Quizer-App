import 'package:flutter/material.dart';

class FirstLayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color(0xfffbb448),
        Color.fromARGB(255, 248, 135, 49),
      ])),
    );
  }
}
