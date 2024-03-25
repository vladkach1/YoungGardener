import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchScreen extends StatefulWidget {
  static const searchScreen = "/searchScreen";

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String _namePlans(int i) {
    List<String> Plans = [' Петрушка кудрявая', ' Монстера деликатесная'];
    return Plans[i];
  }

   void _GoToInfo() {
     Navigator.of(context).pushNamed('/Info');
 }

  void _GoToAddNewPlant(){
    Navigator.of(context).pushNamed('/Info2');
  }



  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    FlutterNativeSplash.remove();
  }

  TextEditingController _searchController = TextEditingController();

  Widget _input(Icon icon, String hint, TextEditingController controller) {
    return Container(
      height: 50,
      width: 286,
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 30,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10,top: 3),
              child: SvgPicture.asset('assets/icons/tree.svg'),
            )],
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
        toolbarHeight: 75,
        centerTitle: true,
        
        title: Row(
          children: [
            _input(Icon(Icons.search), 'Поиск', _searchController),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 7),
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 236, 233, 233),
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
                onPressed: _GoToAddNewPlant,
                child: Align(
                  alignment: Alignment(-1, 0),
                  child: Text(
                    _namePlans(index),
                    style: Theme.of(context).textTheme.bodyMedium,
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
