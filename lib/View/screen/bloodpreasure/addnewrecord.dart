// ignore_for_file: sort_child_properties_last, prefer_const_constructors, use_build_context_synchronously, prefer_typing_uninitialized_variables, empty_catches, duplicate_ignore, use_full_hex_values_for_flutter_colors, unused_field, unused_element, unnecessary_this, avoid_print, unused_local_variable
import 'package:bpm/ControllerProvider/bpprovider/avgbpprovider.dart';
import 'package:bpm/ControllerProvider/bpprovider/bpchartprovider.dart';
import 'package:bpm/ControllerProvider/bpprovider/bpselectorvaluesprovider.dart';
import 'package:bpm/ControllerProvider/bpprovider/latestbpprovider.dart';
import 'package:bpm/ControllerProvider/bpprovider/minbpprovider.dart';
import 'package:bpm/ControllerProvider/sugerprovider.dart';
import 'package:bpm/Model/sugercalmodel.dart';
import 'package:bpm/utils/bptypedata.dart';
import 'package:bpm/utils/colors.dart';
import 'package:bpm/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../ControllerProvider/bpprovider/maxbpprovider.dart';
import '../../../services/sqlite_service.dart';

class AddNewRecord extends StatefulWidget {
  const AddNewRecord({super.key});

  @override
  State<AddNewRecord> createState() => _AddNewRecordState();
}

class _AddNewRecordState extends State<AddNewRecord> {
  InterstitialAd? interstitialAd;
  int _selectedItemIndexSys = 0;
  int _selectedItemIndexDia = 0;
  int _selectedItemIndexPulse = 0;
  List sysList = [];
  List diaList = [];
  List pulseList = [];

  late FixedExtentScrollController _controllerSys;

  DateTime now = DateTime.now();

  var formattedDate;
  var formattedTime;
  void _datePicker() async {
    try {
      DateTime? date = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2050));
      formattedDate = DateFormat('yyyy-MM-dd').format(date!);
    } catch (e) {}
  }

  void _timePicker() async {
    try {
      TimeOfDay? time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: 12, minute: 23),
      );
      formattedTime = time!.format(context);
    } catch (e) {
      formattedTime = DateFormat('kk:mm').format(now);
    }
  }

  late SqliteService _sqliteService;
  List<SugerCalculateModel> _sugerCalculateList = [];
// This function is used to fetch all data from the database
  Future<void> _refreshNotes() async {
    final data = await SqliteService.getItems();
    setState(() {
      _sugerCalculateList = data;
    });
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    _controllerSys = FixedExtentScrollController();
    formattedDate = DateFormat('yyyy-MM-dd').format(now);
    formattedTime = DateFormat('kk:mm').format(now);
    this._sqliteService = SqliteService();
    for (var i = 50; i <= 150; i++) {
      sysList.add(i);
      diaList.add(i);
    }
    for (var i = 60; i <= 180; i++) {
      pulseList.add(i);
    }
  }

