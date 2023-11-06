import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        buttonTheme: const ButtonThemeData(),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Имитация асинхронной инициализации, например, загрузка данных
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const MyHomePage(),
        ),
      );
    });

    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.local_florist,
              size: 64, // Размер иконки растения
              color: Colors.black, // Цвет иконки
            ),
            SizedBox(height: 16),
            Text(
              'Young Gardener',
              style: TextStyle(
                fontSize: 24, // Размер шрифта названия
                color: Colors.black, // Цвет названия
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.green,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const PlantScreen(),
    const GuidesScreen(),
    const ProfileScreen(),
  ];

  final List<String> _titles = [
    'Растения',
    'Гайды',
    'Профиль',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            _titles[_currentIndex],
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
        toolbarHeight : 100
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.local_florist),
            label: 'Растения',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Гайды',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Профиль',
          ),
        ],
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

class PlantScreen extends StatelessWidget {
  const PlantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Экран "Растения"'),
    );
  }
}

class GuidesScreen extends StatelessWidget {
  const GuidesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Экран "Гайды"'),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Экран "Профиль"'),
    );
  }
}
