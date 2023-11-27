import 'package:flutter/material.dart';
import 'package:young_gardener/widgets/plant_characteristics.dart';
import 'package:young_gardener/widgets/plant_description.dart';
import 'package:young_gardener/widgets/bottom_buttons.dart';
import 'package:young_gardener/widgets/additional_information_on_water_and_sun.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class PlantInfoScreen extends StatefulWidget {
  static const infoScreen = "/infoScreen";
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
              SizedBox(width: 35),
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
        padding: const EdgeInsets.symmetric(horizontal: 27.0),
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
                              EdgeInsets.only(top: 5, bottom: 5, left: 10),
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
