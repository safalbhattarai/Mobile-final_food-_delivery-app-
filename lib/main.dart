import 'package:flutter/material.dart';
import 'package:safall_final_mobile_app/app/app.dart';
import 'package:safall_final_mobile_app/app/di/di.dart';
import 'package:safall_final_mobile_app/core/network/hive_service.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService().init();

  // await HiveService().clearStudentBox();

  await initDependencies();

  runApp(
    const MyApp(),
  );
}
