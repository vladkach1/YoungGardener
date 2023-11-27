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


class MainScreen extends StatefulWidget {
  @override
  static const mainScreen = "/mainScreen";
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _counter = 0;

  void _GoToInfo() {
    Navigator.of(context).pushNamed(PlantInfoScreen.infoScreen);
  }
  void _GoToSearch() {
    Navigator.of(context).pushNamed(SearchScreen.searchScreen);
  }

  String _namePlans(int i) {
    List<String> Plans = [' Петрушка кудрявая', ' Алоэ вера'];
    return Plans[i];
  }

  Widget _remindList() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 35),
        child: Column(
          children: [
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
                        top: 20, bottom: 20, left: 9, right: 10),
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
                    EdgeInsets.symmetric(vertical: 5, horizontal: 33),
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
          ],
        ),
      ),
    );}

  Widget _remind() {
    return SliverList.builder(
      itemBuilder: (context, index) => Container(
        height: 60,
        margin: EdgeInsets.only(left: 35, top: 10, right: 20),
        child: Row(
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
      ),
      itemCount: 1,
    );
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 168, 209, 161),
                  Color.fromARGB(255, 136, 207, 123)
                ]),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10, top: 20),
            child: IconButton(
              color: Colors.black,
              onPressed: _GoToSearch,
              icon: Icon(Icons.add),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 140, right: 10),
            child: ImageIcon(
              AssetImage('assets/icons/tree.png'),
              color: Colors.black,
              size: 35,
            ),
          ),
        ],
        toolbarHeight: 200,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Ваши растения',
                style: GoogleFonts.inder(
                  fontSize: 22,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Здравтсвуйте,\nUserName!',
                style: GoogleFonts.inika(
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
              Text(
                'Взгляните на Ваши растения',
                style: GoogleFonts.inder(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
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
                onPressed: _GoToInfo,
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
                    (index + 1).toString() + ' ' + _namePlans(index),
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
          _remind(),
          _remindList(),
        ],
      ),
      //padding: EdgeInsets.all(50),
    );
  }
}