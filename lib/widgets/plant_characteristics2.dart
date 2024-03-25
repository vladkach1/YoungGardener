
import 'package:flutter/material.dart';

class PlantCharacteristics2 extends StatelessWidget {
  const PlantCharacteristics2({
    Key? key,
    required this.textDescriptionStyle,
  }) : super(key: key);

  final TextStyle textDescriptionStyle;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                'assets/images/plant2.png',
                width: 129,
                height: 132,
              ),
              SizedBox(width: 40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sunshine',
                    style: textDescriptionStyle,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.wb_sunny,
                        color: Color.fromARGB(255, 168, 209, 161),
                      ),
                      SizedBox(width: 15),
                      Text(
                        '20-30°C',
                        style: textDescriptionStyle,
                      ),
                    ],
                  ),
                  SizedBox(height: 2),
                  Text(
                    'Humidity',
                    style: textDescriptionStyle,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.opacity,
                        color: Color.fromARGB(255, 168, 209, 161),
                      ),
                      SizedBox(width: 15),
                      Text(
                        'более 70%',
                        style: textDescriptionStyle,
                      ),
                    ],
                  ),
                  SizedBox(height: 2),
                  Text(
                    'Size',
                    style: textDescriptionStyle,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.straighten,
                        color: Color.fromARGB(255, 168, 209, 161),
                      ),
                      SizedBox(width: 15),
                      Text(
                        'до 3cm',
                        style: textDescriptionStyle,
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
