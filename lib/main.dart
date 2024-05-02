import 'package:driver_safety/core/cache_helper/cache_data.dart';
import 'package:driver_safety/core/cache_helper/cache_helper.dart';
import 'package:driver_safety/core/cache_helper/cache_helper_keys.dart';
import 'package:driver_safety/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'core/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,

  );
  await CacheHelper.init();
  CacheData.firstOpen= await CacheHelper.getData(key: CacheHelperKeys.firstOpen);
  //todo check first open
  runApp( MyApp());
}

//branch 2


