import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/core/constants/app_strings.dart';
import 'package:notes_app/core/routing/app_router.dart';
import 'package:notes_app/core/routing/routes.dart';

void main() async{
  await Hive.initFlutter();
  await Hive.openBox(AppStrings.notesBox);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 0,
          scrolledUnderElevation: 0,
          surfaceTintColor: Colors.transparent,
        ),
        brightness: Brightness.dark,
        fontFamily: 'Poppins',
      ),
      initialRoute: AppRoutes.homeScreen,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
