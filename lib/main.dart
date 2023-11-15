import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Empty Page',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Empty Page'),
        ),
        body: EmptyPage(), // Пустая страница
      ),
    );
  }
}

class EmptyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(); // Пустой контейнер
  }
}
