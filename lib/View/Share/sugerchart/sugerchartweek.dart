// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:bpm/utils/colors.dart';
import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';

class SugerChartbymonth extends StatelessWidget {
  var jansugerValue,
      febsugerValue,
      marsugerValue,
      aprsugerValue,
      maysugerValue,
      junsugerValue,
      julsugerValue,
      augsugerValue,
      sepsugerValue,
      octsugerValue,
      novsugerValue,
      decsugerValue;
  SugerChartbymonth(
      {super.key,
      required this.jansugerValue,
      required this.febsugerValue,
      required this.marsugerValue,
      required this.aprsugerValue,
      required this.maysugerValue,
      required this.junsugerValue,
      required this.julsugerValue,
      required this.augsugerValue,
      required this.sepsugerValue,
      required this.octsugerValue,
      required this.novsugerValue,
      required this.decsugerValue});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, right: 30),
      child: SizedBox(
        height: 220,
        child: Container(
          decoration: BoxDecoration(
              color: globalColors.Gray_Background,
              borderRadius: BorderRadius.circular(12)),
          child: DChartBar(
            data: [
              {
                'id': 'Bar 1',
                'data': [
                  {'domain': 'Jan', 'measure': jansugerValue},
                  {'domain': 'Feb', 'measure': febsugerValue},
                  {'domain': 'Mar', 'measure': marsugerValue},
                  {'domain': 'Apr', 'measure': aprsugerValue},
                  {'domain': 'May', 'measure': maysugerValue},
                  {'domain': 'Jun', 'measure': junsugerValue},
                  {'domain': 'Jul', 'measure': julsugerValue},
                  {'domain': 'Aug', 'measure': augsugerValue},
                  {'domain': 'Sep', 'measure': sepsugerValue},
                  {'domain': 'Oct', 'measure': octsugerValue},
                  {'domain': 'Nov', 'measure': novsugerValue},
                  {'domain': 'Dec', 'measure': decsugerValue},
                ],
              },
            ],
            domainLabelPaddingToAxisLine: 16,
            axisLineTick: 2,
            axisLinePointTick: 2,
            axisLinePointWidth: 10,
            axisLineColor: const Color(0xfffda000),
            barValueColor: Colors.pinkAccent,
            measureLabelPaddingToAxisLine: 16,
            barColor: (barData, index, id) => barData['measure'] < 120
                ? globalColors.textColor
                : barData['measure'] > 100
                    ? globalColors.SecondaryColor
                    : globalColors.SecondaryColor
            // : barData['measure'] >=120 && barData['measure'] < 128? globalColors.BG_pure_yello:globalColors.SecondaryColor,
            ,
            showBarValue: true,
          ),
        ),
      ),
    );
  }
}
