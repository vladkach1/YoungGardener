import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(
        title: 'Главная',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

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
  String _namePlans(int i) {
    List<String> Plans = [' Петрушка кудрявая', ' Алоэ вера'];
    return Plans[i];
  }


  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    print('ready in 3...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 2...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 1...');
    await Future.delayed(const Duration(seconds: 1));
    print('go!');
    FlutterNativeSplash.remove();
  }

  TextEditingController _searchController = TextEditingController();

  Widget _input(Icon icon, String hint, TextEditingController controller) {
    return Container(
      height: 50,
      width: 260,
      color: const Color.fromARGB(255, 211, 211, 211),
      padding: EdgeInsets.zero,
      child: TextField(
        controller: controller,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(26),
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(26),
                bottomRight: Radius.circular(26)),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 168, 209, 161),
                  Color.fromARGB(255, 136, 207, 123)
                ]),
          ),
        ),
        toolbarHeight: 75,
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: Container(
          child: Row(
            children: [
              _input(Icon(Icons.search),'Поиск', _searchController),
              SizedBox(width: 15,),
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
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[],
            ),
          ),
          SliverList.builder(
            itemBuilder: (context, index) => Container(
              height: 53,
              margin: EdgeInsets.only(left: 35, top: 10, right: 35),
              child: ElevatedButton(
                onPressed: _incrementCounter,
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xffC7C4C4),
                  primary: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Align(
                  alignment: Alignment(-1, 0),
                  child: Text(
                    _namePlans(index),
                    style: GoogleFonts.inder(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            itemCount: 2,
          ),
        ],
      ),
    );
  }
}