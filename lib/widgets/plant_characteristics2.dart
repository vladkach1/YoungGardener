import 'package:flutter/material.dart';

import 'imageFromUrl.dart';

class PlantCharacteristics2 extends StatelessWidget {
  const PlantCharacteristics2({
    Key? key,
    required this.textDescriptionStyle,
    required this.water,
    required this.humidity,
    required this.temperature,
    required this.size,
    required this.imageUrl,
  }) : super(key: key);

  final TextStyle textDescriptionStyle;
  final int water;
  final int humidity;
  final int size;
  final int temperature;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Row(
            children: [
              imageFromUrl(imageUrl),
              SizedBox(width: 40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Температура',
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
                        temperature.toString() + " C°",
                        style: textDescriptionStyle,
                      ),
                    ],
                  ),
                  SizedBox(height: 2),
                  Text(
                    'Влажность',
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
                        humidity.toString()+" %",
                        style: textDescriptionStyle,
                      ),
                    ],
                  ),
                  SizedBox(height: 2),
                  Text(
                    "Размер",
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
                        size.toString()+" см",
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
