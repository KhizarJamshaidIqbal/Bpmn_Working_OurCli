// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables, duplicate_ignore, prefer_final_fields, unused_import

import 'package:bpm/main.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Share/custom_BottomNavigationbar.dart';
import '../components/onboardingscreen_data.dart';
import '../../utils/colors.dart';
import '../screen/home/HomeScreen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentPage = 0;

  PageController _pageController = PageController(initialPage: 0);

//for Dots...
  AnimatedContainer dotIndicator(index) {
    return AnimatedContainer(
      margin: EdgeInsets.only(right: 5.0),
      duration: Duration(milliseconds: 500),
      height: currentPage == index ? 10 : 7,
      width: currentPage == index ? 10 : 7,
      decoration: BoxDecoration(
          color: currentPage == index
              ? globalColors.SecondaryColor
              : globalColors.UnSlectedDotsColor,
          shape: BoxShape.circle),
    );
  }

  Future setSeenonboard() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    seenOnboard = await prefs.setBool('seenOnboard', true);
    // final box = GetStorage();
    // box.write("idcounter", 0);
    // this will set seenOnboard to true when running onboard page for first time.
  }

  @override
  void initState() {
    super.initState();
    setSeenonboard();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: SafeArea(
          child: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Column(
            children: [
              currentPage > 0
                  ? Padding(
                      padding:
                          const EdgeInsets.only(right: 24, top: 37, left: 24),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              _pageController.previousPage(
                                  duration: Duration(milliseconds: 400),
                                  curve: Curves.easeInOut);
                            },
                            child: Icon(
                              Icons.arrow_back_ios_sharp,
                              color: globalColors.textColor,
                            ),
                          ),
                          Spacer(),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BottomNavigationbar(),
                                  ));
                            },
                            child: Text(
                              'Skip',
                              style: TextStyle(
                                  fontFamily: 'Inter',
                                  color: globalColors.textColor,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(right: 24, top: 37),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BottomNavigationbar(),
                                  ));
                            },
                            child: Text(
                              'Skip',
                              style: TextStyle(
                                  fontFamily: 'Inter',
                                  color: globalColors.textColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 17.0),
                            ),
                          ),
                        ],
                      ),
                    ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Expanded(
              child: PageView.builder(
            controller: _pageController,
            itemCount: onboarding_data.length,
            onPageChanged: (value) {
              setState(() {
                currentPage = value;
              });
            },
            itemBuilder: (context, index) {
              return Column(
                children: [
                  SizedBox(
                    width: 300,
                    height: 220,
                    child: Image(
                      image: AssetImage(
                        onboarding_data[index].image,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Text(
                    onboarding_data[index].title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Inter',
                        color: Color(0xff3E3E3E),
                        fontSize: 40,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    onboarding_data[index].Description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Inter',
                        color: globalColors.textColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              );
            },
          )),
          Padding(
            padding:
                const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 40.0),
            child: Row(
              children: [
                Row(
                    children: List.generate(onboarding_data.length,
                        (index) => dotIndicator(index))),
                Spacer(),
                Container(
                  height: 52,
                  width: 52,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 172, 170, 170),
                          spreadRadius: 0.5,
                          blurRadius: 2,
                          offset: Offset(0, 5), // changes position of shadow
                        )
                      ],
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [
                            0.15,
                            1,
                          ],
                          colors: [
                            Color(0xffFFA28D),
                            Color(0xffFA4382),
                          ])),
                  child: TextButton(
                      onPressed: () {
                        if (currentPage == onboarding_data.length - 1) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BottomNavigationbar(),
                              ));
                        }
                        _pageController.nextPage(
                            duration: Duration(milliseconds: 400),
                            curve: Curves.easeInOut);
                      },
                      child: Text(
                        "Next",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w400),
                      )),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
