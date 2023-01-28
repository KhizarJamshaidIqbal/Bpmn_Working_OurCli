// ignore_for_file: non_constant_identifier_names, camel_case_types, file_names

import 'package:bpm/utils/colors.dart';
import 'package:flutter/animation.dart';
class BP_types_data {
  final String Type;
  final String BMIRange;
  Color BGColor;

  BP_types_data({
    required this.BGColor,
    required this.Type,
    required this.BMIRange,
  });
  static List<BP_types_data> BP_data = [
  BP_types_data(
    BGColor: globalColors.Green,
    Type: 'Normal Blood Pressure',
    BMIRange: ' < 120\nand\n < 80',
  ),
  BP_types_data(
    BGColor: globalColors.BG_pure_yello,
    Type: 'Elivated Blood Pressure',
    BMIRange: ' 120-129\nand\n < 80',
  ),
  BP_types_data(
    BGColor: globalColors.BG_pure_Orange,
    Type: 'High Blood PressureStage-I',
    BMIRange: ' < 130+\n or \n < 80+',
  ),
  // BP_types_data(
  //   BGColor: globalColors.BG_Light_Orange,
  //   Type: 'Obesede Class I',
  //   BMIRange: 'BMI\n<30.0-34.9',
  // ),
  BP_types_data(
    BGColor: globalColors.BG_Dark_red,
    Type: 'High Blood PressureStage-II',
    BMIRange: ' < 140+\n or \n < 90+',
  ),
  BP_types_data(
    BGColor: globalColors.BG_Pure_red,
    Type: 'Dangerously High BloodPressure',
    BMIRange: ' < 180+\n And/or\n < 120+',
  ),
];
}


