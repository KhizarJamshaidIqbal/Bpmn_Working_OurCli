// ignore_for_file: prefer_const_constructors, duplicate_ignore, use_build_context_synchronously, empty_catches

import 'dart:async';
import 'package:bpm/ControllerProvider/bpprovider/bpchartprovider.dart';
import 'package:bpm/ControllerProvider/sugerprovider.dart';
import 'package:bpm/ControllerProvider/sugerprovider/sugerchartprovider.dart';
import 'package:bpm/ControllerProvider/sugerprovider/sugervalueprovider.dart';
import 'package:bpm/services/sugerServices.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../main.dart';
import '../../services/sqlite_service.dart';
import '../Share/custom_BottomNavigationbar.dart';
import '../onboardingscreen/OnboardingScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      try {
        final sugerProvider =
            Provider.of<SugerProvider>(context, listen: false);
        final data = await SqliteService.getItems();
        for (var item in data) {
          sugerProvider.setSugerList(item);
        }
        final bpChartProvider =
            Provider.of<BpChartProvider>(context, listen: false);
        bpChartProvider.setChart(context);
        //Now here we are fetching data from suger Table
        final sugerData = await SugerServices.getItems();
        final sugerValueProvider =
            Provider.of<SugerValueProvider>(context, listen: false);
        for (var item in sugerData) {
          sugerValueProvider.setSugerList(item);
        }
        final chartProvider =
            Provider.of<SugerChartProvider>(context, listen: false);
        chartProvider.setChart(context);
        Timer(
            Duration(seconds: 3),
            () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => seenOnboard == true
                        ? BottomNavigationbar()
                        : OnboardingScreen())));
      } catch (e) {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          Spacer(),
          SizedBox(
              height: 145,
              width: 160,
              child: Image.asset("assets/images/SC_2.png")),
          Spacer(),
          Text(
            "This action may contain ads.",
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w400,
                color: Color(0xffBCBCBC)),
          ),
          SizedBox(
            height: 86,
          )
        ],
      ),
    ));
  }
}
