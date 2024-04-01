import 'dart:io';

///тоже можно доделать подумать завтра (кирилл)
class Plant {
  final String name;
  final int water;
  final int humidity;
  final int size;
  final int temperature;

  Plant({
    required this.name,
    required this.water,
    required this.humidity,
    required this.size,
    required this.temperature,
  });

  factory Plant.fromTxtData(Map<String, dynamic> txtData) {
    return Plant(
      name: txtData['name'],
      water: int.parse(txtData['Воды'].split(' ')[1]),
      humidity: int.parse(txtData['Влажность'].split(' ')[1]),
      size: int.parse(txtData['Размер'].split(' ')[1]),
      temperature: int.parse(txtData['Температура'].split(' ')[1]),
    );
  }
}

Future<List<Plant>> loadPlantsFromFile(String filePath) async {
  List<Plant> plants = [];

  try {
    File file = File(filePath);
    List<String> lines = await file.readAsLines();

    lines.forEach((line) {
      List<String> parts = line.split(',');
      if (parts.length == 4) {
        Map<String, dynamic> plantData = {
          'name': parts[0].split(':')[0].trim(),
          'Воды': parts[0].split(':')[1],
          'Влажность': parts[1],
          'Размер': parts[2],
          'Температура': parts[3],
        };
        Plant plant = Plant.fromTxtData(plantData);
        plants.add(plant);
      }
    });
  } catch (e) {
    print('Ошибка: $e');
  }

  return plants;
}
