import 'package:flutter/material.dart';
import 'package:matrix4_transform/matrix4_transform.dart';

late SecondLayerState secondLayerState;

class SecondLayer extends StatefulWidget {
  @override
  SecondLayerState createState() => SecondLayerState();

  // openTab() => createState().openTab();
}

class SecondLayerState extends State<SecondLayer> {
  double xoffSet = 0;
  double yoffSet = 0;
  double angle = 0;

  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    secondLayerState = this;
    print("Done Rrrrrrrrrrrrrrrrrr");
    return AnimatedContainer(
        transform: Matrix4Transform()
            .translate(x: xoffSet, y: yoffSet)
            .rotate(angle)
            .matrix4,
        duration: const Duration(milliseconds: 550),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(255, 241, 196, 128),
        ),
        child: Column(
          children: [
            Row(
              children: [],
            )
          ],
        ));
  }
}
