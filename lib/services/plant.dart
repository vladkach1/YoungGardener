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
  // Разделяем данные о растении и описание
  final parts = line.split('|');
  final description = parts[1].trim(); // Убираем пробельные символы по краям, если они есть
  final dataParts = parts[0].split(',');
  final imgUrl = dataParts.last.split(' ')[1].trim(); // Получаем URL изображения, который всегда последний
  
  // Удаляем часть с URL изображения, чтобы она не мешала парсингу остальных данных
  dataParts.removeLast();

  Map<String, String> dataMap = {
    for (var part in dataParts)
      part.split(':')[0].trim(): part.split(':')[1].trim(),
  };

  return Plant(
    name: dataMap.keys.first,
    water: int.parse(dataMap['Воды']!),
    humidity: int.parse(dataMap['Влажность']!),
    size: int.parse(dataMap['Размер']!),
    temperature: int.parse(dataMap['Температура']!),
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
