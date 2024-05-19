import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

String? id = null;

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

  void deletePlant(BuildContext context, String name) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // Получаем ссылку на коллекцию растений текущего пользователя
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('plants')
          .where('name', isEqualTo: name)
          .get();

      // Если растение найдено, удаляем его
      if (querySnapshot.docs.isNotEmpty) {
        // Ваш комментарий указывает на необходимость проверки по дате, поэтому
        // здесь вам нужно будет добавить логику фильтрации, если в коллекции есть несколько документов с одинаковым именем
        String docId = querySnapshot
            .docs.first.id; // Берем ID первого найденного документа
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .collection('plants')
            .doc(docId)
            .delete()
            .then((_) => showSnackbar(context, 'Растение удалено'))
            .catchError((error) =>
                showSnackbar(context, 'Ошибка при удалении растения: $error'));
        Navigator.pushNamed(context, '/mainScreen');
      } else {
        showSnackbar(context, 'Растение не найдено');
      }
    } else {
      // Если пользователь не аутентифицирован, показываем сообщение
      showSnackbar(
          context, 'Пожалуйста, войдите в систему для удаления растений');
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
