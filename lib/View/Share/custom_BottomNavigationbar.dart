// ignore_for_file: unnecessary_import, implementation_imports, import_of_legacy_library_into_null_safe, file_names, prefer_const_constructors, non_constant_identifier_names, unused_field, prefer_final_fields

import 'package:bpm/ControllerProvider/bottombarindexprovider.dart';
import 'package:bpm/View/screen/home/HomeScreen.dart';
import 'package:bpm/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import '../screen/info/InfoKnowledge.dart';
import '../screen/bloodpreasure/bloodpressure.dart';
import '../screen/settings/setting.dart';

class BottomNavigationbar extends StatefulWidget {
  const BottomNavigationbar({super.key});

  @override
  State<BottomNavigationbar> createState() => _BottomNavigationbarState();
}

class _BottomNavigationbarState extends State<BottomNavigationbar> {
  var _page = 0;
  var ScreenList = [
    HomeScreen(),
    BloodPressure(),
    InfoKnowledge(),
    setting(),
  ];
  @override
  Widget build(BuildContext context) {
    final bottomBarIndexProvider =
        Provider.of<BottomBarIndexProvider>(context, listen: false);
    return Scaffold(
      body: Consumer<BottomBarIndexProvider>(
        builder: (context, value, child) {
          return ScreenList[value.bottomIndex];
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: globalColors.primaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Consumer<BottomBarIndexProvider>(
              builder: (context, value, child) {
                return value.bottomIndex == 0
                    ? Icon(
                        Icons.home,
                        color: globalColors.SecondaryColor,
                      )
                    : Icon(
                        Icons.home,
                        color: globalColors.UnSlectedDotsColor,
                      );
              },
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
                height: 22,
                width: 25,
                child: Consumer<BottomBarIndexProvider>(
                  builder: (context, value, child) {
                    return value.bottomIndex == 1
                        ? Image.asset("assets/images/Group_66.png")
                        : Image.asset("assets/images/Group_8.png");
                  },
                )),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
                height: 22,
                width: 25,
                child: Consumer<BottomBarIndexProvider>(
                  builder: (context, value, child) {
                    return value.bottomIndex == 2
                        ? Image.asset("assets/images/info_2.png")
                        : Image.asset("assets/images/info_1.png");
                  },
                )),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Consumer<BottomBarIndexProvider>(
              builder: (context, value, child) {
                return value.bottomIndex == 3
                    ? Icon(
                        Icons.settings,
                        color: globalColors.SecondaryColor,
                      )
                    : Icon(
                        Icons.settings,
                        color: globalColors.UnSlectedDotsColor,
                      );
              },
            ),
            label: '',
          ),
        ],
        currentIndex: bottomBarIndexProvider.bottomIndex,
        onTap: (value) {
          setState(() {
            bottomBarIndexProvider.setBottomIndex(index: value);
          });
        },
      ),
    );
  }
}
