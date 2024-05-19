import 'package:flutter/services.dart';

class Plant {
  final String name;
  final int water;
  final int humidity;
  final int size;
  final int temperature;
  final String imgUrl;
  final String description;
  String? documentId;

  Plant({
    required this.name,
    required this.water,
    required this.humidity,
    required this.size,
    required this.temperature,
    required this.imgUrl,
    required this.description,
    this.documentId,
  });

  factory Plant.fromTxtData(String line) {
    final parts = line.split('|');
    final description = parts[1].trim();
    final dataParts = parts[0].split('q,');
    final namePart = dataParts.first.trim();
    final restParts = dataParts[1].split(',');
    final imgUrl = restParts.last.split(' ')[1].trim();
    restParts.removeLast();

    Map<String, String> dataMap = {
      for (var part in restParts)
        part.split(' ')[0].trim(): part.split(' ')[1].trim(),
    };

    int water = dataMap.containsKey('Воды') && dataMap['Воды'] != null ? int.parse(dataMap['Воды']!) : 0;
    int humidity = dataMap.containsKey('Влажность') && dataMap['Влажность'] != null ? int.parse(dataMap['Влажность']!) : 0;
    int size = dataMap.containsKey('Размер') && dataMap['Размер'] != null ? int.parse(dataMap['Размер']!) : 0;
    int temperature = dataMap.containsKey('Температура') && dataMap['Температура'] != null ? int.parse(dataMap['Температура']!) : 0;

    return Plant(
      name: namePart,
      water: water,
      humidity: humidity,
      size: size,
      temperature: temperature,
      imgUrl: imgUrl,
      description: description,
    );
  }
}

Future<List<Plant>> loadPlantsFromFile(String filePath) async {
  List<Plant> plants = [];

  try {
    final fileData = await rootBundle.loadString(filePath);
    List<String> lines = fileData.split("\n");
    for (var line in lines) {
      if (line.isNotEmpty) { // Проверяем, не пустая ли строка
        plants.add(Plant.fromTxtData(line));
      }
    }
  } catch (e) {
    print('Ошибка: $e');
  }

  return plants;
}