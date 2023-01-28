// ignore_for_file: must_be_immutable

import 'package:bpm/utils/colors.dart';
import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';

class ChartGraph extends StatelessWidget {
  int monMeasureSys,
      monMeasureDia,
      tuesMeasureSys,
      tuesMeasureDia,
      wedMeasureSys,
      wedMeasureDia,
      thursMeasureSys,
      thursMeasureDia,
      friMeasureSys,
      friMeasureDia,
      satMeasureSys,
      satMeasureDia,
      sunMeasureSys,
      sunMeasureDia;
  ChartGraph(
      {super.key,
      required this.monMeasureSys,
      required this.monMeasureDia,
      required this.tuesMeasureSys,
      required this.tuesMeasureDia,
      required this.wedMeasureSys,
      required this.wedMeasureDia,
      required this.thursMeasureSys,
      required this.thursMeasureDia,
      required this.friMeasureSys,
      required this.friMeasureDia,
      required this.satMeasureSys,
      required this.satMeasureDia,
      required this.sunMeasureSys,
      required this.sunMeasureDia});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24),
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
                  {'domain': 'Sun', 'measure': sunMeasureSys},
                ],
              },
              {
                'id': 'Bar 2',
                'data': [
                  {'domain': 'Mon', 'measure': monMeasureDia},
                  {'domain': 'Tue', 'measure': tuesMeasureDia},
                  {'domain': 'Wed', 'measure': wedMeasureDia},
                  {'domain': 'Thu', 'measure': thursMeasureDia},
                  {'domain': 'Fri', 'measure': friMeasureDia},
                  {'domain': 'Sat', 'measure': satMeasureDia},
                  {'domain': 'Sun', 'measure': sunMeasureDia},
                ],
              },
            ],
            domainLabelPaddingToAxisLine: 16,
            axisLineTick: 2,
            axisLinePointTick: 2,
            axisLinePointWidth: 10,
            axisLineColor: const Color(0xfffda000),
            measureLabelPaddingToAxisLine: 16,
            barColor: (barData, index, id) {
              if (id == 'Bar 1') {
                return globalColors.SecondaryColor;
              }
              return globalColors.textColor;
            },
            showBarValue: true,
          ),
        ),
      ),
    );
  }
}
