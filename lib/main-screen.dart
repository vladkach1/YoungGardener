import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


class MainScreen extends StatefulWidget {
  static const mainScreen = "/mainScreen";
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  void _GoToAuth() {
    Navigator.of(context).pushNamed('/');
  }

  void _GoToInfo() {
    Navigator.of(context).pushNamed('/Info');
  }

  void _GoToSearch() {
    Navigator.of(context).pushNamed('/Search');
  }

  void _AddPlant() {
    Navigator.of(context).pushNamed('/Search');
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
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 33),
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
                                  fontSize: 12, fontWeight: FontWeight.bold),
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
    );
  }

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

  bool isIconButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(25),
            ),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 168, 209, 161),
                  Color.fromARGB(255, 136, 207, 123)
                ]),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(26),
          ),
        ),
        toolbarHeight: 75,
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(120.0),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Здравствуйте,\nUserName!',
                  style: GoogleFonts.inder(
                    fontSize: 27,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _AddPlant,
        backgroundColor: Colors.green,
        child: Icon(
          Icons.add,
          size: 30,
          color: Colors.black,
        ),
      ),
      backgroundColor: Color.fromARGB(255, 236, 233, 233),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              height: 53,
              margin: EdgeInsets.only(left: 75, top: 10, right: 75),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.drag_handle_rounded,
                    color: Colors.black,
                  ),
                  Text(
                    'Ваши растения',
                    style: GoogleFonts.inika(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 25),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Divider(
                color: Colors.grey,
                thickness: 0.6,
                height: 0.8,
              ),
            ),
          ),
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
                child: Align(
                  alignment: Alignment(-1, 0),
                  child: Text(
                    (index + 1).toString() + ' ' + _namePlans(index),
                    style: GoogleFonts.inder(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
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
