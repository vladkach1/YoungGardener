import 'package:flutter/material.dart';
import 'package:young_gardener/widgets/plant_characteristics2.dart';
import 'package:young_gardener/widgets/plant_description2.dart';
import 'package:young_gardener/widgets/bottom_buttons2.dart';
import 'package:young_gardener/widgets/additional_information_on_water_and_sun.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class PlantInfoScreen2 extends StatefulWidget {
  static const infoScreen = "/infoScreen2";
  @override
  _PlantInfoScreenState2 createState() => _PlantInfoScreenState2();
}

class _PlantInfoScreenState2 extends State<PlantInfoScreen2> {
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
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: SvgPicture.asset('assets/icons/plant.svg'),
              ),
              SizedBox(width: 10),
              Padding(
                padding: const EdgeInsets.only(bottom: 7),
                child: Text(
                  'Монстера деликатенсная',
                  style: GoogleFonts.inder(
                    fontSize: 18,
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
              Navigator.pop(context);
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
            PlantCharacteristics2(
                textDescriptionStyle: textCharacteristicsStyle),
            SliverToBoxAdapter(child: SizedBox(height: 40)),
            PlantDescription2(textDescriptionStyle: textDescriptionStyle),
            SliverToBoxAdapter(child: SizedBox(height: 10)),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.search, color: const Color.fromARGB(255,168,209,161) ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Обзор растения',
                        style: GoogleFonts.inter(fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 150,
                  ),
                
                  
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            AdditionalInformationOnWaterAndSun(
              waterAmount: 150,
              sunshine: 16,
              humidity: "более 70%",
              size: "до 3м",
            ),
            SliverToBoxAdapter(child: SizedBox(height: 10)),
            BottomButtons2(),
            SliverToBoxAdapter(child: SizedBox(height: 45)),
          ],
        ),
      ),
    );
  }
}
