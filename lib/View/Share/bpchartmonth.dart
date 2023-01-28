// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:bpm/utils/colors.dart';
import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';

class BpChartMonth extends StatelessWidget {
  var janSys,
      janDia,
      febSys,
      febDia,
      marSys,
      marDia,
      aprSys,
      aprDia,
      maySys,
      mayDia,
      junSys,
      junDia,
      julSys,
      julDia,
      augSys,
      augDia,
      sepSys,
      sepDia,
      octSys,
      octDia,
      novSys,
      novDia,
      decSys,
      decDia;
  BpChartMonth({
    super.key,
    required this.janSys,
    required this.janDia,
    required this.febSys,
    required this.febDia,
    required this.marSys,
    required this.marDia,
    required this.aprSys,
    required this.aprDia,
    required this.maySys,
    required this.mayDia,
    required this.junSys,
    required this.junDia,
    required this.julSys,
    required this.julDia,
    required this.augSys,
    required this.augDia,
    required this.sepSys,
    required this.sepDia,
    required this.octSys,
    required this.octDia,
    required this.novSys,
    required this.novDia,
    required this.decSys,
    required this.decDia,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 24),
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
                  {'domain': 'Jan', 'measure': janSys},
                  {'domain': 'Feb', 'measure': febSys},
                  {'domain': 'Mar', 'measure': marSys},
                  {'domain': 'Apr', 'measure': aprSys},
                  {'domain': 'May', 'measure': maySys},
                  {'domain': 'Jun', 'measure': junSys},
                  {'domain': 'Jul', 'measure': julSys},
                  {'domain': 'Aug', 'measure': augSys},
                  {'domain': 'Sep', 'measure': sepSys},
                  {'domain': 'Oct', 'measure': octSys},
                  {'domain': 'Nov', 'measure': novSys},
                  {'domain': 'Dec', 'measure': decSys},
                ],
              },
              {
                'id': 'Bar 2',
                'data': [
                  {'domain': 'Jan', 'measure': janDia},
                  {'domain': 'Feb', 'measure': febDia},
                  {'domain': 'Mar', 'measure': marDia},
                  {'domain': 'Apr', 'measure': aprDia},
                  {'domain': 'May', 'measure': mayDia},
                  {'domain': 'Jun', 'measure': junDia},
                  {'domain': 'Jul', 'measure': julDia},
                  {'domain': 'Aug', 'measure': augDia},
                  {'domain': 'Sep', 'measure': sepDia},
                  {'domain': 'Oct', 'measure': octDia},
                  {'domain': 'Nov', 'measure': novDia},
                  {'domain': 'Dec', 'measure': decDia},
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
