import 'package:flutter/material.dart';
import 'package:young_gardener/screens/home_page.dart';
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

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xffEDE8E8),
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(title: 'Home Page'),
        '/plantInfo': (context) => PlantInfoScreen(), // Здесь должен быть ваш PlantInfoScreen
      },
    );
  }
}

