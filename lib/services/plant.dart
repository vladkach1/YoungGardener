import 'package:flutter/services.dart' show rootBundle;

class Plant {
  final String name;
  final int water;
  final int humidity;
  final int size;
  final int temperature;
  final String imgUrl;
  final String description;

  Plant({
    required this.name,
    required this.water,
    required this.humidity,
    required this.size,
    required this.temperature,
    required this.imgUrl,
    required this.description,
  });

  factory Plant.fromTxtData(String line) {
  final parts = line.split('|');
  final description = parts[1].trim();
  final dataParts = parts[0].split(',');
  final imgUrl = dataParts.last.split(' ')[1].trim();
  dataParts.removeLast();

  Map<String, String> dataMap = {
    for (var part in dataParts)
      part.split(RegExp(r'\s'))[0].trim(): part.split(RegExp(r'\s'))[1].trim(),
  };

  // Добавляем проверку на null и устанавливаем значение по умолчанию, если данные отсутствуют
  int water = dataMap.containsKey('Воды') && dataMap['Воды'] != null ? int.parse(dataMap['Воды']!) : 0;
  int humidity = dataMap.containsKey('Влажность') && dataMap['Влажность'] != null ? int.parse(dataMap['Влажность']!) : 0;
  int size = dataMap.containsKey('Размер') && dataMap['Размер'] != null ? int.parse(dataMap['Размер']!) : 0;
  int temperature = dataMap.containsKey('Температура') && dataMap['Температура'] != null ? int.parse(dataMap['Температура']!) : 0;

  return Plant(
    name: dataMap.keys.first,
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
        print("не пустая");
      }
    }
  } catch (e) {
    print('Ошибка: $e');
  }

  return plants;
}
