import 'package:flutter/material.dart';
import 'package:young_gardener/register.dart';

void main() => runApp(YgApp());

class YgApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: RegisterPage());
  }
}
