import 'package:flutter/material.dart';

import 'imageFromUrl.dart';

class PlantCharacteristics extends StatelessWidget {
  const PlantCharacteristics({
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
              imageFromUrl("https://mykaleidoscope.ru/x/uploads/posts/2022-09/1663607184_36-mykaleidoscope-ru-p-petrushka-na-ogorode-instagram-41.jpg"),
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
                        '16-18°C',
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
                        '80-85%',
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
                        '60-90 cm',
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
