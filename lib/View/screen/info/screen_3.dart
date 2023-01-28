// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class screen_3 extends StatefulWidget {
  const screen_3({super.key});

  @override
  State<screen_3> createState() => _screen_3State();
}

class _screen_3State extends State<screen_3> {
  String content =
      "High blood pressure, or hypertension, is a common condition that occurs when the blood pressure in the arteries is consistently too high. It can lead to serious health problems, including heart disease, stroke, and kidney failure.\n"
      "\nCertain individuals may be at higher risk of developing high blood pressure. These include:\n"
      "\n•	Older adults: As you get older, your risk of developing high blood pressure increases.\n"
      "\n•	Those with a family history of high blood pressure: If your parents or other close relatives have high blood pressure, you may be more likely to develop it as well.\n"
      "\n•	African Americans: African Americans have a higher risk of developing high blood pressure compared to other racial groups.\n"
      "\n•	Those who are overweight or obese: Being overweight or obese can increase your risk of high blood pressure.\n"
      "\n•	Those who do not exercise regularly: Lack of physical activity can increase your risk of high blood pressure.\n"
      "\n•	Those who eat a diet high in salt: A diet that is high in salt can increase your risk of high blood pressure.\n"
      "\n•	Those who smoke: Smoking can damage the blood vessels and increase your risk of high blood pressure.\n"
      "\nIt is important to be aware of your risk factors for high blood pressure and take steps to reduce your risk. This can include maintaining a healthy weight, exercising regularly, eating a healthy diet, and not smoking. If you are at high risk of developing high blood pressure, it is important to have your blood pressure checked regularly and discuss any concerns with a healthcare provider.";

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
                    "who is at risk of high blood pressure?",
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
