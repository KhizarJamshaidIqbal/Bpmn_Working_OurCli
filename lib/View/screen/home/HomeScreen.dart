// ignore_for_file: implementation_imports, unnecessary_import, unused_import, prefer_const_constructors, file_names, avoid_print, unused_field, prefer_final_fields, sized_box_for_whitespace

import 'dart:async';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:bpm/View/screen/bloodpreasure/bloodpressure.dart';
import 'package:bpm/View/screen/bmi/addbmi.dart';
import 'package:bpm/View/screen/suger/bloodsuger.dart';
import 'package:bpm/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import '../../../ControllerProvider/bottombarindexprovider.dart';
import '../../Share/custom_BottomNavigationbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;
  InterstitialAd? interstitialAd;

  BannerAd? bannerAd;
  bool isloaded = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: "ca-app-pub-3940256099942544/6300978111",
        listener: BannerAdListener(
          onAdLoaded: (ad) {
            setState(() {
              isloaded = true;
            });
            print("Banner is Loaded");
          },
          onAdFailedToLoad: (ad, error) {
            ad.dispose();
          },
        ),
        request: const AdRequest());
    bannerAd!.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: globalColors.primaryColor,
        elevation: 4,
        bottomOpacity: 1.5,
        title: Text(
          "Tracker",
          style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: globalColors.textColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 32),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 113,
                  width: 132,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    color: Colors.white,
                    // ignore: prefer_const_literals_to_create_immutables
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 243, 238, 238),
                        blurRadius: 4.1,
                        spreadRadius: 1.6,
                        offset: Offset(
                            0.0, 0.0), // shadow direction: bottom right
                      )
                    ],
                  ),
                  child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      InkWell(
                        onTap: () {
                          InterstitialAd.load(
                      adUnitId: "ca-app-pub-3940256099942544/1033173712",
                      request: const AdRequest(),
                      adLoadCallback: InterstitialAdLoadCallback(
                        onAdLoaded: (ad) {
                          interstitialAd = ad;
                          ad.show();

                          interstitialAd?.fullScreenContentCallback =
                              FullScreenContentCallback(
                                  onAdDismissedFullScreenContent: (ad) {
                            interstitialAd?.dispose();
                            ad.dispose();
                           
                          }, onAdFailedToShowFullScreenContent: (ad, err) {
                            ad.dispose();
                            interstitialAd?.dispose();
                          });
                        },
                        onAdFailedToLoad: (err) {
                          interstitialAd?.dispose();
                        },
                      ),
                    );
                   Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => BloodSuger(),
                              ),
                            );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 12, bottom: 15),
                          child: SizedBox(
                              height: 50,
                              width: 50,
                              child: Image(
                                  image: AssetImage(
                                      "assets/images/diabetes-test_3.png"))),
                        ),
                      ),
                      Text(
                        "Blood Sugar",
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    InterstitialAd.load(
                      adUnitId: "ca-app-pub-3940256099942544/1033173712",
                      request: const AdRequest(),
                      adLoadCallback: InterstitialAdLoadCallback(
                        onAdLoaded: (ad) {
                          interstitialAd = ad;
                          ad.show();

                          interstitialAd?.fullScreenContentCallback =
                              FullScreenContentCallback(
                                  onAdDismissedFullScreenContent: (ad) {
                            interstitialAd?.dispose();
                            ad.dispose();
                           
                          }, onAdFailedToShowFullScreenContent: (ad, err) {
                            ad.dispose();
                            interstitialAd?.dispose();
                          });
                        },
                        onAdFailedToLoad: (err) {
                          interstitialAd?.dispose();
                        },
                      ),
                    );
                    Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => AddBmi(),
                              ),
                            );
                  },
                  child: Container(
                    height: 113,
                    width: 132,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      color: Colors.white,
                      // ignore: prefer_const_literals_to_create_immutables
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 243, 238, 238),
                          blurRadius: 4.1,
                          spreadRadius: 1.6,
                          offset: Offset(
                              0.0, 0.0), // shadow direction: bottom right
                        )
                      ],
                    ),
                    child: Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 12, bottom: 15),
                          child: SizedBox(
                              height: 50,
                              width: 50,
                              child: Image(
                                  image: AssetImage("assets/images/bmi3.png"))),
                        ),
                        Text(
                          "BMI",
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                InterstitialAd.load(
                      adUnitId: "ca-app-pub-3940256099942544/1033173712",
                      request: const AdRequest(),
                      adLoadCallback: InterstitialAdLoadCallback(
                        onAdLoaded: (ad) {
                          interstitialAd = ad;
                          ad.show();

                          interstitialAd?.fullScreenContentCallback =
                              FullScreenContentCallback(
                                  onAdDismissedFullScreenContent: (ad) {
                            interstitialAd?.dispose();
                            ad.dispose();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => BloodPressure(),
                              ),
                            );
                          }, onAdFailedToShowFullScreenContent: (ad, err) {
                            ad.dispose();
                            interstitialAd?.dispose();
                          });
                        },
                        onAdFailedToLoad: (err) {
                          interstitialAd?.dispose();
                        },
                      ),
                    );
                final bottomBarIndexProvider =
                    Provider.of<BottomBarIndexProvider>(context, listen: false);
                bottomBarIndexProvider.setBottomIndex(index: 1);
              },
              child: Container(
                height: 113,
                width: MediaQuery.of(context).size.width * .9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: globalColors.primaryColor,
                  // ignore: prefer_const_literals_to_create_immutables
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 243, 238, 238),
                      blurRadius: 4.1,
                      spreadRadius: 1.6,
                      offset:
                          Offset(0.0, 0.0), // shadow direction: bottom right
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: 57,
                          width: 64,
                          child: Image(
                              image: AssetImage("assets/images/Group_67.png"))),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(
                              "Blood Pressure",
                              style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "Track your blood pressure",
                              style: TextStyle(
                                  color: globalColors.BlackColor,
                                  fontFamily: 'Inter',
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Spacer(),
            isloaded
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width * .9,
                      // decoration: BoxDecoration(
                      //   color: globalColors.AddColor,
                      // ),
                      child: AdWidget(ad: bannerAd!),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width * .9,
                      decoration: BoxDecoration(
                        color: globalColors.AddColor,
                      ),
                      child: Center(
                          child: Text(
                        'Ad',
                        style: TextStyle(
                            color: globalColors.BlackColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Inter'),
                      )),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
