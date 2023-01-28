// ignore_for_file: prefer_const_constructors, duplicate_ignore, file_names, avoid_print

import 'package:bpm/View/screen/info/screen_1.dart';
import 'package:bpm/View/screen/info/screen_2.dart';
import 'package:bpm/View/screen/info/screen_3.dart';
import 'package:bpm/View/screen/info/screen_4.dart';
import 'package:bpm/View/screen/info/screen_5.dart';
import 'package:bpm/View/screen/info/screen_6.dart';
import 'package:bpm/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class InfoKnowledge extends StatefulWidget {
  const InfoKnowledge({super.key});

  @override
  State<InfoKnowledge> createState() => _InfoKnowledgeState();
}

class _InfoKnowledgeState extends State<InfoKnowledge> {
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
        // ignore: prefer_const_constructors
        title: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Text(
            "Info & Knowledge",
            // ignore: prefer_const_constructors
            style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: globalColors.textColor),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 32),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
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
                          MaterialPageRoute(builder: (context) => screen_1()),
                        );
                      },
                      child: Container(
                        height: 150, width: 150,
                        // ignore: prefer_const_constructors
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/Group_34.png"),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            )),
                        child: Column(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 13, right: 100),
                              child: SizedBox(
                                  height: 28,
                                  width: 31,
                                  child: Image(
                                      image: AssetImage(
                                          "assets/images/Group_33.png"))),
                            ),
                            Spacer(),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 13, left: 11),
                              child: Text("Learn about blood pressure",
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: globalColors.primaryColor)),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 12,
                ),
                Column(
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
                          MaterialPageRoute(builder: (context) => screen_2()),
                        );
                      },
                      child: Container(
                        height: 150, width: 150,
                        // ignore: prefer_const_constructors
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/Group_34.png"),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            )),
                        child: Column(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Padding(
                                padding:
                                    const EdgeInsets.only(right: 100, top: 13),
                                child: SizedBox(
                                    height: 28,
                                    width: 31,
                                    child: Image(
                                        image: AssetImage(
                                            "assets/images/Group_33.png")))),
                            Spacer(),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 13, left: 11),
                              child: Text("Is my blood presuer normal?",
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: globalColors.primaryColor)),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
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
                          MaterialPageRoute(builder: (context) => screen_3()),
                        );
                      },
                      child: Container(
                        height: 150, width: 150,
                        // ignore: prefer_const_constructors
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/Group_34.png"),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            )),
                        child: Column(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Padding(
                                padding:
                                    const EdgeInsets.only(right: 100, top: 12),
                                child: SizedBox(
                                    height: 28,
                                    width: 31,
                                    child: Image(
                                        image: AssetImage(
                                            "assets/images/Group_43.png")))),
                            Spacer(),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 13, left: 11),
                              child: Text(
                                  "Who is at risk of high blood pressure?",
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: globalColors.primaryColor)),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 12,
                ),
                Column(
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
                          MaterialPageRoute(builder: (context) => screen_4()),
                        );
                      },
                      child: Container(
                        height: 150, width: 150,
                        // ignore: prefer_const_constructors
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/Group_34.png"),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            )),
                        child: Column(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Padding(
                                padding:
                                    const EdgeInsets.only(right: 100, top: 12),
                                child: SizedBox(
                                    height: 28,
                                    width: 31,
                                    child: Image(
                                        image: AssetImage(
                                            "assets/images/Group_44.png")))),
                            Spacer(),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 13, left: 11),
                              child: Text(
                                  "How can I prevent high Blood Presuer ?",
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: globalColors.primaryColor)),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
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
                          MaterialPageRoute(builder: (context) => screen_5()),
                        );
                      },
                      child: Container(
                        height: 150, width: 150,
                        // ignore: prefer_const_constructors
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/Group_34.png"),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            )),
                        child: Column(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Padding(
                                padding:
                                    const EdgeInsets.only(right: 100, top: 13),
                                child: SizedBox(
                                    height: 28,
                                    width: 31,
                                    child: Image(
                                        image: AssetImage(
                                            "assets/images/Group_67.png")))),
                            Spacer(),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 13, left: 11),
                              child: Text("Lower blood pressure by excercises",
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: globalColors.primaryColor)),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 12,
                ),
                Column(
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
                          MaterialPageRoute(builder: (context) => screen_6()),
                        );
                      },
                      child: Container(
                        height: 150, width: 150,
                        // ignore: prefer_const_constructors
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/Group_34.png"),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            )),
                        child: Column(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Padding(
                                padding:
                                    const EdgeInsets.only(right: 100, top: 12),
                                child: SizedBox(
                                    height: 28,
                                    width: 31,
                                    child: Image(
                                        image: AssetImage(
                                            "assets/images/Group_43.png")))),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 11, bottom: 13, right: 3),
                              child: Text("Knowledge about heart rate",
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: globalColors.primaryColor)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            isloaded
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width * .9,
                      child: AdWidget(ad: bannerAd!),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Container(
                      height: 50,
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
