import 'package:flutter/material.dart';

class AdditionalInformationOnWaterAndSun extends StatelessWidget {
  final int waterAmount;
  final int sunshine;
  final String humidity;
  final String size;

  const AdditionalInformationOnWaterAndSun({
    Key? key,
    required this.waterAmount,
    required this.sunshine,
    required this.humidity,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Row(
          children: [
            _InfoItemWater(
              icon: Icons.water_drop,
              title: 'Water',
              value: waterAmount,
            ),
            _InfoItemSunshine(
              icon: Icons.sunny,
              title: 'Sunshine',
              value: sunshine,
            ),
          ],
        ),
    );
  }
}

class _InfoItemWater extends StatelessWidget {
  final IconData icon;
  final String title;
  final int value;

  const _InfoItemWater({
    Key? key,
    required this.icon,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 45, vertical: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(icon),
              Icon(icon),
              Icon(icon),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
              color: const Color(0xff88CF7B),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            value.toString()+" мл",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoItemSunshine extends StatelessWidget {
  final IconData icon;
  final String title;
  final int value;

  const _InfoItemSunshine({
    Key? key,
    required this.icon,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 45, vertical: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(icon),
              Icon(icon),
              Icon(icon),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
              color: const Color(0xff88CF7B),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            value.toString()+"°С",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
