import 'package:flutter/material.dart';

class BottomButtons2 extends StatelessWidget {
  const BottomButtons2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Color.fromARGB(255, 41, 161, 241), // Цвет фона кнопки
                ),
              ),
              onPressed: () {
                // Действия для первой кнопки
              },
              child: Text(
                'Добавить',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Color.fromARGB(255, 133, 133, 133), // Цвет фона кнопки
                ),
              ),
              onPressed: () {
                // Действия для второй кнопки
              },
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
      ),
    );
  }
}
