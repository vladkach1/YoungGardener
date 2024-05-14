import 'package:flutter/material.dart';

class PlantDescription extends StatelessWidget {
  const PlantDescription({
    Key? key,
    required this.textDescriptionStyle,
    required this.textDescription,
  }) : super(key: key);

  final TextStyle textDescriptionStyle;
  final String textDescription;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Text(
        textDescription,
        style: textDescriptionStyle,
      ),
    );
  }
}