BannerAd? bannerAd;
bool isloaded=false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bannerAd=BannerAd(
      size: AdSize.banner,
       adUnitId: "ca-app-pub-3940256099942544/6300978111", 
       listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            isloaded=true;
            
          });
        print("Banner is Loaded");
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
       ),
        request: const AdRequest());
        bannerAd!.load();

  }
  @override
  Widget build(BuildContext context) {
    final sugerprovider = Provider.of<SugerProvider>(context, listen: false);
    final bpValuesProvider =
        Provider.of<bpSelectedValuesProvider>(context, listen: false);
    var scHeight = MediaQuery.of(context).size.height;
    var scWidth = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: globalColors.primaryColor,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: const Icon(
              Icons.arrow_back_ios,
              color: globalColors.textColor,
            ),
          ),
        ),
        backgroundColor: globalColors.primaryColor,
        elevation: 4,
        bottomOpacity: 1.5,
        // ignore: prefer_const_constructors
        title: Text(
          "New Record",
          // ignore: prefer_const_constructors
          style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: globalColors.textColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Utils.showDialog(context, scHeight, scWidth,
                    "Blood Pressure Types", BP_types_data.BP_data);
              },
              child: Container(
                height: 55,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 13, right: 14),
                        child: SizedBox(
                          height: 25,
                          width: 25,
                          child: Image(
                              image: AssetImage('assets/images/info_4.png')),
                        ),
                      ),
                      // "Normal Blood Pressure"
                      Text(
                        sysList[_selectedItemIndexSys] < 120 &&
                                diaList[_selectedItemIndexDia] < 80
                            ? "Normal Blood Pressure"
                            : sysList[_selectedItemIndexSys] >= 120 &&
                                    sysList[_selectedItemIndexSys] <= 129 &&
                                    diaList[_selectedItemIndexDia] < 80
                                ? "Elivated Blood Pressure"
                                : sysList[_selectedItemIndexSys] > 130 &&
                                        sysList[_selectedItemIndexSys] < 140 &&
                                        diaList[_selectedItemIndexDia] > 80 &&
                                        sysList[_selectedItemIndexSys] < 90
                                    ? "High Blood Pressure Stage-II"
                                    : sysList[_selectedItemIndexSys] < 180 &&
                                            sysList[_selectedItemIndexSys] >
                                                140 &&
                                            diaList[_selectedItemIndexDia] >
                                                90 &&
                                            diaList[_selectedItemIndexDia] > 120
                                        ? "Dangerously High Blood Pressure"
                                        : "Dangerously High Blood Pressure",
                        style: TextStyle(
                          color: globalColors.primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: sysList[_selectedItemIndexSys] < 120 &&
                            diaList[_selectedItemIndexDia] < 80
                        ? globalColors.ColorsList[0]
                        : sysList[_selectedItemIndexSys] >= 120 &&
                                sysList[_selectedItemIndexSys] <= 129 &&
                                diaList[_selectedItemIndexDia] < 80
                            ? globalColors.ColorsList[1]
                            : sysList[_selectedItemIndexSys] > 130 &&
                                    sysList[_selectedItemIndexSys] < 140 &&
                                    diaList[_selectedItemIndexDia] > 80 &&
                                    sysList[_selectedItemIndexSys] < 90
                                ? globalColors.ColorsList[2]
                                : _selectedItemIndexSys < 180 &&
                                        sysList[_selectedItemIndexSys] > 140 &&
                                        diaList[_selectedItemIndexDia] > 90 &&
                                        diaList[_selectedItemIndexDia] > 120
                                    ? globalColors.ColorsList[3]
                                    : globalColors.ColorsList[4],
                    borderRadius: BorderRadius.circular(12)),
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Material(
              elevation: 8,
              borderRadius: BorderRadius.circular(12),
              child: Container(
                height: 195,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: globalColors.primaryColor),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 7,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 17, right: 32),
                        child: Row(
                          children: [
                            Column(
                              children: const [
                                Text(
                                  "Systolic",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "mmHg",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400,
                                      color: globalColors.textColor),
                                )
                              ],
                            ),
                            Spacer(),
                            Column(
                              children: const [
                                Text(
                                  "Diastolic",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "mmHg",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400,
                                      color: globalColors.textColor),
                                )
                              ],
                            ),
                            Spacer(),
                            Column(
                              children: const [
                                Text(
                                  "Pulse",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "mmHg",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400,
                                      color: globalColors.textColor),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 7),
                        child: Container(
                          height: 1,
                          width: double.infinity,
                          color: globalColors.textColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 26),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 130,
                              width: 50,
                              child: Column(
                                children: [
                                  Expanded(
                                    child: ListWheelScrollView.useDelegate(
                                        controller: _controllerSys,
                                        onSelectedItemChanged: (index) {
                                          setState(() {
                                            _selectedItemIndexSys = index;
                                          });
                                          // print(index);
                                        },
                                        itemExtent: 40,
                                        diameterRatio: 1.2,
                                        physics: FixedExtentScrollPhysics(),
                                        perspective: 0.00005,
                                        childDelegate:
                                            ListWheelChildBuilderDelegate(
                                                childCount: sysList.length,
                                                builder: (context, index) {
                                                  return Column(
                                                    children: [
                                                      _selectedItemIndexSys ==
                                                              index
                                                          ? Container(
                                                              height: 1,
                                                              width: double
                                                                  .infinity,
                                                              color: globalColors
                                                                  .textColor,
                                                            )
                                                          : Container(),
                                                      Text(
                                                        sysList[index]
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 17,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: _selectedItemIndexSys ==
                                                                    index
                                                                ? Colors.black
                                                                : globalColors
                                                                    .textColor),
                                                      ),
                                                      _selectedItemIndexSys ==
                                                              index
                                                          ? Container(
                                                              height: 1,
                                                              width: double
                                                                  .infinity,
                                                              color: globalColors
                                                                  .textColor,
                                                            )
                                                          : Container(),
                                                    ],
                                                  );
                                                })),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            SizedBox(
                              height: 130,
                              width: 50,
                              child: Column(
                                children: [
                                  Expanded(
                                    child: ListWheelScrollView.useDelegate(
                                        controller: _controllerSys,
                                        onSelectedItemChanged: (index) {
                                          setState(() {
                                            _selectedItemIndexDia = index;
                                          });

                                          // print(index);
                                        },
                                        itemExtent: 40,
                                        diameterRatio: 1.2,
                                        physics: FixedExtentScrollPhysics(),
                                        perspective: 0.00005,
                                        childDelegate:
                                            ListWheelChildBuilderDelegate(
                                                childCount: diaList.length,
                                                builder: (context, index) {
                                                  return Column(
                                                    children: [
                                                      _selectedItemIndexDia ==
                                                              index
                                                          ? Container(
                                                              height: 1,
                                                              width: double
                                                                  .infinity,
                                                              color: globalColors
                                                                  .textColor,
                                                            )
                                                          : Container(),
                                                      Text(
                                                        diaList[index]
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 17,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: _selectedItemIndexDia ==
                                                                    index
                                                                ? Colors.black
                                                                : globalColors
                                                                    .textColor),
                                                      ),
                                                      _selectedItemIndexDia ==
                                                              index
                                                          ? Container(
                                                              height: 1,
                                                              width: double
                                                                  .infinity,
                                                              color: globalColors
                                                                  .textColor,
                                                            )
                                                          : Container(),
                                                    ],
                                                  );
                                                })),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            SizedBox(
                              height: 130,
                              width: 50,
                              child: Column(
                                children: [
                                  Expanded(
                                    child: ListWheelScrollView.useDelegate(
                                        controller: _controllerSys,
                                        onSelectedItemChanged: (index) {
                                          setState(() {
                                            _selectedItemIndexPulse = index;
                                          });
                                        },
                                        itemExtent: 40,
                                        diameterRatio: 1.2,
                                        physics: FixedExtentScrollPhysics(),
                                        perspective: 0.00005,
                                        childDelegate:
                                            ListWheelChildBuilderDelegate(
                                                childCount: pulseList.length,
                                                builder: (context, index) {
                                                  return Column(
                                                    children: [
                                                      _selectedItemIndexPulse ==
                                                              index
                                                          ? Container(
                                                              height: 1,
                                                              width: double
                                                                  .infinity,
                                                              color: globalColors
                                                                  .textColor,
                                                            )
                                                          : Container(),
                                                      Text(
                                                        pulseList[index]
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 17,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: _selectedItemIndexPulse ==
                                                                    index
                                                                ? Colors.black
                                                                : globalColors
                                                                    .textColor),
                                                      ),
                                                      _selectedItemIndexPulse ==
                                                              index
                                                          ? Container(
                                                              height: 1,
                                                              width: double
                                                                  .infinity,
                                                              color: globalColors
                                                                  .textColor,
                                                            )
                                                          : Container(),
                                                    ],
                                                  );
                                                })),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Date & Time",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Inter',
                      color: globalColors.BlackColor),
                ),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Material(
              color: globalColors.Gray_Background,
              // elevation: 2,
              borderRadius: BorderRadius.circular(12),
              child: Container(
                height: 63,
                width: 312,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          _datePicker();
                        });
                      },
                      child: Material(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.white,
                        elevation: 2,
                        child: Container(
                          height: 37,
                          width: 142,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: globalColors.primaryColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.date_range),
                                Spacer(),
                                Text(
                                  formattedDate.toString(),
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400),
                                ),
                                Spacer(),
                                Spacer(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _timePicker();
                        });
                      },
                      child: Material(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.white,
                        elevation: 2,
                        child: Container(
                          height: 37,
                          width: 142,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.more_time_sharp),
                                Spacer(),
                                Text(
                                  formattedTime.toString(),
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400),
                                ),
                                Spacer(),
                                Spacer(),
                                Spacer(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  // color: Color(0xfffafafa)
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 42,
              width: 312,
              child: ElevatedButton(
                onPressed: () async {
                  final maxBpProvider =
                      Provider.of<MaxBpProvier>(context, listen: false);
                  final avgBpProvider =
                      Provider.of<AvgBpProvier>(context, listen: false);
                  final minBpProvider =
                      Provider.of<MinBpProvier>(context, listen: false);
                  final latestBpProvider =
                      Provider.of<LatestBpProvier>(context, listen: false);
                  final bpChartProvider =
                      Provider.of<BpChartProvider>(context, listen: false);
                  final sobj = SugerCalculateModel(
                      sysTolic: sysList[_selectedItemIndexSys],
                      diasTolic: diaList[_selectedItemIndexDia],
                      pulse: pulseList[_selectedItemIndexPulse],
                      date: formattedDate,
                      time: formattedTime);
                  int id = await SqliteService.createItem(sobj);
                  sobj.id = id.toString();
                  sugerprovider.setSugerList(sobj);
                  avgBpProvider.setAvgBp(context: context);
                  maxBpProvider.setMaxBp(context: context);
                  minBpProvider.setMinBp(context: context);
                  latestBpProvider.setLatestBp(context: context);
                  bpChartProvider.setChart(context);
                  
                  // Navigator.pop(context);

                  InterstitialAd.load(
                      adUnitId: "ca-app-pub-3940256099942544/1033173712",
                      request: const AdRequest(),
                      adLoadCallback: InterstitialAdLoadCallback(
                        onAdLoaded: (ad) {
                          interstitialAd = ad;
                          ad.show();

                          interstitialAd?.fullScreenContentCallback =
                              FullScreenContentCallback(
                                  onAdDismissedFullScreenContent: (ad) {
                            interstitialAd?.dispose();
                            ad.dispose();
                            Navigator.pop(context);
                          }, onAdFailedToShowFullScreenContent: (ad, err) {
                            ad.dispose();
                            interstitialAd?.dispose();
                          });
                        },
                        onAdFailedToLoad: (err) {
                          interstitialAd?.dispose();
                        },
                      ),
                    );
                },
                child: Text(
                  "Save",
                  style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: globalColors.Primary_Pink,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    )),
              ),
            ),
          Spacer(),
          // SizedBox(height: 130,),
          isloaded?
            Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                  child: SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width * .9,
                      child: AdWidget(ad: bannerAd!),
                    ),
                ):
                 Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * .9,
                      decoration: BoxDecoration(
                        color: globalColors.AddColor,
                      ),
                      child: Center(
                          child: Text(
                        'Ad',
                        style: TextStyle(
                            color: globalColors.BlackColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Inter'),
                      )),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}




//  _selectedItemIndexSys < 120 && _selectedItemIndexDia < 80
//                             ? "Normal Blood Pressure"
//                             : _selectedItemIndexSys >= 120 &&
//                                     _selectedItemIndexSys <= 129 &&
//                                     _selectedItemIndexDia < 80
//                                 ? "Elivated Blood Pressure"
//                                 : _selectedItemIndexSys > 130 &&
//                                         _selectedItemIndexSys < 140 &&
//                                         _selectedItemIndexDia > 80 &&
//                                         _selectedItemIndexSys < 90
//                                     ? "High Blood Pressure Stage-II"
//                                     : _selectedItemIndexSys < 180 &&
//                                             _selectedItemIndexSys > 140 &&
//                                             _selectedItemIndexDia > 90 &&
//                                             _selectedItemIndexDia > 120
//                                         ? "Dangerously High Blood Pressure"
//                                         : "Dangerously High Blood Pressure", 