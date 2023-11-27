import 'package:flutter/material.dart';

class AdditionalInformationOnWaterAndSun extends StatelessWidget {
  const AdditionalInformationOnWaterAndSun({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 35, vertical: 16),
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Icon(Icons.water_drop),
                      Icon(Icons.water_drop),
                      Icon(Icons.water_drop),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Water',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: const Color(0xff88CF7B),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '150 мл',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 35, vertical: 16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Icon(Icons.sunny),
                      Icon(Icons.sunny),
                      Icon(Icons.sunny),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Sunshine',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: const Color(0xff88CF7B),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '20-30°C',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
