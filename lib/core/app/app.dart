
import 'package:driver_safety/features/auth/presentation/cubit/sign_in_cubit/sign_in_cubit.dart';
import 'package:driver_safety/features/auth/presentation/cubit/sign_up_cubit/sign_up_cubit.dart';
import 'package:driver_safety/features/auth/presentation/views/sign_in_view.dart';
import 'package:driver_safety/features/home/presentation/cubit/home_cubit/home_cubit.dart';
import 'package:driver_safety/features/home/presentation/cubit/home_nav_cubit/home_nav_cubit.dart';
import 'package:driver_safety/features/home/presentation/view/home_page_view.dart';
import 'package:driver_safety/features/profile/presentation/profile_update_cubit/profile_update_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../resources_manager/constants_manager.dart';
import '../resources_manager/theme_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp._internal();

  static const MyApp _instance = MyApp._internal(); 
  factory MyApp() => _instance;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: 
      [
        BlocProvider(create: (context)=> HomeCubit()),
        BlocProvider(create: (context)=> HomeNavCubit()),
        BlocProvider(create: (context)=> SignUpCubit()),
        BlocProvider(create: (context)=> SignInCubit()),
        BlocProvider(create: (context)=> ProfileUpdateCubit()),
      ],
      child: GetMaterialApp(
        theme: ThemeManager.light,
        title: ConstantsManager.appName,
        debugShowCheckedModeBanner: false,
        home: FirebaseAuth.instance.currentUser ==null ? const SignInView() : const HomePageView(),
      ),
    );
  }
}
