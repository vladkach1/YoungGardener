import 'package:flutter/material.dart';
import 'package:young_gardener/screens/home_page.dart';
import 'package:young_gardener/screens/plant_info_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App',
      theme: ThemeData(
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
