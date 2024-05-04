
import 'package:driver_safety/features/home/presentation/cubit/home_nav_cubit/home_nav_cubit.dart';
import 'package:driver_safety/features/home/presentation/view/home_page_view.dart';
import 'package:driver_safety/features/home/presentation/view/message_page.dart';
import 'package:driver_safety/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:driver_safety/features/profile/presentation/views/profile_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  User? user;
  @override
  void initState() {

    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {

        print('------------------------------User is currently signed out!');
      } else {
        this.user = user;
        print('------------------------------User is signed in!');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: 
      [
        BlocProvider(create: (context)=> HomeNavCubit())
      ],
      child: GetMaterialApp(
        theme: ThemeManager.light,
        title: ConstantsManager.appName,
        debugShowCheckedModeBanner: false,
        //home: const ContactPage(),
        home: user ==null && false ? const OnBoardingView() : const HomePageView(),
      ),
    );
  }
}
 //my t3del wa saber