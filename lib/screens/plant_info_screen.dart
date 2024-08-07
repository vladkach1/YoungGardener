import 'package:flutter/material.dart';
import 'package:young_gardener/widgets/plant_characteristics.dart';
import 'package:young_gardener/widgets/plant_description.dart';
import 'package:young_gardener/widgets/bottom_buttons.dart';
import 'package:young_gardener/widgets/additional_information_on_water_and_sun.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class PlantInfoScreen extends StatefulWidget {
  static const infoScreen = "/infoScreen";

  final String name;
  final int water;
  final int humidity;
  final int size;
  final int temperature;
  final String imgUrl;
  final String description;

  const PlantInfoScreen({
    Key? key,
    required this.name,
    required this.water,
    required this.humidity,
    required this.size,
    required this.temperature,
    required this.imgUrl,
    required this.description,
  }) : super(key: key);

  @override
  _PlantInfoScreenState createState() => _PlantInfoScreenState();
}

class _PlantInfoScreenState extends State<PlantInfoScreen> {
  final TextStyle textCharacteristicsStyle =
      GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 14);
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10, top: 3),
            child: SvgPicture.asset('assets/icons/tree.svg'),
          )
        ],
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 7),
                child: Text(
                  widget.name,
                  style: GoogleFonts.inder(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pushNamed('/');
            },
          ),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 236, 233, 233),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 27.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: 40,
              ),
            ),
            PlantCharacteristics(
              textDescriptionStyle: textCharacteristicsStyle,
              imageUrl: widget.imgUrl,
              water: widget.water,
              humidity: widget.humidity,
              temperature: widget.temperature,
              size: widget.size,
            ),
            SliverToBoxAdapter(child: SizedBox(height: 40)),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.search,
                          color: const Color.fromARGB(255, 168, 209, 161)),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Обзор растения',
                        style: GoogleFonts.inter(fontSize: 20),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            PlantDescription(
              textDescriptionStyle: textDescriptionStyle,
              textDescription: widget.description,
            ),
            SliverToBoxAdapter(child: SizedBox(height: 40)),
            SliverToBoxAdapter(
              child: Divider(
                color: Colors.black,
                thickness: 0.6,
                height: 0.8,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 20)),
            AdditionalInformationOnWaterAndSun(
              waterAmount: widget.water,
              sunshine: widget.temperature,
            ),
            SliverToBoxAdapter(child: SizedBox(height: 10)),
            SliverToBoxAdapter(child: SizedBox(height: 45)),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 20), // Отступ снизу
        child: BottomButtons(plantName: widget.name), // Твой виджет кнопок
      ),
    );
  }
}
