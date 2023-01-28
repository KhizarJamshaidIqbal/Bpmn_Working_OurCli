// ignore_for_file: non_constant_identifier_names, camel_case_types, file_names

import 'package:bpm/utils/colors.dart';
import 'package:flutter/animation.dart';
class BsTypeData {
  final String Type;
  final String BMIRange;
  Color BGColor;

  BsTypeData({
    required this.BGColor,
    required this.Type,
    required this.BMIRange,
  });
 static List<BsTypeData> Bs_data = [
  BsTypeData(
    BGColor: globalColors.Green,
    Type: 'Low',
    BMIRange: ' < 72',
  ),
  BsTypeData(
    BGColor: globalColors.BG_pure_yello,
    Type: 'Normal',
    BMIRange: '72 ~ 98',
  ),
  BsTypeData(
    BGColor: globalColors.BG_pure_Orange,
    Type: 'Pre-Diabetes',
    BMIRange: '99 ~ 125',
  ), 
  BsTypeData(
    BGColor: globalColors.BG_Pure_red,
    Type: 'Diabetes',
    BMIRange: '>=126',
  ),
];

}

