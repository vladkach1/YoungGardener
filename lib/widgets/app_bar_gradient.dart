import 'package:flutter/material.dart';

class appBarGradient extends StatelessWidget {
  const appBarGradient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 168, 209, 161),
            Color.fromARGB(255, 136, 207, 123),
          ],
        ),
      ),
    );
  }
}
