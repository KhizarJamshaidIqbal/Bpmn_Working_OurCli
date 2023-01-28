// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:bpm/ControllerProvider/bpprovider/bpchartprovider.dart';
import 'package:bpm/ControllerProvider/bpprovider/latestbpprovider.dart';
import 'package:bpm/View/Share/bpmlist.dart';
import 'package:bpm/View/Share/chart.dart';
import 'package:bpm/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Share/bpchartmonth.dart';

class LatestScreen extends StatefulWidget {
  const LatestScreen({super.key});

  @override
  State<LatestScreen> createState() => _LatestScreenState();
}

class _LatestScreenState extends State<LatestScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final avgBpProvider =
          Provider.of<LatestBpProvier>(context, listen: false);
      avgBpProvider.setLatestBp(context: context);
    });
  }

  String dropdownValue = 'Week';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: globalColors.primaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 29, left: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 146,
                child: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        // physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 17),
                            child: Container(
                              width: 114,
                              height: 146,
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FittedBox(
                                      fit: BoxFit.fitWidth,
                                      child: Text(
                                        "Systolic",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20,
                                            fontFamily: 'Inter'),
                                      ),
                                    ),
                                    Text(
                                      "BPM",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 17,
                                          color: globalColors.textColor),
                                    ),
                                    SizedBox(
                                      height: 19,
                                    ),
                                    Consumer<LatestBpProvier>(
                                      builder: (context, value, child) {
                                        return Text(
                                          "${value.latestsys}",
                                          style: TextStyle(
                                              fontSize: 40,
                                              color: globalColors.Primary_Pink,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: 'Inter'),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: globalColors.Gray_Background),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 17),
                            child: Container(
                              width: 114,
                              height: 146,
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FittedBox(
                                      fit: BoxFit.fitWidth,
                                      child: Text(
                                        "Diastolic",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20,
                                            fontFamily: 'Inter'),
                                      ),
                                    ),
                                    Text(
                                      "BPM",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 17,
                                          color: globalColors.textColor),
                                    ),
                                    SizedBox(
                                      height: 19,
                                    ),
                                    Consumer<LatestBpProvier>(
                                      builder: (context, value, child) {
                                        return Text(
                                          "${value.latestDia}",
                                          style: TextStyle(
                                              fontSize: 40,
                                              color: globalColors.Primary_Pink,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: 'Inter'),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: const Color(0xffFAFAFA),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 24),
                            child: Container(
                              width: 114,
                              height: 146,
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FittedBox(
                                      fit: BoxFit.fitWidth,
                                      child: Text(
                                        "Pulse",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20,
                                            fontFamily: 'Inter'),
                                      ),
                                    ),
                                    Text(
                                      "BPM",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 17,
                                          color: globalColors.textColor),
                                    ),
                                    SizedBox(
                                      height: 19,
                                    ),
                                    Consumer<LatestBpProvier>(
                                      builder: (context, value, child) {
                                        return Text(
                                          "${value.latestPulse}",
                                          style: TextStyle(
                                              fontSize: 40,
                                              color: globalColors.Primary_Pink,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: 'Inter'),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: const Color(0xffFAFAFA),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
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
                Consumer<BpChartProvider>(
                  builder: (context, value, child) {
                    return ChartGraph(
                        monMeasureSys: value.monchartVSys,
                        monMeasureDia: value.monChartVDia,
                        tuesMeasureSys: value.tuechartVSys,
                        tuesMeasureDia: value.tuechartVDia,
                        wedMeasureSys: value.wedchartVSys,
                        wedMeasureDia: value.wedchartVDia,
                        thursMeasureSys: value.thurchartVSys,
                        thursMeasureDia: value.thurchartVDia,
                        friMeasureSys: value.fridaychartVSys,
                        friMeasureDia: value.fridaychartVDia,
                        satMeasureSys: value.satchartVSys,
                        satMeasureDia: value.satchartVDia,
                        sunMeasureSys: value.sunchartVSys,
                        sunMeasureDia: value.sunchartVDia);
                  },
                ),
              if (dropdownValue == "Month")
                  Consumer<BpChartProvider>(
                  builder: (context, value, child) {
                    int janSysvalue = 0;
                    int janDiavalue = 0;
                    int febSysvalue = 0;
                    int febDiavalue = 0;
                    int marSysvalue = 0;
                    int marDiavalue = 0;
                    int aprSysvalue = 0;
                    int aprDiavalue = 0;
                    int maySysvalue = 0;
                    int mayDiavalue = 0;
                    int junSysvalue = 0;
                    int junDiavalue = 0;
                    int julSysvalue = 0;
                    int julDiavalue = 0;
                    int augSysvalue = 0;
                    int augDiavalue = 0;
                    int sepSysvalue = 0;
                    int sepDiavalue = 0;
                    int octSysvalue = 0;
                    int octDiavalue = 0;
                    int novSysvalue = 0;
                    int novDiavalue = 0;
                    int decSysvalue = 0;
                    int decDiavalue = 0;
                    for (int item in value.janSysList) {
                      if (value.janSysList.isNotEmpty) {
                        janSysvalue = janSysvalue + item;
                      }
                    }
                    for (int item in value.janDiaList) {
                      if (value.janDiaList.isNotEmpty) {
                        janDiavalue = janDiavalue + item;
                      }
                    }
                    for (int item in value.febSysList) {
                      if (value.febSysList.isNotEmpty) {
                        febSysvalue = febSysvalue + item;
                      }
                    }
                    for (int item in value.febDiaList) {
                      if (value.febDiaList.isNotEmpty) {
                        febDiavalue = febDiavalue + item;
                      }
                    }
                    for (int item in value.marSysList) {
                      if (value.marSysList.isNotEmpty) {
                        marSysvalue = marSysvalue + item;
                      }
                    }
                    for (int item in value.marDiaList) {
                      if (value.marDiaList.isNotEmpty) {
                        marDiavalue = marDiavalue + item;
                      }
                    }
                    for (int item in value.aprSysList) {
                      if (value.aprSysList.isNotEmpty) {
                        aprSysvalue = aprSysvalue + item;
                      }
                    }
                    for (int item in value.aprDiaList) {
                      if (value.aprDiaList.isNotEmpty) {
                        aprSysvalue = aprDiavalue + item;
                      }
                    }
                    for (int item in value.maySysList) {
                      if (value.maySysList.isNotEmpty) {
                        maySysvalue = maySysvalue + item;
                      }
                    }
                    for (int item in value.mayDiaList) {
                      if (value.mayDiaList.isNotEmpty) {
                        mayDiavalue = mayDiavalue + item;
                      }
                    }
                    for (int item in value.junSysList) {
                      if (value.junSysList.isNotEmpty) {
                        junSysvalue = junSysvalue + item;
                      }
                    }
                    for (int item in value.junDiaList) {
                      if (value.junDiaList.isNotEmpty) {
                        junDiavalue = junDiavalue + item;
                      }
                    }
                    for (int item in value.julSysList) {
                      if (value.julSysList.isNotEmpty) {
                        julSysvalue = julSysvalue + item;
                      }
                    }
                    for (int item in value.julDiaList) {
                      if (value.julDiaList.isNotEmpty) {
                        julDiavalue = julDiavalue + item;
                      }
                    }
                    for (int item in value.augSysList) {
                      if (value.augSysList.isNotEmpty) {
                        augSysvalue = augSysvalue + item;
                      }
                    }
                    for (int item in value.augDiaList) {
                      if (value.augDiaList.isNotEmpty) {
                        augDiavalue = augDiavalue + item;
                      }
                    }
                    for (int item in value.sepSysList) {
                      if (value.sepSysList.isNotEmpty) {
                        sepSysvalue = sepSysvalue + item;
                      }
                    }
                    for (int item in value.sepDiaList) {
                      if (value.sepDiaList.isNotEmpty) {
                        sepDiavalue = sepDiavalue + item;
                      }
                    }
                    for (int item in value.octSysList) {
                      if (value.octSysList.isNotEmpty) {
                        octSysvalue = octSysvalue + item;
                      }
                    }
                    for (int item in value.octDiaList) {
                      if (value.octDiaList.isNotEmpty) {
                        octDiavalue = octDiavalue + item;
                      }
                    }
                    for (int item in value.novSysList) {
                      if (value.novDiaList.isNotEmpty) {
                        novSysvalue = novSysvalue + item;
                      }
                    }
                    for (int item in value.novDiaList) {
                      if (value.novDiaList.isNotEmpty) {
                        novDiavalue = novDiavalue + item;
                      }
                    }
                    for (int item in value.decSysList) {
                      if (value.decSysList.isNotEmpty) {
                        decSysvalue = decSysvalue + item;
                      }
                    }
                    for (int item in value.decDiaList) {
                      if (value.decDiaList.isNotEmpty) {
                        decDiavalue = decDiavalue + item;
                      }
                    }
                    return BpChartMonth(
                        janSys: (janSysvalue / (value.janSysList.length + 1)),
                        janDia: (janDiavalue / (value.janDiaList.length + 1)),
                        febSys: (febSysvalue / (value.febSysList.length + 1)),
                        febDia: (febDiavalue / (value.febDiaList.length + 1)),
                        marSys: (marSysvalue / (value.marSysList.length + 1)),
                        marDia: (marDiavalue / (value.marDiaList.length + 1)),
                        aprSys: (aprSysvalue / (value.aprSysList.length + 1)),
                        aprDia: (aprDiavalue / (value.aprDiaList.length + 1)),
                        maySys: (maySysvalue / (value.maySysList.length + 1)),
                        mayDia: (mayDiavalue / (value.mayDiaList.length + 1)),
                        junSys: (junSysvalue / (value.junSysList.length + 1)),
                        junDia: (junDiavalue / (value.junDiaList.length + 1)),
                        julSys: (julSysvalue / (value.julSysList.length + 1)),
                        julDia: (julDiavalue / (value.julDiaList.length + 1)),
                        augSys: (augSysvalue / (value.augSysList.length + 1)),
                        augDia: (augDiavalue / (value.augDiaList.length + 1)),
                        sepSys: (sepSysvalue / (value.sepSysList.length + 1)),
                        sepDia: (sepDiavalue / (value.sepDiaList.length + 1)),
                        octSys: (octSysvalue / (value.octSysList.length + 1)),
                        octDia: (octDiavalue / (value.octDiaList.length + 1)),
                        novSys: (novSysvalue / (value.novSysList.length + 1)),
                        novDia: (novDiavalue / (value.novDiaList.length + 1)),
                        decSys: (decSysvalue / (value.decSysList.length + 1)),
                        decDia: (decDiavalue / (value.decDiaList.length + 1)));
                  },
                ),
             
              SizedBox(
                height: 20,
              ),
              BpmList()
            ],
          ),
        ),
      ),
    );
  }
}
