// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class screen_6 extends StatefulWidget {
  const screen_6({super.key});

  @override
  State<screen_6> createState() => _screen_6State();
}

class _screen_6State extends State<screen_6> {
  String content =
      "Your heart rate, also known as your pulse, is the number of times your heart beats per minute. It is a measure of the strength and speed of your heart's contractions. The heart pumps blood around the body to provide oxygen and nutrients to the tissues.\n"
      "\nA normal heart rate for an adult at rest is typically between 60 and 100 beats per minute. However, this can vary depending on age, physical activity level, and other factors. For example, a highly fit person may have a lower resting heart rate compared to someone who is less active.\n"
      "\nHeart rate can be measured by feeling the pulse at the wrist, neck, or chest. It can also be measured using a device called a pulse oximeter, which is placed on the finger and measures the oxygen level in the blood.\n"
      "\nHeart rate can be affected by various factors, such as physical activity, stress, and certain medications. A heart rate that is consistently too high or too low may be a sign of a medical condition and should be evaluated by a healthcare provider.\n"
      "\nMaintaining a healthy heart rate is important for overall health. This can be achieved through regular physical activity, maintaining a healthy diet, and managing stress. It is also important to have regular check-ups with a healthcare provider to monitor heart health.\n";

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
                    "Knowledge about heart rate",
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
