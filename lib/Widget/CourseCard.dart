import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.only(bottom: 8),
            height: size.height * 0.15,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: Color.fromARGB(115, 158, 158, 158),
                  offset: Offset(0, 1),
                )
              ],
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(9),
                  child: Row(
                    children: const [
                      Text(
                        "Machine Learning",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "   | 7 Chapters",
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      Text(
                        "25/300",
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 9),
                  child: Text(
                    "Machine learning (ML) is a field of inquiry devoted to understanding and building methods that 'learn', that is, methods that leverage data to improve performance on some set of tasks. It is seen as a part of artificial intelligence.",
                    maxLines: 3,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                      color: Color.fromARGB(255, 182, 182, 182),
                    ),
                  ),
                ),
                const Expanded(
                  child: SizedBox(
                    height: 30,
                  ),
                ),
                LinearPercentIndicator(
                  width: size.width * 0.8,
                  alignment: MainAxisAlignment.start,
                  animation: true,
                  lineHeight: 5.0,
                  animationDuration: 1000,
                  percent: 0.8,
                  animateFromLastPercent: true,
                  barRadius: const Radius.circular(10),
                  trailing: const Text(
                    "80.0%",
                    style: TextStyle(fontSize: 12),
                  ),
                  linearGradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment(0.8, 1),
                    colors: <Color>[
                      Color(0xfff7892b),
                      Color(0xfffbb448),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
