import 'package:flutter/services.dart' show rootBundle;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:young_gardener/screens/Searchscreen.dart';
import 'package:young_gardener/screens/plant_info_screen.dart';
import 'package:young_gardener/screens/plant_info_screen2.dart';
import 'package:young_gardener/services/plant.dart';
import 'services/authindication.dart';
import 'package:cloud_firestore/cloud_firestore.dart';




class MainScreen extends StatefulWidget {
  static const mainScreen = "/mainScreen";

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final AuthService _auth = AuthService();
  List<Plant> _userPlants = [];
  String? username;

  @override
  void initState() {
    super.initState();
    //fetchAndDisplayUserPlants();
    //getCurrentUsername();
  }

  void getCurrentUsername() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      FirebaseFirestore.instance.collection('userCollection').doc(user.uid).get().then((DocumentSnapshot document) async {
        print(document['username'].toString());
        String? username = document['username'].toString();
        print(username);
      });

      //setState(() {
      //  username = user.displayName;
      //});
    }
  }

  // Создаем метод для загрузки данных о растениях из файла
  Future<Map<String, Plant>> loadPlantsData() async {
    String fileData = await rootBundle.loadString('assets/plants.txt');
    List<String> lines = fileData.split("\n");
    Map<String, Plant> plantsData = {};

    for (var line in lines) {
      if (line.isNotEmpty) {
        Plant plant = Plant.fromTxtData(line);
        plantsData[plant.name] = plant;
      }
    }

    return plantsData;
  }

  // Создаем метод для получения имен растений из Firestore и их дальнейшего использования
  void fetchAndDisplayUserPlants() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Получаем имена растений пользователя из Firestore
      FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('plants')
          .get()
          .then((QuerySnapshot querySnapshot) async {
            // Загружаем данные о растениях из файла
            Map<String, Plant> plantsData = await loadPlantsData();

            List<Plant> userPlants = [];

            for (var doc in querySnapshot.docs) {
              var data = doc.data() as Map<String, dynamic>;
              String plantName = data['name'];

              // Используем имя растения для получения полной информации о растении из файла
              if (plantsData.containsKey(plantName)) {
                userPlants.add(plantsData[plantName]!);
              }
            }

            // Обновляем UI
            setState(() {
              _userPlants = userPlants;
            });
          })
          .catchError((error) {
            print("Error fetching user plants: $error");
          });
    }
  }

  List<Plant> getUserPlants() {
    return _userPlants;
  }

  void addUserPlant(Plant newPlant) {
    _userPlants.add(newPlant);
  }

  void deleteUserPlant(int index) {
    _userPlants.removeAt(index);
  }

  void _GoToInfo() {
    Navigator.of(context).pushNamed('/Info');
  }


  void GetListOfPlants() async {
    try {
      List<Plant> plants = await loadPlantsFromFile('assets/plants.txt');
      plants.forEach((plant) {
        ListPlants.add(plant);
        print(plant.name);
      });
    } catch (e) {
      print(e.toString());
    }
  }

  void _AddPlant() async {
    if (ListPlants.length == 0) {
      GetListOfPlants();
    }
    Navigator.of(context).pushNamed('/Search');
  }

  String _namePlans(int i) {
    List<String> Plans = [' Петрушка кудрявая', ' Алоэ вера'];
    return Plans[i];
  }

  List<String> remindList = ['Напоминание'];
  Widget _remindList() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 35),
        child: Column(
          children: remindList.isEmpty
              ? [
                  // Если список пуст, выводим сообщение
                  Container(
                    ///margin: EdgeInsets.only(left: 10, top: 10),
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                    decoration: BoxDecoration(
                      color: Color(0xffC7C4C4),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Text(
                      'У вас нет действующих напоминаний',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ]
              : List.generate(remindList.length, (index) {
                  return Slidable(
                    startActionPane: ActionPane(
                      extentRatio: 0.15,
                      closeThreshold: 0.9,
                      motion: BehindMotion(),
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Удаление напоминания из списка при нажатии зеленой кнопки
                            setState(() {
                              remindList.removeAt(index);
                            });
                          },
                          child: Container(
                            child:
                                SvgPicture.asset('assets/icons/checkmark.svg'),
                            padding: EdgeInsets.only(
                              top: 20,
                              bottom: 20,
                              left: 9,
                              right: 10,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xff54AD45),
                              borderRadius: BorderRadius.circular(12),
                            ),
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
                                    height: 20,
                                  ),
                                  SvgPicture.asset('assets/icons/plant2.svg'),
                                ],
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Петрушка кудрявая',
                                    style: GoogleFonts.inika(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Растение нужно полить (150мл)',
                                    style: GoogleFonts.inter(fontSize: 10),
                                  ),
                                ],
                              ),
                             SizedBox(
                                child: Row(children: [Container(margin: EdgeInsets.only(left: MediaQuery.of(context).size.width/ 100, top: 10, right: MediaQuery.of(context).size.width/ 100),)],),
                              ),
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
                  );
                }),
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
    getCurrentUsername();
    fetchAndDisplayUserPlants();
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
                  'Здравствуйте,\n${username ?? "Гость"}!',
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
            onPressed: () async {
              //Navigator.pop(context);
              await _auth.signOut();
            },
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _AddPlant,
        backgroundColor: Color.fromARGB(255, 168, 209, 161),
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
              height: MediaQuery.of(context).size.height/ 15,
              margin: EdgeInsets.only(left: MediaQuery.of(context).size.width/ 14, top: 10, right: MediaQuery.of(context).size.width/ 15),
              child: ElevatedButton(
                onPressed: () => {
                  Navigator.pushReplacement(
                    context,
                      MaterialPageRoute(
    builder: (context) => PlantInfoScreen(
    name: _userPlants[index].name,
    water: _userPlants[index].water,
    humidity: _userPlants[index].humidity,
    description: _userPlants[index].description,
    size: _userPlants[index].size,
    temperature: _userPlants[index].temperature,
    imgUrl: _userPlants[index].imgUrl,
    ),
    ),
    ),
    },
                child: Align(
                  alignment: Alignment(-1, 0),
                  child: Text(
                    (index + 1).toString() + ' ' + _userPlants[index].name,
                    style: GoogleFonts.inder(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            itemCount: _userPlants.length,
          ),
          _remind(),
          _remindList(),
        ],
      ),
      //padding: EdgeInsets.all(50),
    );
  }
}