import 'package:flutter/material.dart';
import 'package:matrix4_transform/matrix4_transform.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:quizer/Drawer/SecondLayer.dart';
import 'package:quizer/Pages/HomePage.dart';
import 'package:quizer/Widget/BottomNavDrawer.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => new _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  double xoffSet = 0;
  double yoffSet = 0;
  double angle = 0;
  bool isOpen = false;
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    //const size = 200.0;
    final Size size = MediaQuery.of(context).size;
    return AnimatedContainer(
        transform: Matrix4Transform()
            .translate(x: xoffSet, y: yoffSet)
            .rotate(angle)
            .matrix4,
        duration: const Duration(milliseconds: 250),
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xfffbb448),
                    Color(0xfff7892b),
                  ]),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Center(
                child: SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: 0.082 * size.height,
                          child: Row(
                            children: [
                              IconButton(
                                iconSize: 35,
                                icon: const Icon(
                                  Icons.menu,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (!isOpen) {
                                      xoffSet = 150;
                                      yoffSet = 80;
                                      angle = -0.2;
                                      isOpen = true;
                                      secondLayerState.setState(() {
                                        secondLayerState.xoffSet = 122;
                                        secondLayerState.yoffSet = 110;
                                        secondLayerState.angle = -0.275;
                                      });
                                    } else {
                                      xoffSet = 0;
                                      yoffSet = 0;
                                      angle = 0;
                                      isOpen = false;
                                      secondLayerState.setState(() {
                                        secondLayerState.xoffSet = 0;
                                        secondLayerState.yoffSet = 0;
                                        secondLayerState.angle = 0;
                                      });
                                    }
                                  });
                                },
                              ),
                              Flexible(flex: 2, child: Container()),
                              RichText(
                                textAlign: TextAlign.center,
                                text: const TextSpan(
                                    text: 'Q',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                    children: [
                                      TextSpan(
                                        text: 'ui',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 30),
                                      ),
                                      TextSpan(
                                        text: 'zer',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 30),
                                      ),
                                    ]),
                              ),
                              Flexible(flex: 1, child: Container()),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: CircularPercentIndicator(
                                  radius: 15.0,
                                  lineWidth: 2.0,
                                  percent: 0.7,
                                  animation: true,
                                  animateFromLastPercent: true,
                                  center: const Icon(
                                    Icons.person_pin,
                                    size: 20.0,
                                    color: Colors.blue,
                                  ),
                                  backgroundColor:
                                      const Color.fromARGB(255, 216, 216, 216),
                                  progressColor: Colors.blue,
                                ),
                              ),
                              IconButton(
                                  onPressed: (() => {}),
                                  icon: const Icon(
                                    Icons.more,
                                    color: Colors.white,
                                    size: 20,
                                  )),
                            ],
                          ),
                        ),
                        Stack(
                          children: [
                            Container(
                                height: size.height * 0.8854,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(18),
                                      topRight: Radius.circular(18)),
                                ),
                                child: Container(
                                  margin: EdgeInsets.only(top: 12),
                                  child: HomePage(),
                                )),
                            BottomNavDrawer(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )));
  }
}
