
import 'package:driver_safety/features/home/presentation/view/home_page_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../resources_manager/constants_manager.dart';
import '../resources_manager/theme_manager.dart';

class MyApp extends StatefulWidget {
  const MyApp._internal();

  static const MyApp _instance = MyApp._internal(); // singleton
  factory MyApp() => _instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {

    FirebaseAuth.instance.authStateChanges().listen((User? user) {

      if (user == null) {
        print('------------------------------User is currently signed out!');
      } else {
        print('------------------------------User is signed in!');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeManager.light,
      title: ConstantsManager.appName,
      debugShowCheckedModeBanner: false,
      home: const HomePageView(),
    );
  }
}
 //my t3del wa saber