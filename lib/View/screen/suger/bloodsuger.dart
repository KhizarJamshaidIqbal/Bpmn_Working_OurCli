// ignore_for_file: camel_case_types, prefer_const_constructors, sort_child_properties_last, unused_local_variable
import 'package:bpm/ControllerProvider/bottombarindexprovider.dart';
import 'package:bpm/ControllerProvider/sugerprovider/sugerchartprovider.dart';
import 'package:bpm/View/Share/sugerchart/sugerchartmonth.dart';
import 'package:bpm/View/Share/sugerlist.dart';
import 'package:bpm/View/screen/bshistory/bshistory.dart';
import 'package:bpm/View/screen/suger/addsuger.dart';
import 'package:bpm/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Share/sugerchart/sugerchartweek.dart';

class BloodSuger extends StatefulWidget {
  const BloodSuger({super.key});

  @override
  State<BloodSuger> createState() => _BloodSugerState();
}

class _BloodSugerState extends State<BloodSuger> {
  String dropdownValue = "Week";
  @override
  Widget build(BuildContext context) {
    final bottomBarIndexProvider = Provider.of<BottomBarIndexProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: globalColors.primaryColor,
        appBar: AppBar(
          backgroundColor: globalColors.primaryColor,
          elevation: 4,
          title: Text(
            "Blood Sugar",
            style: TextStyle(
                color: globalColors.textColor,
                fontSize: 20,
                fontWeight: FontWeight.w400,
                fontFamily: 'Inter'),
          ),
          leading: Padding(
            padding: EdgeInsets.only(left: 14),
            child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_ios_new,
                    color: globalColors.textColor)),
          ),
          actions: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BsHistoryScreen(),
                    ));
              },
              child: Padding(
                padding: EdgeInsets.only(right: 20, top: 5),
                child: SizedBox(
                    height: 25,
                    width: 25,
                    child:
                        Image(image: AssetImage('assets/images/Refresh.png'))),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      DropdownButton<String>(
                        value: dropdownValue,
                        icon: const Icon(Icons.arrow_drop_down),
                        iconSize: 24,
                        elevation: 16,
                        style:
                            const TextStyle(color: globalColors.BG_pure_Orange),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                        items: <String>['Week', 'Month']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                if (dropdownValue == "Week")
                  Consumer<SugerChartProvider>(
                    builder: (context, value, child) {
                      return SugerChartWeek(
                          monMeasureSys: value.monchartV,
                          tuesMeasureSys: value.tuechartV,
                          wedMeasureSys: value.wedchartV,
                          thursMeasureSys: value.thurchartV,
                          friMeasureSys: value.fridaychartV,
                          satMeasureSys: value.satchartV,
                          sunMeasureSys: value.sunchartV);
                    },
                  ),
                if (dropdownValue == "Month")
                  Consumer<SugerChartProvider>(
                    builder: (context, value, child) {
                      int janSugerMonthValue = 0,
                          febSugerMonthValue = 0,
                          marSugerMonthValue = 0,
                          aprSugerMonthValue = 0,
                          maySugerMonthValue = 0,
                          junSugerMonthValue = 0,
                          julSugerMonthValue = 0,
                          augSugerMonthValue = 0,
                          sepSugerMonthValue = 0,
                          octSugerMonthValue = 0,
                          novSugerMonthValue = 0,
                          decSugerMonthValue = 0;

                      for (int item in value.janSugerMonthValue) {
                        if (value.janSugerMonthValue.isNotEmpty) {
                          janSugerMonthValue = janSugerMonthValue + item;
                        }
                      }
                      for (int item in value.febSugerMonthValue) {
                        if (value.febSugerMonthValue.isNotEmpty) {
                          febSugerMonthValue = febSugerMonthValue + item;
                        }
                      }
                      for (int item in value.marSugerMonthValue) {
                        if (value.marSugerMonthValue.isNotEmpty) {
                          marSugerMonthValue = marSugerMonthValue + item;
                        }
                      }
                      for (int item in value.aprSugerMonthValue) {
                        if (value.aprSugerMonthValue.isNotEmpty) {
                          aprSugerMonthValue = aprSugerMonthValue + item;
                        }
                      }
                      for (int item in value.maySugerMonthValue) {
                        if (value.maySugerMonthValue.isNotEmpty) {
                          maySugerMonthValue = maySugerMonthValue + item;
                        }
                      }
                      for (int item in value.junSugerMonthValue) {
                        if (value.junSugerMonthValue.isNotEmpty) {
                          junSugerMonthValue = junSugerMonthValue + item;
                        }
                      }
                      for (int item in value.julSugerMonthValue) {
                        if (value.julSugerMonthValue.isNotEmpty) {
                          julSugerMonthValue = julSugerMonthValue + item;
                        }
                      }
                      for (int item in value.augSugerMonthValue) {
                        if (value.augSugerMonthValue.isNotEmpty) {
                          augSugerMonthValue = augSugerMonthValue + item;
                        }
                      }
                      for (int item in value.sepSugerMonthValue) {
                        if (value.sepSugerMonthValue.isNotEmpty) {
                          sepSugerMonthValue = sepSugerMonthValue + item;
                        }
                      }
                      for (int item in value.octSugerMonthValue) {
                        if (value.octSugerMonthValue.isNotEmpty) {
                          octSugerMonthValue = octSugerMonthValue + item;
                        }
                      }
                      for (int item in value.novSugerMonthValue) {
                        if (value.novSugerMonthValue.isNotEmpty) {
                          novSugerMonthValue = novSugerMonthValue + item;
                        }
                      }
                      for (int item in value.decSugerMonthValue) {
                        if (value.decSugerMonthValue.isNotEmpty) {
                          decSugerMonthValue = decSugerMonthValue + item;
                        }
                      }

                      return SugerChartbymonth(
                          jansugerValue: (janSugerMonthValue /
                              (value.janSugerMonthValue.length + 1)),
                          febsugerValue: (febSugerMonthValue /
                              (value.febSugerMonthValue.length + 1)),
                          marsugerValue: (marSugerMonthValue /
                              (value.marSugerMonthValue.length + 1)),
                          aprsugerValue: (aprSugerMonthValue /
                              (value.aprSugerMonthValue.length + 1)),
                          maysugerValue: (maySugerMonthValue /
                              (value.maySugerMonthValue.length + 1)),
                          junsugerValue: (junSugerMonthValue /
                              (value.junSugerMonthValue.length + 1)),
                          julsugerValue: (julSugerMonthValue /
                              (value.julSugerMonthValue.length + 1)),
                          augsugerValue: (augSugerMonthValue /
                              (value.augSugerMonthValue.length + 1)),
                          sepsugerValue: (sepSugerMonthValue /
                              (value.sepSugerMonthValue.length + 1)),
                          octsugerValue: (octSugerMonthValue /
                              (value.octSugerMonthValue.length + 1)),
                          novsugerValue: (novSugerMonthValue /
                              (value.novSugerMonthValue.length + 1)),
                          decsugerValue: (decSugerMonthValue /
                              (value.decSugerMonthValue.length + 1)));
                    },
                  ),
                SugerRecordList()
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddSuger(),
                ));
            setState(() {});
          },
          child: Icon(Icons.add),
          backgroundColor: globalColors.SecondaryColor,
        ),
      ),
    );
  }
}
