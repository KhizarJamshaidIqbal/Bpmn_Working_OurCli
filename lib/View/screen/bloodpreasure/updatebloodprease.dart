// ignore_for_file: sort_child_properties_last, prefer_const_constructors, use_build_context_synchronously, prefer_typing_uninitialized_variables, empty_catches, duplicate_ignore, use_full_hex_values_for_flutter_colors, unused_field, avoid_print, must_be_immutable, unused_element, unnecessary_this
import 'package:bpm/ControllerProvider/bpprovider/bpchartprovider.dart';
import 'package:bpm/ControllerProvider/bpprovider/latestbpprovider.dart';
import 'package:bpm/ControllerProvider/sugerprovider.dart';
import 'package:bpm/Model/sugercalmodel.dart';
import 'package:bpm/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../ControllerProvider/bpprovider/avgbpprovider.dart';
import '../../../ControllerProvider/bpprovider/maxbpprovider.dart';
import '../../../ControllerProvider/bpprovider/minbpprovider.dart';
import '../../../services/sqlite_service.dart';

class UpdateBloodPreasure extends StatefulWidget {
  int sysvalue, diavalue, plusevalue;

  String date, time, id;
  UpdateBloodPreasure(
      {super.key,
      required this.id,
      required this.sysvalue,
      required this.diavalue,
      required this.plusevalue,
      required this.date,
      required this.time});

  @override
  // ignore: no_logic_in_create_state
  State<UpdateBloodPreasure> createState() => _UpdateBloodPreasureState(
      id: id,
      sysvalue: sysvalue,
      diavalue: diavalue,
      plusevalue: plusevalue,
      date: date,
      time: time);
}


class _UpdateBloodPreasureState extends State<UpdateBloodPreasure> {
  int sysvalue, diavalue, plusevalue;

  String date, time, id;
  _UpdateBloodPreasureState(
      {required this.id,
      required this.sysvalue,
      required this.diavalue,
      required this.plusevalue,
      required this.date,
      required this.time});
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
    formattedDate = date;
    formattedTime = time;
    this._sqliteService = SqliteService();
    // SqliteService.initializeDB().whenComplete(() async {
    //   await _refreshNotes();
    //   setState(() {});
    // });
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
    for (var i = 50; i <= 150; i++) {
      sysList.add(i);
      diaList.add(i);
    }
    for (var i = 60; i <= 180; i++) {
      pulseList.add(i);
    }



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
          "Edit",
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
            Container(
              height: 55,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 13, right: 14),
                    child: SizedBox(
                      height: 25,
                      width: 25,
                      child:
                          Image(image: AssetImage('assets/images/info_4.png')),
                    ),
                  ),
                  Text(
                    "Normal Blood Pressure",
                    style: TextStyle(
                      color: globalColors.primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: globalColors.Green,
                  borderRadius: BorderRadius.circular(12)),
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
                                        onSelectedItemChanged: (ind) {
                                          setState(() {
                                            _selectedItemIndexSys = ind;

                                            sysvalue = ind;
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
                                                  // index=sysvalue;
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
                                          // print(index);
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
                  final sobj = SugerCalculateModel(
                      id: id.toString(),
                      sysTolic: sysList[_selectedItemIndexSys],
                      diasTolic: diaList[_selectedItemIndexDia],
                      pulse: pulseList[_selectedItemIndexPulse],
                      date: formattedDate,
                      time: formattedTime);
                  await SqliteService.updateItem(sobj, id);
                  List allItems = await SqliteService.getItems();
                  sugerprovider.clearlist();
                  for (var item in allItems) {
                    sugerprovider.setSugerList(item);
                  }
                  final maxBpProvider =
                      Provider.of<MaxBpProvier>(context, listen: false);
                  final avgBpProvider =
                      Provider.of<AvgBpProvier>(context, listen: false);
                  final updateBpProvider =
                      Provider.of<MinBpProvier>(context, listen: false);
                  final latestBpProvider =
                      Provider.of<LatestBpProvier>(context, listen: false);
                  final bpChartProvider =
                      Provider.of<BpChartProvider>(context, listen: false);
                  maxBpProvider.setMaxBp(context: context);
                  avgBpProvider.setAvgBp(context: context);
                  updateBpProvider.setMinBp(context: context);
                  latestBpProvider.setLatestBp(context: context);
                  bpChartProvider.setChart(context);
                  Navigator.pop(context);
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
          isloaded?
          Padding(
                    padding: const EdgeInsets.only(bottom: 58),
                  child: SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width * .9,
                      child: AdWidget(ad: bannerAd!),
                    ),
                )
            :
                 Padding(
                    padding: const EdgeInsets.only(bottom: 40),
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
