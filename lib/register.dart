import 'package:flutter/material.dart';
import 'package:young_gardener/screens/plant_info_screen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:young_gardener/main-screen.dart';
import 'package:flutter/material.dart';
import 'package:young_gardener/screens/Auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:young_gardener/screens/Searchscreen.dart';
import 'package:young_gardener/register.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);
  static const regScreen = "/regScreen";
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _password2Controller = TextEditingController();
  void _GoToAuth() {
    Navigator.of(context).pushNamed(AuthPage.authScreen);
  }
  @override
  Widget build(BuildContext context) {
    Widget _buttom(String text, void func()) {
      return ElevatedButton(
        style: ButtonStyle(
          overlayColor:
              MaterialStateProperty.all(Color.fromARGB(255, 248, 248, 248)),
          backgroundColor: MaterialStateProperty.all(
              const Color.fromARGB(255, 211, 211, 211)),
        ),
        child: Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 18,
              fontFamily: 'inder'),
        ),
        onPressed: () {
          func();
        },
      );
    }

    Widget _input(Icon icon, String hint, TextEditingController controller,
        bool obsecure) {
      return Container(
        height: 50,
        width: 300,
        color: const Color.fromARGB(255, 211, 211, 211),
        padding: EdgeInsets.zero,
        child: TextField(
          controller: controller,
          obscureText: obsecure,
          style: TextStyle(fontSize: 20, color: Colors.black),
          decoration: InputDecoration(
            hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Color.fromARGB(77, 0, 0, 0),
              fontFamily: 'Inder',
            ),
            hintText: hint,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: const Color.fromARGB(255, 53, 53, 53), width: 3),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: const Color.fromARGB(255, 53, 53, 53), width: 1),
            ),
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
                child: _input(Icon(Icons.email), "Введите имя пользователя",
                    _emailController, false)),
            Padding(
                padding: EdgeInsets.only(bottom: 25),
                child: _input(Icon(Icons.lock), "Введите пароль",
                    _passwordController, true)),
            Padding(
                padding: EdgeInsets.only(bottom: 25),
                child: _input(Icon(Icons.lock), "Повторите пароль",
                    _password2Controller, true)),
            SizedBox(
              height: 30,
            ),
            Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  height: 40,
                  width: 300,
                  child: _buttom(label, func),
                ))
          ],
        ),
      );
    }

    ;

    _logo1() {
      return Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Container(
          child: Align(
            child: Text(
              'зарегистрируйтесь, чтобы продолжить',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Colors.black,
                fontFamily: 'Inder',
              ),
            ),
          ),
        ),
      );
    }

    Widget _logo() {
      return Padding(
        padding: EdgeInsets.only(top: 50),
        child: Container(
          child: Align(
            child: Text(
              'Добро пожаловать',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w400,
                color: Colors.black,
                fontFamily: 'Inder',
              ),
            ),
          ),
        ),
      );
    }

    String _email;
    String _password;
    String _password2;

    void _buttonAction() {
      _email = _emailController.text;
      _password = _passwordController.text;
      _password2 = _password2Controller.text;

      _emailController.clear();
      _passwordController.clear();
      _password2Controller.clear();
    }

    return Scaffold(
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
                Align(
                  alignment: Alignment.topRight,
                  child: Image(
                    width: 50,
                    height: 50,
                    image: AssetImage('assets/tree-2-svgrepo-com_1 (3).png'),
                  ),
                ),
                SizedBox(height: 90),
                _logo(),
                _logo1(),
                _form('Зарегистрировать', _GoToAuth),
              ],
            )));
  }
}
