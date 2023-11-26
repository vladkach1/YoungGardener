import 'package:flutter/material.dart';
import 'package:young_gardener/screens/Auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:young_gardener/screens/Searchscreen.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}