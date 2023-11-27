import 'package:flutter/material.dart';
import 'package:young_gardener/screens/plant_info_screen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:young_gardener/main-screen.dart';
import 'package:young_gardener/screens/Auth.dart';
import 'package:young_gardener/screens/Searchscreen.dart';
import 'package:young_gardener/register.dart';


void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return MaterialApp(
      home: RegisterPage(),
      routes: {
        PlantInfoScreen.infoScreen : (BuildContext context)=>PlantInfoScreen(),
        SearchScreen.searchScreen : (BuildContext context)=>SearchScreen(),
        AuthPage.authScreen : (BuildContext context)=>AuthPage(),
        MainScreen.mainScreen : (BuildContext context)=>MainScreen(),
        RegisterPage.regScreen : (BuildContext context)=>RegisterPage()
        },
    );
  }

  
}