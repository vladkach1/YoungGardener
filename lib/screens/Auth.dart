import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:young_gardener/main-screen.dart';
import 'package:young_gardener/register.dart';


class AuthPage extends StatefulWidget {
  AuthPage({Key? key}) : super(key: key);
  static const authScreen = "/authScreen";
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _GoToReg() {
    Navigator.of(context).pushNamed(RegisterPage.regScreen);
  }
  void _GoToMain() {
    Navigator.of(context).pushNamed(MainScreen.mainScreen);
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
        padding: EdgeInsets.only(bottom: 10, right: 25),
        child: Container(
          child: Align(
            child: Text(
              'войдите, чтобы продолжить',
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



    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leadingWidth: 190,
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: TextButton(
                  onPressed: _GoToReg,
                  child: Text(
                    'Зарегистрироваться',
                    style: GoogleFonts.inder(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  )),
          actions: [Padding(
            padding: const EdgeInsets.only(right: 10,top: 10),
            child: ImageIcon(
                    AssetImage('assets/icons/tree.png'),
                    color: Colors.black,
                    size: 35,
                  ),
          ),],
        ),
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
                _logo1(),
                _form('Войти', _GoToMain),
              ],
            )));
  }
}