// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class screen_5 extends StatefulWidget {
  const screen_5({super.key});

  @override
  State<screen_5> createState() => _screen_5State();
}

class _screen_5State extends State<screen_5> {
  String content =
      "There are several signs and symptoms that may indicate someone has diabetes. These include:\n"
      "\n•	Increased thirst: People with diabetes may feel very thirsty and may drink large amounts of fluids.\n"
      "\n•	Frequent urination: Because the body is trying to get rid of excess glucose (sugar) through urine, people with diabetes may need to urinate more frequently, especially at night.\n"
      "\n•	Hunger: People with diabetes may feel very hungry, even after eating.\n"
      "\n•	Fatigue: Diabetes can cause fatigue, as the body is unable to properly use and store energy.\n"
      "\n•	Blurred vision: High levels of glucose in the blood can affect the lens of the eye and cause blurry vision.\n"
      "\n•	Slow healing: High blood sugar levels can interfere with the body's ability to heal cuts and wounds.\n"
      "\n•	Dry skin: Diabetes can cause dry, itchy skin.\n"
      "\n•	Tingling or numbness in the hands and feet: High blood sugar levels can cause nerve damage, leading to tingling or numbness in the hands and feet.\n"
      "\n•	Frequent infections: People with diabetes may be more prone to infections, such as bladder, kidney, or skin infections.\n"
      "\nIf you are experiencing any of these symptoms, it is important to see a healthcare provider for evaluation and testing. It is also important to note that some people with diabetes may not have any symptoms and may only be diagnosed during a routine medical check-up.\n";

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
                    "How Do I know if anyone have diabetes?",
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
