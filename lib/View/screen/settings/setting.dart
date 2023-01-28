// ignore_for_file: unused_import, implementation_imports, unnecessary_import, camel_case_types, prefer_const_declarations, unnecessary_string_interpolations, non_constant_identifier_names, use_build_context_synchronously, empty_catches, avoid_print, deprecated_member_use

import 'package:bpm/ControllerProvider/bpprovider/avgbpprovider.dart';
import 'package:bpm/ControllerProvider/bpprovider/bpchartprovider.dart';
import 'package:bpm/ControllerProvider/sugerprovider.dart';
import 'package:bpm/ControllerProvider/sugerprovider/sugerchartprovider.dart';
import 'package:bpm/ControllerProvider/sugerprovider/sugervalueprovider.dart';
import 'package:bpm/View/screen/settings/genratereport/api/pdf_api.dart';
import 'package:bpm/View/screen/settings/genratereport/api/pdf_invoice_api.dart';
import 'package:bpm/View/screen/settings/model/customer.dart';
import 'package:bpm/View/screen/settings/model/invoice.dart';
import 'package:bpm/View/screen/settings/model/supplier.dart';
import 'package:bpm/View/screen/settings/privancypolicy.dart';
import 'package:bpm/services/sqlite_service.dart';
import 'package:bpm/services/sugerServices.dart';
import 'package:bpm/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:store_redirect/store_redirect.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

import '../../../Model/sugermodel.dart';

class setting extends StatefulWidget {
  const setting({super.key});

  @override
  State<setting> createState() => _settingState();
}

