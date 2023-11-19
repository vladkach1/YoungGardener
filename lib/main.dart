import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

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
        useMaterial3: true,
        appBarTheme: AppBarTheme(
            elevation: 0,
            color: Color(0xff8BD07F),
            titleTextStyle: GoogleFonts.inter(
              fontWeight: FontWeight.normal,
              fontSize: 16,
              color: Colors.black,
            ),
            foregroundColor: Colors.black),
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
              style: Theme.of(context).textTheme.headlineMedium,
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

class PlantInfoScreen extends StatefulWidget {
  @override
  _PlantInfoScreenState createState() => _PlantInfoScreenState();
}

class _PlantInfoScreenState extends State<PlantInfoScreen> {
  final TextStyle textCharacteristicsStyle =
      GoogleFonts.inter(fontWeight: FontWeight.bold);
  final TextStyle textDescriptionStyle =
      GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 12);

  bool light0 = true;
  bool light1 = true;

  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.check);
      }
      return const Icon(Icons.close);
    },
  );

  void doNothing() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(26),
          ),
        ),
        toolbarHeight: 75,
        centerTitle: true,
        title: Container(
          child: Row(
            children: [
              SvgPicture.asset('assets/icons/plant.svg'),
              SizedBox(width: 25),
              Padding(
                padding: const EdgeInsets.only(bottom: 9),
                child: Text('Петрушка кудрявая'),
              ),
              SizedBox(width: 65),
              SvgPicture.asset('assets/icons/tree.svg')
            ],
          ),
          margin: EdgeInsets.only(top: 20),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: IconButton(
            icon: SvgPicture.asset('assets/icons/back_arrow.svg'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 19.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: 40,
              ),
            ),
            PlantCharacteristics(
                textDescriptionStyle: textCharacteristicsStyle),
            SliverToBoxAdapter(
              child: SizedBox(height: 40),
            ),
            PlantDescription(textDescriptionStyle: textDescriptionStyle),
            SliverToBoxAdapter(
              child: SizedBox(height: 40),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/notification.svg'),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Напоминания',
                        style: GoogleFonts.inter(fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //Напоминание 1
                  Slidable(
                    endActionPane: ActionPane(
                      extentRatio: 0.6,
                      closeThreshold: 0.9,
                      motion: BehindMotion(),
                      children: [
                        Container(
                          child: SvgPicture.asset('assets/icons/checkmark.svg'),
                          padding: EdgeInsets.only(
                              top: 20, bottom: 20, left: 100, right: 10),
                          decoration: BoxDecoration(
                            color: Color(0xff54AD45),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          margin: EdgeInsets.only(right: 20),
                          decoration: BoxDecoration(
                            color: Color(0xffC7C4C4),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  SvgPicture.asset('assets/icons/plant2.svg'),
                                ],
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Петрушка кудрявая',
                                    style: GoogleFonts.inika(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Растение нужно полить (150мл)',
                                    style: GoogleFonts.inter(fontSize: 10),
                                  )
                                ],
                              ),
                              SizedBox(width: 53),
                            ],
                          ),
                        ),
                        // Switch(
                        //   thumbIcon: thumbIcon,
                        //   value: light1,
                        //   onChanged: (bool value) {
                        //     setState(() {
                        //       light1 = value;
                        //     });
                        //   },
                        // ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //Напоминание 2
                  Row(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        margin: EdgeInsets.only(right: 20),
                        decoration: BoxDecoration(
                          color: Color(0xffC7C4C4),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                SvgPicture.asset('assets/icons/plant2.svg'),
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Петрушка кудрявая',
                                  style: GoogleFonts.inika(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Растение нуждается в удобрении (10мл)',
                                  style: GoogleFonts.inter(fontSize: 10),
                                )
                              ],
                            ),
                            SizedBox(width: 10),
                          ],
                        ),
                      ),
                      Switch(
                        thumbIcon: thumbIcon,
                        value: light1,
                        onChanged: (bool value) {
                          setState(() {
                            light1 = value;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            AdditionalInformationOnWaterAndSun(),
            BottomButtons(),
            SliverToBoxAdapter(
              child: SizedBox(height: 45),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomButtons extends StatelessWidget {
  const BottomButtons({
    super.key,
  });

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
                    Color(0xff4F8247)), // Цвет фона кнопки
              ),
              onPressed: () {
                // Действия для первой кнопки
              },
              child: Text(
                'Уже есть',
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Color(0xffFA7171)), // Цвет фона кнопки
              ),
              onPressed: () {
                // Действия для первой кнопки
              },
              child: Text(
                'Удалить',
                style: GoogleFonts.inter(
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

class AdditionalInformationOnWaterAndSun extends StatelessWidget {
  const AdditionalInformationOnWaterAndSun({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Row(children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 35, vertical: 16),
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.water_drop),
                    Icon(Icons.water_drop),
                    Icon(Icons.water_drop)
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  'Water',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Color(0xff88CF7B)),
                ),
                SizedBox(height: 5),
                Text(
                  '150 мл',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 35, vertical: 16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.sunny),
                    Icon(Icons.sunny),
                    Icon(Icons.sunny)
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  'Sunshine',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Color(0xff88CF7B)),
                ),
                SizedBox(height: 5),
                Text(
                  '20-30°C',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}

class PlantDescription extends StatelessWidget {
  const PlantDescription({
    super.key,
    required this.textDescriptionStyle,
  });

  final TextStyle textDescriptionStyle;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Text(
      'Петру́шка кудря́вая, или Петрушка курчавая, (лат. Petroselinum crispum), — одно-двухлетнее растение из семейства зонтичных (Umbelliferae). Корень  стержневой, цилиндрический. Листья темно-зеленые, сверху блестящие. Лист петрушки, в сушёном и свежем виде, — популярная кулинарная приправа.\n\n\n\n\n',
      style: textDescriptionStyle,
    ));
  }
}

class PlantCharacteristics extends StatelessWidget {
  const PlantCharacteristics({
    super.key,
    required this.textDescriptionStyle,
  });

  final TextStyle textDescriptionStyle;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(children: [
        Row(
          children: [
            Image.asset(
              'assets/images/plant.png',
              width: 129,
              height: 132,
            ),
            SizedBox(width: 40),
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
      ]),
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
