import 'package:flutter/material.dart';
import 'package:young_gardener/screens/plant_info_screen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:young_gardener/main-screen.dart';
import 'package:flutter/material.dart';
import 'package:young_gardener/screens/Auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:young_gardener/screens/Searchscreen.dart';
import 'package:young_gardener/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RegisterPage(),
      routes: {PlantInfoScreen.infoScreen : (BuildContext context)=>PlantInfoScreen(),
        SearchScreen.searchScreen : (BuildContext context)=>SearchScreen(),
        AuthPage.authScreen : (BuildContext context)=>AuthPage(),
        MainScreen.mainScreen : (BuildContext context)=>MainScreen(),
        RegisterPage.regScreen : (BuildContext context)=>RegisterPage()},
    );
  }
}