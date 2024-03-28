import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:young_gardener/services/authindication.dart';

class AuthPage extends StatefulWidget {
  AuthPage({Key? key}) : super(key: key);
  static const authScreen = "/authScreen";
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  final AuthService _auth = AuthService();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _GoToReg() {
    Navigator.of(context).pushNamed('/Register');
  }

  void _GoToMain() {
    Navigator.of(context).pushNamed('/mainScreen');
  }

  @override
  Widget build(BuildContext context) {
    Widget _buttom(String text, void func()) {
      return ElevatedButton(
        child: Text(
          text,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        onPressed: () async {
          dynamic result = await _auth.sing();
          //func();
        },
      );
    }

    Widget _input(Icon icon, String hint, TextEditingController controller,
        bool obsecure) {
      return Container(
        height: 50,
        width: 300,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 211, 211, 211),
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        child: TextField(
          cursorColor: Colors.black,
          cursorWidth: 1,
          controller: controller,
          obscureText: obsecure,
          decoration: InputDecoration(
            hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Color.fromARGB(77, 0, 0, 0),
              fontFamily: 'Inder',
            ),
            border: InputBorder.none,
            hintText: hint,
            prefixIcon: Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: IconTheme(
                data:
                    IconThemeData(color: const Color.fromARGB(255, 53, 53, 53)),
                child: icon,
              ),
            ),
          ),
        ),
      );
    }

    Widget _form(String label, void func()) {
  return Container(
    child: Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(bottom: 25, top: 50),
          child: _input(
              Icon(Icons.email),
              "Введите имя пользователя",
              _emailController,
              false),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 25),
          child: _input(
              Icon(Icons.lock),
              "Введите пароль",
              _passwordController,
              true),
        ),
        SizedBox(height: 30),
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Container(
            height: 40,
            width: 300,
            child: _buttom(label, func),
          ),
        ),
        SizedBox(height: 10),
        GestureDetector( // Создание текстовой ссылки для перехода на экран регистрации
          onTap: () {
            Navigator.of(context).pushNamed('/Register');
          },
          child: Column(
            children: [
              SizedBox(height: 10,),
              Text(
                "У вас нет аккаунта?",
                style: TextStyle(
                  color: Colors.black, // Цвет ссылки
                ),
              ),
              Text(
                "Зарегистрироваться",
                style: TextStyle(
                  color: Colors.blue, // Цвет ссылки
                  decoration: TextDecoration.underline, // Подчеркивание текста
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}


    ;
    Widget _logo() {
      return Padding(
        padding: EdgeInsets.only(top: 50),
        child: Container(
          child: Center(
            child: Column(
              children: [
                Text(
                  'Добро пожаловать',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  'войдите, чтобы продолжить',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            leadingWidth: 190,
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: SizedBox(width: 20,),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10, top: 3),
                child: SvgPicture.asset('assets/icons/tree.svg'),
              )
            ]),
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                  Color.fromARGB(255, 168, 209, 161),
                  Color.fromARGB(255, 136, 207, 123)
                ])),
            child: Column(
              children: <Widget>[
                SizedBox(height: 90),
                _logo(),
                _form('Войти', _GoToMain),

              ],
            )));
  }
}
