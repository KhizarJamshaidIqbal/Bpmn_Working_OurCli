// ignore_for_file: sort_child_properties_last, prefer_const_constructors, use_build_context_synchronously, prefer_typing_uninitialized_variables, empty_catches, duplicate_ignore, use_full_hex_values_for_flutter_colors, unused_field, unused_element, unnecessary_this, prefer_is_empty, sized_box_for_whitespace, avoid_print
import 'package:bpm/ControllerProvider/sugerprovider/selectedstateprovider.dart';
import 'package:bpm/ControllerProvider/sugerprovider/sugerchartprovider.dart';
import 'package:bpm/ControllerProvider/sugerprovider/sugervalueprovider.dart';
import 'package:bpm/ControllerProvider/sugerprovider/textfieldvalueprovider.dart';
import 'package:bpm/Model/sugercalmodel.dart';
import 'package:bpm/Model/sugermodel.dart';
import 'package:bpm/services/sugerServices.dart';
import 'package:bpm/utils/bstypedata.dart';
import 'package:bpm/utils/colors.dart';
import 'package:bpm/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../services/sqlite_service.dart';
import '../../../utils/stateltypedata.dart';

class AddSuger extends StatefulWidget {
  const AddSuger({super.key});

  @override
  State<AddSuger> createState() => _AddSugerState();
}

class _AddSugerState extends State<AddSuger> {
  InterstitialAd? interstitialAd;
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

  final mgDEditingController = TextEditingController(text: "45");
  @override
  void initState() {
    super.initState();
    formattedDate = DateFormat('yyyy-MM-dd').format(now);
    formattedTime = DateFormat('kk:mm').format(now);
    this._sqliteService = SqliteService();
  }

  @override
  void dispose() {
    // ignore: todo
    // TODO: implement dispose
    super.dispose();
    mgDEditingController.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  String selectedstate = "Default";
  // int mgDlvalue = 0;
  BannerAd? bannerAd;
  bool isloaded = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: "ca-app-pub-3940256099942544/6300978111",
        listener: BannerAdListener(
          onAdLoaded: (ad) {
            setState(() {
              isloaded = true;
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
    var scHeight = MediaQuery.of(context).size.height;
    var scWidth = MediaQuery.of(context).size.height;
    final textFieldValueProvider = Provider.of<TextFieldValueProvider>(context);
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
          "Blood Suger Record",
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Utils.showDialog(context, scHeight, scWidth,
                      "Blood Sugar Types (mg/dl)", BsTypeData.Bs_data);
                  // showdialog(context);
                },
                child: Consumer<TextFieldValueProvider>(
                  builder: (context, value, child) {
                    return Container(
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
                              child: Image(
                                  image:
                                      AssetImage('assets/images/info_4.png')),
                            ),
                          ),
                          Text(
                            value.getmgDlvalue < 72
                                ? "Low"
                                : value.getmgDlvalue >= 72 &&
                                        value.getmgDlvalue <= 98
                                    ? "Normal"
                                    : value.getmgDlvalue >= 99 &&
                                            value.getmgDlvalue <= 125
                                        ? "Pre-Diabetes"
                                        : value.getmgDlvalue >= 126 &&
                                                value.getmgDlvalue <= 200
                                            ? "Diabets"
                                            : "invalid Value",
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
                          color: value.getmgDlvalue < 72
                              ? globalColors.Green
                              : value.getmgDlvalue >= 72 &&
                                      value.getmgDlvalue <= 98
                                  ? globalColors.BG_pure_yello
                                  : value.getmgDlvalue >= 99 &&
                                          value.getmgDlvalue <= 125
                                      ? globalColors.BG_pure_Orange
                                      : value.getmgDlvalue >= 126
                                          ? globalColors.BG_Pure_red
                                          : globalColors.BG_Pure_red,
                          borderRadius: BorderRadius.circular(12)),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    "State",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              SizedBox(
                height: 17,
              ),
              Material(
                elevation: 8,
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color(0xffFAFAFA)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 7,
                    ),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Spacer(),
                        Consumer<SelectedSateProvider>(
                          builder: (context, value, child) {
                            return Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                value.getStateName,
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                            );
                          },
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            Utils.ShowStateDialog(
                                context: context,
                                height: scHeight,
                                width: scWidth,
                                title: "state",
                                dataList: StateType.statedataList);
                            setState(() {});
                          },
                          child: Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Icon(Icons.arrow_drop_down,
                                color: globalColors.SecondaryColor),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Material(
                elevation: 8,
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  height: 106,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color(0xffFAFAFA)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 7,
                    ),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Spacer(),
                            Text(
                              "mg/dL",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            Spacer(),
                            Text(
                              "mmol/l",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey),
                            ),
                            Spacer(),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Form(
                            key: _formKey,
                            child: SizedBox(
                              width: 176,
                              height: 40,
                              child: TextFormField(
                                controller: mgDEditingController,
                                textAlign: TextAlign.center,
                                cursorWidth: 1.5,
                                cursorHeight: 25,
                                onChanged: (valueKey) {
                                  if (valueKey.length > 0) {
                                    textFieldValueProvider.setValue(
                                        mgdlValue: int.parse(valueKey));
                                  }
                                },
                                keyboardType: TextInputType.number,
                                validator: (valueKey) {
                                  if (valueKey!.isEmpty) {
                                    return "Enter! mg/dL ";
                                  }
                                  if (int.parse(valueKey) < 72 ||
                                      int.parse(valueKey) <= 210) {
                                    return null;
                                  } else {
                                    return "Invalid! value";
                                  }
                                },
                                maxLengthEnforcement: MaxLengthEnforcement.none,
                                textAlignVertical: TextAlignVertical.center,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(4),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 0.5,
                                        color: globalColors
                                            .textColor), //<-- SEE HERE
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 0.5,
                                        color: globalColors.textColor),
                                  ),
                                ),
                              ),
                            )),
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
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
                    if (_formKey.currentState!.validate()) {
                      final selectedSateProvider =
                          Provider.of<SugerValueProvider>(context,
                              listen: false);
                      final selectedSatep = Provider.of<SelectedSateProvider>(
                          context,
                          listen: false);
                      var value = int.parse(mgDEditingController.text);
                      SugerModel sugerFormData = SugerModel(
                          id: "0",
                          date: formattedDate,
                          time: formattedTime,
                          mgddl: value,
                          sateName: selectedSatep.getStateName);
                      int id = await SugerServices.createItem(sugerFormData);
                      sugerFormData.id = id.toString();
                      selectedSateProvider.setSugerList(sugerFormData);
                      final chartProvider = Provider.of<SugerChartProvider>(
                          context,
                          listen: false);
                      chartProvider.setChart(context);
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
                    }
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
              // Spacer(),
              SizedBox(
                height: 130,
              ),
              isloaded
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width * .9,
                        child: AdWidget(ad: bannerAd!),
                      ),
                    )
                  : Padding(
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
      ),
    );
  }
}

showdialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (_) => AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            content: Builder(
              builder: (context) {
                // Get available height and width of the build area of this widget. Make a choice depending on the size.
                var height = MediaQuery.of(context).size.height;
                var width = MediaQuery.of(context).size.width;

                return Container(
                  height: height - 400,
                  width: width - 400,
                );
              },
            ),
          ));
}
