import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:help_you_decide/data/local_data.dart';
import 'package:help_you_decide/pages/home_page.dart';
import 'package:help_you_decide/widgets/unique_random.dart';

void main() {
  runApp(const MyApp());
}

var myColorScheme = ColorScheme.fromSeed(seedColor: Colors.brown);

var theme = ThemeData(
  colorScheme: myColorScheme,
  scaffoldBackgroundColor: const Color.fromARGB(255, 156, 229, 227),
  appBarTheme: AppBarTheme(
    // backgroundColor: Colors.redAccent, //在AppBar()設置
    foregroundColor: myColorScheme.onPrimary,
    titleTextStyle: GoogleFonts.lato(
      textStyle: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      // backgroundColor: myColorScheme.onPrimary,
      backgroundColor: Colors.white,
      disabledBackgroundColor: myColorScheme.onSecondary,
      // side: const BorderSide(
      //   color: Colors.orangeAccent,
      //   width: 2,
      // ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 3.0,
      textStyle: const TextStyle(fontSize: 18),
    ),
  ),
  textTheme: TextTheme(
    // headlineLarge: TextStyle(fontSize: 30.0, color: Colors.red),

    displayLarge:
        GoogleFonts.lato(fontSize: 28.0, color: Colors.black), //for wheel
    // bodyMedium: TextStyle(fontSize: 15.0, color: Colors.black), //wheel

    //  bodySmall: TextStyle(fontSize: 30.0, color: Colors.black),
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LocalData());
    Get.put(UniqueRandom());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: HomePage(),
    );
  }
}
