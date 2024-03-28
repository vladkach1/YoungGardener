import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:young_gardener/main-screen.dart';
import 'package:young_gardener/services/User.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    final user = Provider.of<UserYG?>(context);
    return MainScreen();
  }
}