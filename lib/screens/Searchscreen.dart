import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:young_gardener/screens/plant_info_screen2.dart';
import 'package:young_gardener/services/plant.dart';

class SearchScreen extends StatefulWidget {
  static const searchScreen = "/searchScreen";

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

List<Plant> ListPlants = [];
List<Plant> allPlants = [];

///Доделать мб посмотри крч хз (Кирилл)
class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    super.initState();
    initialization();
    allPlants.clear();
    allPlants.addAll(ListPlants);
  }

  void initialization() async {
    FlutterNativeSplash.remove();
  }

  TextEditingController _searchController = TextEditingController();

  void filterSearchResults(String query) {
    if (query.isNotEmpty) {
      List<Plant> dummyListData = [];
      allPlants.forEach((item) {
        if (item.name.toLowerCase().contains(query.toLowerCase())) {
          dummyListData.add(item);
        }
      });
      setState(() {
        ListPlants.clear();
        ListPlants.addAll(dummyListData);
      });
    } else {
      setState(() {
        ListPlants.clear();
        ListPlants.addAll(allPlants); // Восстанавливаем все растения
      });
    }
  }

  Widget _input(Icon icon, String hint, TextEditingController controller) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 50,
      width: screenWidth * 0.65,
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
        onChanged: filterSearchResults,
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
              data: IconThemeData(color: const Color.fromARGB(255, 53, 53, 53)),
              child: icon,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(allPlants.length);
    print(ListPlants.length);
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: screenWidth * 0.15,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10, top: 3),
            child: SvgPicture.asset('assets/icons/tree.svg'),
          )
        ],
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
              if (ListPlants.length !=200) {
                GetListOfPlants();
              }
              Navigator.of(context).pushNamed('/');
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
                onPressed: () {
    if (ListPlants.length !=200) {
    GetListOfPlants();
    };
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlantInfoScreen2(
                        name: ListPlants[index].name,
                        water: ListPlants[index].water,
                        humidity: ListPlants[index].humidity,
                        description: ListPlants[index].description,
                        size: ListPlants[index].size,
                        temperature: ListPlants[index].temperature,
                        imgUrl: ListPlants[index].imgUrl,
                      ),
                    ),
                  );
                },
                child: Align(
                  alignment: Alignment(-1, 0),
                  child: Text(
                    ListPlants[index].name,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
            ),
            itemCount: ListPlants.length,
          ),
        ],
      ),
    );
  }
}