class _settingState extends State<setting> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      try {
        final sugerProvider =
            Provider.of<SugerProvider>(context, listen: false);
        final data = await SqliteService.getItems();
        for (var item in data) {
          sugerProvider.setSugerList(item);
        }
        final bpChartProvider =
            Provider.of<BpChartProvider>(context, listen: false);
        bpChartProvider.setChart(context);
        //Now here we are fetching data from suger Table
        final sugerData = await SugerServices.getItems();
        final sugerValueProvider =
            Provider.of<SugerValueProvider>(context, listen: false);
        for (var item in sugerData) {
          sugerValueProvider.setSugerList(item);
        }
        final chartProvider =
            Provider.of<SugerChartProvider>(context, listen: false);
        chartProvider.setChart(context);
      } catch (e) {}
    });
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
    return Scaffold(
      backgroundColor: globalColors.primaryColor,
      appBar: AppBar(
        backgroundColor: globalColors.primaryColor,
        elevation: 4,
        bottomOpacity: 1.5,
        // ignore: prefer_const_constructors
        title: Text(
          "Setting",
          // ignore: prefer_const_constructors
          style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: globalColors.textColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 32, left: 24, right: 25),
        child: Column(
          children: [
            Container(
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width * 1.0,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    color: globalColors.Gray_Background),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        children: <Widget>[
                          Consumer<SugerValueProvider>(
                            builder: (context, value, child) {
                              return InkWell(
                                onTap: () async {
                                  int mgddlValue=0;
                                  for (SugerModel item in value.sugerProviderList) {
                                    mgddlValue = (mgddlValue + item.mgddl);
                                  }
                                  final date = DateTime.now();
                                  final dueDate = date.add(const Duration(days: 7));
                                  final invoice = Invoice(
                                    info: InvoiceInfo(
                                      date: date,
                                      dueDate: dueDate,
                                      number: '${DateTime.now().year}-9999',
                                    ),
                                    items: [
                                      InvoiceItem(
                                        nameoftest: "Blood Suger",
                                        value: (mgddlValue /value.sugerProviderList.length).toString(),
                                        pulse: "",
                                        totalAverage: "",
                                        unitName: "mg/dL",
                                      ),
                                      // InvoiceItem(
                                      //   sys:
                                      //       "${double.parse(((value.sugerProviderList / value.avgdivideby)).toStringAsFixed(2))}",
                                      //   dia:
                                      //       "${double.parse(((value.avgDia / value.avgdivideby)).toStringAsFixed(2))}",
                                      //   pulse:
                                      //       "${double.parse(((value.avgPulse / value.avgdivideby)).toStringAsFixed(2))}",
                                      //   totalAverage:
                                      //       ((sysvalue + diaValue + pulseValue / 3)
                                      //           .toStringAsFixed(2)),
                                      //   unitPrice:
                                      //       ((sysvalue + diaValue + pulseValue / 3)
                                      //           .toStringAsFixed(2)),
                                      // ),
                                    ],
                                  );
                                  final pdfFile =
                                      await PdfInvoiceApi.generate(invoice);
                                  PdfApi.openFile(pdfFile);
                                },
                                child: const Padding(
                                  padding: EdgeInsets.only(
                                      top: 15, left: 19, bottom: 15, right: 19),
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(12))),
                                    child: ListTile(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12))),
                                      // leading: Icon(Icons.content_paste_go_outlined),
                                      leading: Padding(
                                        padding: EdgeInsets.only(
                                          left: 3,
                                          top: 5,
                                        ),
                                        child: SizedBox(
                                            height: 20,
                                            width: 20,
                                            child: Image(
                                              image: AssetImage(
                                                  'assets/images/Export_Report.png'),
                                            )),
                                      ),
                                      title: Text(
                                        'Export Report',
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          const Padding(
                            padding:
                                EdgeInsets.only(left: 19, bottom: 15, right: 19),
                            child: Text(
                              "General",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              StoreRedirect.redirect(
                                androidAppId: "com.devglim.nooraniqaida",
                              );
                            },
                            child: const Padding(
                              padding:
                                  EdgeInsets.only(left: 19, bottom: 15, right: 19),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12))),
                                child: ListTile(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12))),
                                  leading: Icon(Icons.star_border_rounded),
                                  title: Text(
                                    'Rate Us',
                                    style: TextStyle(
                                        fontSize: 17, fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              // final UrlPreview =
                              //     "https://play.google.com/store/apps/details?id=com.devglim.nooraniqaida";
                              // await Share.share("$UrlPreview");
                              try {
                                Share.share(
                                    "https://play.google.com/store/apps/details?id=com.devglim.nooraniqaida");
                              } catch (e) {
                                print(e.toString());
                              }
                            },
                            child: const Padding(
                              padding:
                                  EdgeInsets.only(left: 19, bottom: 15, right: 19),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12))),
                                child: ListTile(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12))),
                                  leading: Icon(Icons.share_outlined),
                                  title: Text(
                                    'Share App',
                                    style: TextStyle(
                                        fontSize: 17, fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              launch('mailto:viralswipe695@gmail.com');
                            },
                            child: const Padding(
                              padding:
                                  EdgeInsets.only(left: 19, bottom: 15, right: 19),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12))),
                                child: ListTile(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12))),
                                  leading: Padding(
                                    padding: EdgeInsets.only(
                                      left: 3,
                                      top: 5,
                                    ),
                                    child: SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: Image(
                                          image: AssetImage(
                                              "assets/images/Feedback.png"),
                                        )),
                                  ),
                                  title: Text(
                                    'FeedBack',
                                    style: TextStyle(
                                        fontSize: 17, fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PrivacyPolicy(),
                                  ));
                            },
                            child: const Padding(
                              padding:
                                  EdgeInsets.only(left: 19, bottom: 15, right: 19),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12))),
                                child: ListTile(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12))),
                                  leading: Padding(
                                    padding: EdgeInsets.only(
                                      left: 3,
                                      top: 5,
                                    ),
                                    child: SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: Image(
                                          image: AssetImage(
                                              "assets/images/Privacy_Policy.png"),
                                        )),
                                  ),
                                  title: Text(
                                    'Privacy policy',
                                    style: TextStyle(
                                        fontSize: 17, fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                        
                      ),
                    ),],
                )
                ),
          const Spacer(),
          isloaded?
            SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width * .9,
                child: AdWidget(ad: bannerAd!),
              ):
                 Container(
                   height: 50,
                   width: MediaQuery.of(context).size.width * .9,
                   decoration: const BoxDecoration(
                     color: globalColors.AddColor,
                   ),
                   child: const Center(
                       child: Text(
                     'Ad',
                     style: TextStyle(
                         color: globalColors.BlackColor,
                         fontSize: 20,
                         fontWeight: FontWeight.w600,
                         fontFamily: 'Inter'),
                   )),
                 ),
          const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
