// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Question {
  String question;

  Question({
    required this.question,
  });
}

final List<Question> questionList = [
  Question(question: "Q1"),
  Question(question: "Q2"),
  Question(question: "Q3"),
  Question(question: "Q4"),
  Question(question: "Q5"),
  Question(question: "Q6"),
  Question(question: "Q7"),
  Question(question: "Q8"),
];

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ),
        ],
        elevation: 0,
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        SizedBox(
          height: 60,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: questionList.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                  radius: 18,
                  backgroundColor: Colors.orange,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        //Auto playing carousel
        CarouselSlider(
          items: questionList.map((_) {
            return Builder(builder: (BuildContext context) {
              return Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.72,
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Qestion ${_.question}/${questionList.length}",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              Icon(Icons.more_vert)
                            ],
                          ),
                          Text(_.question),
                          Flexible(
                            child: ListView.builder(
                              itemCount: 4,
                              itemBuilder: (context, index) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: Container(
                                  height: 50,
                                  width: MediaQuery.of(context).size.width * .7,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      border: Border.all(
                                          color: Colors.orange,
                                          width: 2,
                                          style: BorderStyle.solid)),
                                  child: Center(
                                      child: Text(
                                    "A. Horse",
                                    // textAlign: TextAlign.right,
                                  )),
                                ),
                              ),
                            ),
                          ),
                          Text("Skip Question >>")
                        ],
                      ),
                    ),
                  ),
                ],
              );
            });
          }).toList(),
          options: CarouselOptions(
            initialPage: 0,
            aspectRatio: 0.7,
            enableInfiniteScroll: false,
            // height: 500,
            viewportFraction: 0.8,
            // autoPlay: true,
            enlargeCenterPage: true,
          ),
        )
      ]),
    );
  }
}
