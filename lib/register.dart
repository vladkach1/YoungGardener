import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:young_gardener/widgets/loading.dart';
import 'services/authindication.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);
  static const regScreen = "/regScreen";

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = '';
  String password = '';
  String password1 = '';
  String error = '';

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _password2Controller = TextEditingController();

  void _GoToAuth() {
    Navigator.of(context).pushNamed('/mainScreen');
  }

// Функция для проверки введенных данных
  Future _validateAndRegister() async {
    if ((email!='') && (password.length >6) && (password == password1) && (RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(email))) {
      _register();
    }
    else if (email=='')
    {
      _showErrorDialog("Ошибка", "Введите email");
    }

    else if (!RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(email))
    {
      _showErrorDialog("Ошибка", "Некорректный email");
    }
    else if (password.length <=6)
    {
      _showErrorDialog("Ошибка", "Пароль должен содержать не менее 6 символов");
    }
    else if (password != password1)
    {
      _showErrorDialog("Ошибка", "Пароли должены совпадать");
          }
  }

// Функция для регистрации пользователя
  void _register() async {
    setState(() => loading = true);
    dynamic result = await _auth.register(email, password);
    Navigator.of(context).pushNamed('/');
    if (result == null) {
      setState(() { 
        error = 'Укажите правильно';
        loading = false;
      });
    }
  }

// Функция для отображения диалогового окна с ошибкой
  void _showErrorDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

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
                  'зарегистрируйтесь, чтобы продолжить',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
        ),
      );
    }

    return loading ? Loading() : Scaffold(
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
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(height: 50,),
                        Container(
                            height: 50,
                            width: 300,
                            padding: EdgeInsets.zero,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 211, 211, 211),
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
                            ),
                            child: TextFormField(
                              cursorColor: Colors.black,
                              cursorWidth: 1,
                              controller: _emailController,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Color.fromARGB(77, 0, 0, 0),
                                  fontFamily: 'Inder',
                                ),
                                border: InputBorder.none,
                                hintText: "Введите почту",
                                prefixIcon: Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: IconTheme(
                                    data:
                                    IconThemeData(color: const Color.fromARGB(255, 53, 53, 53)),
                                    child: Icon(Icons.email),
                                  ),
                                ),
                              ),
                              onChanged: (val) {
                                setState(() => email = val);
                              },
                            )
                        ),
                        SizedBox(height: 20,),
                        Container(
                          height: 50,
                          width: 300,
                          padding: EdgeInsets.zero,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 211, 211, 211),
                            borderRadius: BorderRadius.all(
                              Radius.circular(25),
                            ),
                          ),
                          child: TextFormField(
                            cursorColor: Colors.black,
                            cursorWidth: 1,
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Color.fromARGB(77, 0, 0, 0),
                                fontFamily: 'Inder',
                              ),
                              border: InputBorder.none,
                              hintText: "Введите пароль",
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                child: IconTheme(
                                  data:
                                  IconThemeData(color: const Color.fromARGB(255, 53, 53, 53)),
                                  child: Icon(Icons.lock),
                                ),
                              ),
                            ),
                            onChanged: (val) {
                              setState(() => password = val);
                            },
                          ),
                        ),


                        SizedBox(height: 20,),
                        Container(
                          height: 50,
                          width: 300,
                          padding: EdgeInsets.zero,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 211, 211, 211),
                            borderRadius: BorderRadius.all(
                              Radius.circular(25),
                            ),
                          ),
                          child: TextFormField(
                            cursorColor: Colors.black,
                            cursorWidth: 1,
                            controller: _password2Controller,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Color.fromARGB(77, 0, 0, 0),
                                fontFamily: 'Inder',
                              ),
                              border: InputBorder.none,
                              hintText: "Повторите пароль",
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                child: IconTheme(
                                  data:
                                  IconThemeData(color: const Color.fromARGB(255, 53, 53, 53)),
                                  child: Icon(Icons.lock),
                                ),
                              ),
                            ),
                            onChanged: (val) {
                              setState(() => password1 = val);
                            },
                          ),
                        ),

                        SizedBox(height: 20,),
                        ElevatedButton(
                          child: Text(
                            'Зарегистрировать',
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          onPressed: _validateAndRegister,
                        )
                      ],
                    )),
                SizedBox(height: 10),
                GestureDetector(
// Создание текстовой ссылки для перехода на экран аутентификации
                  onTap: () {
                    Navigator.of(context).pushNamed('/Auth');
                  },
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "У вас уже есть аккаунт?",
                        style: TextStyle(
                          color: Colors.black, // Цвет ссылки
                        ),
                      ),
                      Text(
                        "Войти",
                        style: TextStyle(
                          color: Colors.blue, // Цвет ссылки
                          decoration:
                          TextDecoration.underline, // Подчеркивание текста
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }
}