import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../Dialogs/depatrment.dart';
import '../Widget/CourseCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String departmentValue = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      var collection = FirebaseFirestore.instance.collection('user');
      final user = FirebaseAuth.instance.currentUser;
      var docSnapshot = await collection.doc(user!.uid).get().then((doc) {
        // print("${doc.get("department")}");
        departmentValue = doc.get("department");
        print(departmentValue);
      });
      // Map<String, dynamic>? data = docSnapshot.data();
      // print("doc data is $data");
      if (departmentValue == "none") {
        await showDialog(
          context: context,
          builder: (BuildContext context) => DepartmentDialog(),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    var index = 0;
    for (var i = 0; i < 4; i++) {}
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            right: 10,
            left: 10,
          ),
          child: CarouselSlider(
            options: CarouselOptions(
              height: 145.0,
              autoPlay: true,
            ),
            items: [
              "https://www.spec-india.com/wp-content/uploads/2020/11/Best-Programming-Languages-2021.png",
              "https://www.spec-india.com/wp-content/uploads/2022/02/Data-Science-Programming-Languages.png",
              "https://techgeekbuzz.com/media/post_images/uploads/2020/10/Data-Science-Programming-Languages.jpg",
              "https://techgeekbuzz.com/media/post_images/uploads/2019/03/Top-Programming-Languages-to-Learn.jpg",
              "https://livecodestream.dev/post/5-recommended-programming-languages-to-start-your-coding-journey/featured.jpg"
            ].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        )),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        i,
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ),
        CourseCard(size: size),
        CourseCard(size: size),
        CourseCard(size: size),
      ],
    );
  }
}
