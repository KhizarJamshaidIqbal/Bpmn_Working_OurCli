// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, sort_child_properties_last, unnecessary_string_interpolations, unnecessary_brace_in_string_interps, sized_box_for_whitespace

import 'package:another_flushbar/flushbar.dart';
import 'package:bpm/ControllerProvider/sugerprovider/selectedstateprovider.dart';
import 'package:bpm/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Utils {
  static formatPrice(double price) => '\$ ${price.toStringAsFixed(2)}';
  static formatDate(DateTime date) => DateFormat.yMd().format(date);
  static void showFlushBar(BuildContext context, String message) {
    Flushbar(
      // title: "",
      message: "${message}",
      duration: Duration(seconds: 3),
    ).show(context);
  }

  static void showDialog(BuildContext context, var height, var width,
      String title, List dataList) {
    showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.only(
            top: 70,
            left: 18,
            right: 18,
          ),
          child: Container(
            // height: MediaQuery.of(context).size.height * .9 ,
            // width: MediaQuery.of(context).size.width * .9,
            decoration: BoxDecoration(
                color: globalColors.primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Icon(
                          Icons.arrow_back_ios_new_sharp,
                          color: globalColors.textColor,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          title,
                          style: TextStyle(
                            color: globalColors.BlackColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 20, decoration: TextDecoration.none,
                            // fontFamily: 'Inter'
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.8,
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: dataList.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15, left: 10, right: 10, bottom: 15),
                                  child: Container(
                                      height: 110,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: globalColors.Gray_Background,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12)),
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 18,
                                                height: 100,
                                                decoration: BoxDecoration(
                                                    color:
                                                        dataList[index].BGColor,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    12),
                                                            bottomLeft: Radius
                                                                .circular(12))),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 12),
                                                child: Container(
                                                  width: 165,
                                                  child: Text(
                                                    dataList[index].Type,
                                                    style: TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: globalColors
                                                            .BlackColor,
                                                        decoration:
                                                            TextDecoration
                                                                .none),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 110,
                                                width: 1,
                                                color: globalColors.textColor,
                                              ),
                                              Spacer(),
                                              Column(
                                                // mainAxisAlignment:
                                                //     MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "BMI",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: globalColors
                                                            .BlackColor,
                                                        decoration:
                                                            TextDecoration
                                                                .none),
                                                  ),
                                                  Text(
                                                    dataList[index].BMIRange,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: globalColors
                                                            .BlackColor,
                                                        decoration:
                                                            TextDecoration
                                                                .none),
                                                  ),
                                                ],
                                              ),
                                              Spacer()
                                            ],
                                          ),
                                        ],
                                      )),
                                )
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
      animationType: DialogTransitionType.scale,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 200),
    );
  }

  static void ShowStateDialog(
      {required BuildContext context,
      required var height,
      required var width,
      required String title,
      required List dataList}) {
    for (var item in dataList) {
      item.isseleted = false;
    }
    showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return Padding(
            padding: const EdgeInsets.only(
              top: 70,
              left: 18,
              right: 18,
            ),
            child: Container(
              // height: MediaQuery.of(context).size.height * .9 ,
              // width: MediaQuery.of(context).size.width * .9,
              decoration: BoxDecoration(
                  color: globalColors.primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Icon(
                          Icons.arrow_back_ios_new_sharp,
                          color: globalColors.textColor,
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text(
                            title,
                            style: TextStyle(
                              color: globalColors.BlackColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 20, decoration: TextDecoration.none,
                              // fontFamily: 'Inter'
                            ),
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.8,
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: dataList.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    child: SizedBox(
                                      height: 56,
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          final selectedSateProvider =
                                              Provider.of<SelectedSateProvider>(
                                                  context,
                                                  listen: false);
                                          for (var item in dataList) {
                                            item.isseleted = false;
                                          }
                                          setState(() {
                                            dataList[index].isseleted = true;
                                            selectedSateProvider
                                                .setSelectedState(
                                                    stateName:
                                                        dataList[index].type,
                                                    mgDlvalue: 0);
                                          });
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              dataList[index].type,
                                              style: TextStyle(
                                                  color: dataList[index]
                                                              .isseleted ==
                                                          false
                                                      ? Color(0xff3E3E3E)
                                                      : Colors.white,
                                                  fontSize: 17,
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            Icon(
                                              Icons.verified_rounded,
                                              color: Colors.white,
                                            )
                                          ],
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            side: BorderSide(
                                                color:
                                                    dataList[index].isseleted ==
                                                            false
                                                        ? Colors.grey
                                                        : Color(0xFFFD4785)
                                                            .withOpacity(0.85)),
                                            backgroundColor:
                                                dataList[index].isseleted ==
                                                        false
                                                    ? Colors.white
                                                    : Color(0xFFFD4785)
                                                        .withOpacity(0.9),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                            )),
                                      ),
                                    ),
                                  ),
                                  index == dataList.length - 1
                                      ? Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 5),
                                          child: SizedBox(
                                            height: 56,
                                            width: double.infinity,
                                            child: ElevatedButton(
                                              onPressed: () async {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                "Done",
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontFamily: 'Inter',
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      globalColors.Primary_Pink,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6),
                                                  )),
                                            ),
                                          ),
                                        )
                                      : Container()
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
      },
      animationType: DialogTransitionType.scale,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 200),
    );
  }
}
