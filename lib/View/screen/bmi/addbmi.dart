// ignore_for_file: file_names, camel_case_types, prefer_const_constructors, sort_child_properties_last, duplicate_ignore, avoid_print
import 'package:bpm/utils/bmitypedatalist.dart';
import 'package:bpm/utils/colors.dart';
import 'package:bpm/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AddBmi extends StatefulWidget {
  const AddBmi({super.key});

  @override
  State<AddBmi> createState() => _AddBmiState();
}

class _AddBmiState extends State<AddBmi> {
  int _selectedItemIndexfit = 0;
  int _selectedItemIndexinch = 0;
  int _selectedItemIndexweight = 0;
  List fitList = [];
  List inchList = [];
  List weightlist = [];

  var bmiValue = 0.00;
  void calcualteBmi() {
    var inches = fitList[_selectedItemIndexfit] * 12;
    inches = inches + inchList[_selectedItemIndexinch];

    var meters = (inches / 39.37);
    bmiValue = (weightlist[_selectedItemIndexweight] / (meters * meters));
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();

    for (var i = 2; i <= 8; i++) {
      fitList.add(i);
    }
    for (var i = 1; i <= 12; i++) {
      inchList.add(i);
    }
    for (var i = 5; i <= 180; i++) {
      weightlist.add(i);
    }
  }

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
    var scHeight = MediaQuery.of(context).size.height;
    var scWidth = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: globalColors.primaryColor,
      appBar: AppBar(
        backgroundColor: globalColors.primaryColor,
        elevation: 4,
        bottomOpacity: 1.5,
        title: Text(
          "BMI",
          style: TextStyle(
              // fontFamily: 'Inter',
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: globalColors.textColor),
        ),
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: globalColors.textColor,
            )),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: InkWell(
              onTap: () {
                Utils.showDialog(context, scHeight, scWidth, "BMI Types",
                    BmiTypeDataList.bmiListData);
              },
              child: Container(
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: bmiValue == 0
                        ? globalColors.Green
                        : bmiValue >= 18 && bmiValue <= 24.9
                            ? globalColors.Green
                            : bmiValue < 18
                                ? globalColors.BG_pure_yello
                                : bmiValue >= 25 && bmiValue <= 29.9
                                    ? globalColors.BG_pure_Orange
                                    : bmiValue >= 30 && bmiValue <= 34.9
                                        ? globalColors.BG_pure_Orange
                                        : bmiValue >= 35 && bmiValue <= 39.9
                                            ? globalColors.BG_pure_Orange
                                            : bmiValue > 40
                                                ? Color(0xffCE3932)
                                                : globalColors.Green,
                    borderRadius: BorderRadius.circular(12)),
                // ignore: sort_child_properties_last
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 13, right: 14),
                      child: SizedBox(
                        height: 25,
                        width: 25,
                        child: Image(
                            image: AssetImage('assets/images/info_4.png')),
                      ),
                    ),
                    Text(
                      bmiValue == 0
                          ? ""
                          : bmiValue >= 18 && bmiValue <= 24.9
                              ? "Normal"
                              : bmiValue < 18
                                  ? "UnderWeight"
                                  : bmiValue >= 25 && bmiValue <= 29.9
                                      ? "OverWeight"
                                      : bmiValue >= 30 && bmiValue <= 34.9
                                          ? "Obesede Class I"
                                          : bmiValue >= 35 && bmiValue <= 39.9
                                              ? "Obesede Class II"
                                              : bmiValue > 40
                                                  ? "Obesede Class III"
                                                  : "",
                      style: TextStyle(
                        color: globalColors.primaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              // ignore: prefer_const_literals_to_create_immutables
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text(
                  bmiValue.toStringAsFixed(2),
                  style: TextStyle(
                    color: globalColors.Primary_Pink,
                    fontWeight: FontWeight.w700,
                    fontSize: 48,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: Text(
                    "BMI",
                    style: TextStyle(
                      color: globalColors.textColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              "Healthy weight range for you:\n\t\t\t\t\t\t\t\t\t\t\t\t\t50kg to 80 kg",
              style: TextStyle(
                color: globalColors.textColor,
                fontWeight: FontWeight.w400,
                fontSize: 17,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 24,
              right: 24,
            ),
            child: Container(
              height: 342,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: globalColors.Gray_Background),
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 19, left: 14, right: 14),
                    child: Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          "Height",
                          style: TextStyle(
                            color: globalColors.BlackColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                        Spacer(),
                        Text(
                          "ft.in",
                          style: TextStyle(
                            color: globalColors.textColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                        ),
                        // Icon(
                        //   Icons.keyboard_arrow_down_sharp,
                        //   color: globalColors.Primary_Pink,
                        // )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 15, right: 15),
                    child: Material(
                      elevation: 4.0,
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        height: 113,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            children: [
                              SizedBox(
                                height: 130,
                                width: 50,
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: ListWheelScrollView.useDelegate(
                                          onSelectedItemChanged: (index) {
                                            setState(() {
                                              _selectedItemIndexfit = index;
                                            });
                                            // print(index);
                                          },
                                          itemExtent: 40,
                                          diameterRatio: 1.2,
                                          physics: FixedExtentScrollPhysics(),
                                          perspective: 0.00005,
                                          childDelegate:
                                              ListWheelChildBuilderDelegate(
                                                  childCount: fitList.length,
                                                  builder: (context, index) {
                                                    return Column(
                                                      children: [
                                                        _selectedItemIndexfit ==
                                                                index
                                                            ? Container(
                                                                height: 1,
                                                                width: double
                                                                    .infinity,
                                                                color: globalColors
                                                                    .textColor,
                                                              )
                                                            : Container(),
                                                        Text(
                                                          fitList[index]
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontSize: 17,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color: _selectedItemIndexfit ==
                                                                      index
                                                                  ? Colors.black
                                                                  : globalColors
                                                                      .textColor),
                                                        ),
                                                        _selectedItemIndexfit ==
                                                                index
                                                            ? Container(
                                                                height: 1,
                                                                width: double
                                                                    .infinity,
                                                                color: globalColors
                                                                    .textColor,
                                                              )
                                                            : Container(),
                                                      ],
                                                    );
                                                  })),
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              SizedBox(
                                height: 130,
                                width: 50,
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: ListWheelScrollView.useDelegate(
                                          onSelectedItemChanged: (index) {
                                            setState(() {
                                              _selectedItemIndexinch = index;
                                            });

                                            // print(index);
                                          },
                                          itemExtent: 40,
                                          diameterRatio: 1.2,
                                          physics: FixedExtentScrollPhysics(),
                                          perspective: 0.00005,
                                          childDelegate:
                                              ListWheelChildBuilderDelegate(
                                                  childCount: inchList.length,
                                                  builder: (context, index) {
                                                    return Column(
                                                      children: [
                                                        _selectedItemIndexinch ==
                                                                index
                                                            ? Container(
                                                                height: 1,
                                                                width: double
                                                                    .infinity,
                                                                color: globalColors
                                                                    .textColor,
                                                              )
                                                            : Container(),
                                                        Text(
                                                          inchList[index]
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontSize: 17,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color: _selectedItemIndexinch ==
                                                                      index
                                                                  ? Colors.black
                                                                  : globalColors
                                                                      .textColor),
                                                        ),
                                                        _selectedItemIndexinch ==
                                                                index
                                                            ? Container(
                                                                height: 1,
                                                                width: double
                                                                    .infinity,
                                                                color: globalColors
                                                                    .textColor,
                                                              )
                                                            : Container(),
                                                      ],
                                                    );
                                                  })),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: globalColors.primaryColor,
                            borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 17, left: 14, right: 14),
                    child: Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          "Weight",
                          style: TextStyle(
                            color: globalColors.BlackColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                        Spacer(),
                        Text(
                          "Kg",
                          style: TextStyle(
                            color: globalColors.textColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                        ),
                        // Icon(
                        //   Icons.keyboard_arrow_down_sharp,
                        //   color: globalColors.Primary_Pink,
                        // )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 15, right: 15),
                    child: Material(
                      elevation: 4.0,
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        height: 113,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: 130,
                                width: 50,
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: ListWheelScrollView.useDelegate(
                                          onSelectedItemChanged: (index) {
                                            setState(() {
                                              _selectedItemIndexweight = index;
                                            });
                                            // print(index);
                                          },
                                          itemExtent: 40,
                                          diameterRatio: 1.2,
                                          physics: FixedExtentScrollPhysics(),
                                          perspective: 0.00005,
                                          childDelegate:
                                              ListWheelChildBuilderDelegate(
                                                  childCount: weightlist.length,
                                                  builder: (context, index) {
                                                    return Column(
                                                      children: [
                                                        _selectedItemIndexweight ==
                                                                index
                                                            ? Container(
                                                                height: 1,
                                                                width: double
                                                                    .infinity,
                                                                color: globalColors
                                                                    .textColor,
                                                              )
                                                            : Container(),
                                                        Text(
                                                          weightlist[index]
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontSize: 17,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color: _selectedItemIndexweight ==
                                                                      index
                                                                  ? Colors.black
                                                                  : globalColors
                                                                      .textColor),
                                                        ),
                                                        _selectedItemIndexweight ==
                                                                index
                                                            ? Container(
                                                                height: 1,
                                                                width: double
                                                                    .infinity,
                                                                color: globalColors
                                                                    .textColor,
                                                              )
                                                            : Container(),
                                                      ],
                                                    );
                                                  })),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                            // ignore: prefer_const_literals_to_create_immutables
                            boxShadow: [
                              // BoxShadow(
                              //   color: globalColors.BlackColor,
                              //   spreadRadius: .5,
                              //   blurRadius: .1,
                              //   offset:
                              //       Offset(0, .5), // changes position of shadow
                              // ),
                            ],
                            color: globalColors.primaryColor,
                            borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 42,
            width: 312,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  calcualteBmi();
                });
                // InterstitialAd.load(
                //   adUnitId: "ca-app-pub-3940256099942544/1033173712",
                //   request: const AdRequest(),
                //   adLoadCallback: InterstitialAdLoadCallback(
                //     onAdLoaded: (ad) {
                //       interstitialAd = ad;
                //       ad.show();
                //       interstitialAd?.fullScreenContentCallback =
                //           FullScreenContentCallback(
                //               onAdDismissedFullScreenContent: (ad) {
                //         interstitialAd?.dispose();
                //         ad.dispose();
                //         Navigator.push(context, MaterialPageRoute(builder: (context) => AddBmi(),));
                //       }, onAdFailedToShowFullScreenContent: (ad, err) {
                //         ad.dispose();
                //         interstitialAd?.dispose();
                //       });
                //     },
                //     onAdFailedToLoad: (err) {
                //       interstitialAd?.dispose();
                //     },
                //   ),
                // );
                // Navigator.push(context, MaterialPageRoute(builder: (context) => AddBmi(),));
              },
              child: Text(
                "Calculate",
                style: TextStyle(
                    fontSize: 17,
                    // fontFamily: 'Inter',
                    fontWeight: FontWeight.w700),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: globalColors.Primary_Pink,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  )),
            ),
          ),
          // Spacer(),
          SizedBox(
            height: 10,
          ),
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
    );
  }
}
