// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class screen_1 extends StatefulWidget {
  const screen_1({super.key});

  @override
  State<screen_1> createState() => _screen_1State();
}

class _screen_1State extends State<screen_1> {
  String content =
      "Blood pressure is a measure of the force of blood pushing against the walls of the arteries as it is pumped around the body by the heart. It is expressed in terms of two numbers: systolic blood pressure and diastolic blood pressure.\n"
      "\nSystolic blood pressure is the higher of the two numbers and represents the pressure in the arteries when the heart beats, or contracts. Diastolic blood pressure is the lower number and represents the pressure in the arteries when the heart is resting, or between beats.\n"
      "\nNormal blood pressure for an adult is generally considered to be a systolic pressure of less than 120 mmHg and a diastolic pressure of less than 80 mmHg. These numbers can vary depending on age, gender, and other factors. For example, normal blood pressure for a man in his 60s may be slightly higher than for a woman in her 20s.\n"
      "\nHigh blood pressure, or hypertension, is a common condition that occurs when the blood pressure in the arteries is consistently too high. It can be caused by a variety of factors, including unhealthy diet, lack of exercise, obesity, and stress. High blood pressure can lead to serious health problems, including heart disease, stroke, and kidney failure.\n"
      "\nLow blood pressure, or hypotension, is less common than high blood pressure and occurs when the blood pressure in the arteries is consistently too low. It can be caused by certain medications, dehydration, and certain medical conditions. Low blood pressure can cause symptoms such as dizziness, fainting, and fatigue.\n"
      "\nBlood pressure can be measured using a blood pressure monitor, which consists of an inflatable cuff that is placed around the upper arm and a device that measures the pressure in the cuff. It is important to have regular blood pressure checks, as high or low blood pressure may not have any symptoms.\n"
      "\nThere are several ways to manage blood pressure, including lifestyle changes such as eating a healthy diet, exercising regularly, and managing stress. In some cases, medication may also be necessary to help control blood pressure.\n"
      "\nIt is important to pay attention to blood pressure and take steps to maintain normal levels to reduce the risk of health problems. This includes regular check-ups with a healthcare provider, monitoring blood pressure at home, and making necessary lifestyle changes.\n"
      "\nIn summary, blood pressure is a measure of the force of blood in the arteries. Normal blood pressure is considered to be less than 120/80 mmHg. High blood pressure, or hypertension, can lead to serious health problems, while low blood pressure, or hypotension, can cause symptoms such as dizziness and fainting. Blood pressure can be managed through lifestyle changes and, in some cases, medication. It is important to have regular blood pressure checks and take steps to maintain normal levels.\n";

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
                    "Learn More About Blood Pressure",
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
