import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

String? id=null;

class BottomButtons extends StatelessWidget {
  final String plantName;

  const BottomButtons({
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
                Color.fromARGB(255, 255, 52, 65), // Цвет фона кнопки
              ),
            ),
            onPressed: () => deletePlant(context, plantName),
            child: Text(
              'Удалить',
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

//НИХУЯ НЕ РАБОТАЕТ НУ Я ПЫТАЛСЯ МБ ТПАЯ ОШИБКА НЕ МОГУ ДУМАТЬ
  void deletePlant(BuildContext context, String name,) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      print('говно');
      // Получаем ссылку на коллекцию растений текущего пользователя
       FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('plants').get().then((querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          print(doc.data()['name']);
          print('1');
          print(name);
          print('2');
          if (doc.data()['name']==name) //ДОБАВИТЬ ПРОВЕРКУ ПО ДАТЕ ДОБАВЛЕНИЯ
            {
              id=doc.id;
            }
        });
      });
      print(id);
       // удаление
       await FirebaseFirestore.instance
           .collection('users')
           .doc(user.uid)
           .collection('plants').doc(id).delete();
      print('говно12');

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
