// ignore_for_file: must_be_immutable

import 'package:bpm/utils/colors.dart';
import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';

class SugerChartWeek extends StatelessWidget {
  int monMeasureSys,
      tuesMeasureSys,
      wedMeasureSys,
      thursMeasureSys,
      friMeasureSys,
      satMeasureSys,
      sunMeasureSys;
  SugerChartWeek({
    super.key,
    required this.monMeasureSys,
    required this.tuesMeasureSys,
    required this.wedMeasureSys,
    required this.thursMeasureSys,
    required this.friMeasureSys,
    required this.satMeasureSys,
    required this.sunMeasureSys,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, right: 24),
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
                  {'domain': 'Mon', 'measure': monMeasureSys},
                  {'domain': 'Tue', 'measure': tuesMeasureSys},
                  {'domain': 'Wed', 'measure': wedMeasureSys},
                  {'domain': 'Thu', 'measure': thursMeasureSys},
                  {'domain': 'Fri', 'measure': friMeasureSys},
                  {'domain': 'Sat', 'measure': satMeasureSys},
                  {'domain': 'Sun', 'measure': satMeasureSys},
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
