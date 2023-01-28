// ignore_for_file: non_constant_identifier_names, camel_case_types, file_names

import 'package:bpm/utils/colors.dart';
import 'package:flutter/animation.dart';

class BmiTypeDataList {
  final String Type;
  final String BMIRange;
  Color BGColor;

  BmiTypeDataList({
    required this.BGColor,
    required this.Type,
    required this.BMIRange,
  });
  static List<BmiTypeDataList> bmiListData = [
    BmiTypeDataList(
      BGColor: globalColors.Green,
      Type: 'Normal',
      BMIRange: '<18-24.9',
    ),
    BmiTypeDataList(
      BGColor: globalColors.BG_pure_yello,
      Type: 'Underweight',
      BMIRange: '<18.0',
    ),
    BmiTypeDataList(
      BGColor: globalColors.BG_pure_Orange,
      Type: 'Overwieght',
      BMIRange: '<25.0-29.9',
    ),
    BmiTypeDataList(
      BGColor: globalColors.BG_pure_Orange,
      Type: 'Obesede Class I',
      BMIRange: '<30.0-34.9',
    ),
    BmiTypeDataList(
      BGColor: const Color(0xffCE3932),
      Type: 'Obesede Class II',
      BMIRange: '<35.0-39.9',
    ),
    BmiTypeDataList(
      BGColor: globalColors.BG_Pure_red,
      Type: 'Obesede Class III',
      BMIRange: '>40',
    ),
  ];
}
