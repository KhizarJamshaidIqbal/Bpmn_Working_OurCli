// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class screen_4 extends StatefulWidget {
  const screen_4({super.key});

  @override
  State<screen_4> createState() => _screen_4State();
}

class _screen_4State extends State<screen_4> {
  String content =
      "High blood pressure, or hypertension, is a common condition that occurs when the blood pressure in the arteries is consistently too high. It can lead to serious health problems, including heart disease, stroke, and kidney failure.\n"
      "\nThere are several steps that you can take to help prevent high blood pressure:\n"
      "\n•	Maintain a healthy weight: Being overweight or obese can increase your risk of high blood pressure. Losing excess weight through diet and exercise can help lower your blood pressure.\n"
      "\n•	Exercise regularly: Regular physical activity can help lower blood pressure and improve overall health. Aim for at least 150 minutes of moderate-intensity exercise per week.\n"
      "\n•	Eat a healthy diet: A diet that is rich in fruits, vegetables, and whole grains and low in sodium, saturated fat, and cholesterol can help lower blood pressure.\n"
      "\n•	Limit alcohol intake: Heavy alcohol consumption can contribute to high blood pressure. It is recommended to limit alcohol to no more than one drink per day for women and two drinks per day for men.\n"
      "\n•	Quit smoking: Smoking can damage the blood vessels and increase your risk of high blood pressure. Quitting smoking can help lower your blood pressure and reduce your risk of other health problems.\n"
      "\n•	Manage stress: Chronic stress can contribute to high blood pressure. Finding healthy ways to manage stress, such as through exercise, meditation, or talking to a mental health professional, can help lower blood pressure.\n"
      "\n•	Take medications as prescribed: If you have been prescribed blood pressure medication, it is important to take it as directed. Do not stop taking your medication without first consulting with your healthcare provider.\n"
      "\nBy making lifestyle changes and following your healthcare provider's recommendations, you can help prevent high blood pressure and maintain healthy blood pressure levels.\n";

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
                    "How can I prevent high blood pressure?",
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
