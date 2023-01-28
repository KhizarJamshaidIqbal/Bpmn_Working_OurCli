// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class screen_2 extends StatefulWidget {
  const screen_2({super.key});

  @override
  State<screen_2> createState() => _screen_2State();
}

class _screen_2State extends State<screen_2> {
  String content =
      "If you are wondering whether your blood pressure is normal, it is important to have it checked by a healthcare provider. Normal blood pressure for an adult is generally considered to be a systolic pressure (the higher of the two numbers) of less than 120 mmHg and a diastolic pressure (the lower number) of less than 80 mmHg. These numbers can vary depending on age, gender, and other factors. It is important to note that blood pressure can fluctuate throughout the day and may be affected by various factors such as stress, caffeine, and exercise. A single high or low reading does not necessarily mean that you have high or low blood pressure. A diagnosis of high or low blood pressure is typically based on multiple readings taken over a period of time. If you have high blood pressure, it is important to take steps to lower it. High blood pressure, or hypertension, is a common condition that occurs when the blood pressure in the arteries is consistently too high. It can lead to serious health problems, including heart disease, stroke, and kidney failure. Lifestyle changes, such as eating a healthy diet, exercising regularly, and managing stress, can help lower blood pressure. In some cases, medication may also be necessary. On the other hand, if you have low blood pressure, it may not necessarily be a cause for concern. Low blood pressure, or hypotension, is less common than high blood pressure and occurs when the blood pressure in the arteries is consistently too low. It can cause symptoms such as dizziness, fainting, and fatigue. Low blood pressure can be caused by certain medications, dehydration, and certain medical conditions. In some cases, it may be necessary to treat low blood pressure, but in other cases, it may not cause any problems.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Info & Knowledge",
          style: TextStyle(
            fontFamily: "Inter",
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Color(0xffBCBCBC),
          ),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Icon(
              Icons.arrow_back_ios_sharp,
              color: Color(0xffBCBCBC),
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        elevation: 4,
        backgroundColor: Color(0xffFFFFFF),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Is my blood pressure normal?",
                    style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 18,
                        color: Color(0xff3E3E3E),
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25, left: 10, right: 10),
              child: SizedBox(
                child: ReadMoreText(
                  content,
                  textAlign: TextAlign.justify,
                  trimLines: 35,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: "Read More",
                  trimExpandedText: "Read Less",
                  lessStyle: TextStyle(fontWeight: FontWeight.bold),
                  moreStyle: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
