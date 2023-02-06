// ignore_for_file: prefer_const_constructors, avoid_print
import 'package:bpm/ControllerProvider/bpprovider/avgbpprovider.dart';
import 'package:bpm/ControllerProvider/bottombarindexprovider.dart';
import 'package:bpm/ControllerProvider/bpprovider/bpchartprovider.dart';
import 'package:bpm/ControllerProvider/bpprovider/bpselectorvaluesprovider.dart';
import 'package:bpm/ControllerProvider/bpprovider/latestbpprovider.dart';
import 'package:bpm/ControllerProvider/bpprovider/maxbpprovider.dart';
import 'package:bpm/ControllerProvider/bpprovider/minbpprovider.dart';
import 'package:bpm/ControllerProvider/sugerprovider.dart';
import 'package:bpm/ControllerProvider/sugerprovider/selectedstateprovider.dart';
import 'package:bpm/ControllerProvider/sugerprovider/sugerchartprovider.dart';
import 'package:bpm/ControllerProvider/sugerprovider/sugervalueprovider.dart';
import 'package:bpm/ControllerProvider/sugerprovider/textfieldvalueprovider.dart';
import 'package:bpm/View/SplashScreen/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'package:native_notify/native_notify.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'View/notificationservice/local_notification_service.dart';

bool? seenOnboard;

Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification!.title);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  LocalNotificationService.initialize();
  // NativeNotify.initialize(2506, 'rjKtRDB4KfywP5UPL5b4KL', null, null);
  MobileAds.instance.initialize(); 
  // to show status bar
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  // to load onboard for the first time only
  SharedPreferences pref = await SharedPreferences.getInstance();
  seenOnboard = pref.getBool('seenOnboard') ?? false;  
  await GetStorage.init();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SugerProvider()),
        ChangeNotifierProvider(create: (_) => MaxBpProvier()),
        ChangeNotifierProvider(create: (_) => MinBpProvier()),
        ChangeNotifierProvider(create: (_) => AvgBpProvier()),
        ChangeNotifierProvider(create: (_) => LatestBpProvier()),
        ChangeNotifierProvider(create: (_) => BottomBarIndexProvider()),
        ChangeNotifierProvider(create: (_) => BpChartProvider()),
        ChangeNotifierProvider(create: (_) => SelectedSateProvider()),
        ChangeNotifierProvider(create: (_) => SugerValueProvider()),
        ChangeNotifierProvider(create: (_) => SugerChartProvider()),
        ChangeNotifierProvider(create: (_) => bpSelectedValuesProvider()),
        ChangeNotifierProvider(create: (_) => TextFieldValueProvider()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.pink,
            // backgroundColor:  LinearGradient(colors: [Colors.blue, Colors.green]),
          ),
          home: SplashScreen()),
    );
  }
}
