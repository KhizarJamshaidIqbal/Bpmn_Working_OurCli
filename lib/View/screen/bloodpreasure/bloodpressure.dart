// ignore_for_file: camel_case_types, prefer_const_constructors, sort_child_properties_last
import 'package:bpm/ControllerProvider/bottombarindexprovider.dart';
import 'package:bpm/View/screen/bloodpreasure/addnewrecord.dart';
import 'package:bpm/View/screen/bloodpreasure/average.dart';
import 'package:bpm/View/screen/bloodpreasure/latest.dart';
import 'package:bpm/View/screen/bloodpreasure/max.dart';
import 'package:bpm/View/screen/bloodpreasure/min.dart';
import 'package:bpm/View/screen/bphistory/bphistory.dart';
import 'package:bpm/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BloodPressure extends StatefulWidget {
  const BloodPressure({super.key});

  @override
  State<BloodPressure> createState() => _BloodPressureState();
}

class _BloodPressureState extends State<BloodPressure> {
  @override
  Widget build(BuildContext context) {
    final bottomBarIndexProvider = Provider.of<BottomBarIndexProvider>(context);
    return DefaultTabController(
      length: 4,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: globalColors.primaryColor,
            elevation: 4,
            title: Text(
              "Blood Pressure",
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
                    bottomBarIndexProvider.setBottomIndex(index: 0);
                  },
                  child: Icon(Icons.arrow_back_ios_new,
                      color: globalColors.textColor)),
            ),
            actions: [
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return HistoryScreen();
                    },
                  ));
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 20, top: 5),
                  child: SizedBox(
                      height: 25,
                      width: 25,
                      child: Image(
                          image: AssetImage('assets/images/Refresh.png'))),
                ),
              )
            ],
            bottom: TabBar(
              unselectedLabelColor: globalColors.textColor,
              labelColor: globalColors.SecondaryColor,
              indicatorColor: globalColors.SecondaryColor,
              tabs: const [
                Tab(
                  text: "Max",
                ),
                Tab(
                  text: "Average",
                ),
                Tab(
                  text: "Min",
                ),
                Tab(
                  text: "Latest",
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: const [
              MaxScreen(),
              AverageScreen(),
              MinScreen(),
              LatestScreen()
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddNewRecord(),
                  ));
            },
            child: Icon(Icons.add),
            backgroundColor: globalColors.SecondaryColor,
          ),
        ),
      ),
    );
  }
}
