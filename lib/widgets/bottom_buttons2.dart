import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BottomButtons2 extends StatelessWidget {
  final String plantName;

  const BottomButtons2({
    Key? key,
    required this.plantName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                Color.fromARGB(255, 41, 161, 241), // Цвет фона кнопки
              ),
            ),
            onPressed: () => addPlant(context, plantName),
            child: Text(
              'Добавить',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void addPlant(BuildContext context, String name) async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Получаем ссылку на коллекцию растений текущего пользователя
      CollectionReference userPlants = FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('plants');

      // Добавляем новое растение в коллекцию растений пользователя
      await userPlants
          .add({
            'name': name,
            'timestamp':
                FieldValue.serverTimestamp(), // Добавляем временную метку
          })
          .then((value) => showSnackbar(context, 'Растение добавлено'))
          .catchError((error) {
            // Обрабатываем ошибку
            print('Failed to add plant: $error');
            showSnackbar(context, 'Ошибка при добавлении растения');
          });
    } else {
      // Если пользователь не аутентифицирован, показываем сообщение
      showSnackbar(
          context, 'Пожалуйста, войдите в систему для добавления растений');
    }
  }

  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 3),
      ),
    );
  }
}
