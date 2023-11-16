import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(title: 'Главная'),
      routes: {
        '/plantInfo': (context) => PlantInfoScreen(),
      },
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          elevation: 0,
        ),
        scaffoldBackgroundColor: Color.fromARGB(255, 237, 232, 232),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        flexibleSpace: appBarGradient(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/plantInfo');
              },
              child: Text('О растении'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class PlantInfoScreen extends StatelessWidget {
  final TextStyle textDescriptionStyle = GoogleFonts.inter(fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: SvgPicture.asset(
                'assets/icons/plant.svg',
                width: 35,
                height: 35,
              ),
            ),
            SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.only(top: 17),
              child: Text(
                'Информация о растении',
                style: GoogleFonts.inika(fontSize: 16, color: Colors.black),
              ),
            ),
            SizedBox(width: 40),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: SvgPicture.asset(
                'assets/icons/tree.svg',
                width: 35,
                height: 35,
              ),
            ),
          ],
        ),
        toolbarHeight: 65,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(top: 17),
          child: IconButton(
            icon: SvgPicture.asset('assets/icons/back_arrow.svg'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        flexibleSpace: appBarGradient(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/images/plant.png',
                  width: 129,
                  height: 132,
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sunshine',
                      style: textDescriptionStyle,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.wb_sunny,
                          color: Color.fromARGB(255, 168, 209, 161),
                        ),
                        SizedBox(width: 15),
                        Text(
                          '16-18°C',
                          style: textDescriptionStyle,
                        ),
                      ],
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Humidity',
                      style: textDescriptionStyle,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.opacity,
                          color: Color.fromARGB(255, 168, 209, 161),
                        ),
                        SizedBox(width: 15),
                        Text(
                          '80-85%',
                          style: textDescriptionStyle,
                        ),
                      ],
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Size',
                      style: textDescriptionStyle,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.straighten,
                          color: Color.fromARGB(255, 168, 209, 161),
                        ),
                        SizedBox(width: 15),
                        Text(
                          '60-90 cm',
                          style: textDescriptionStyle,
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class appBarGradient extends StatelessWidget {
  const appBarGradient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 168, 209, 161),
            Color.fromARGB(255, 136, 207, 123),
          ],
        ),
      ),
    );
  }
}
