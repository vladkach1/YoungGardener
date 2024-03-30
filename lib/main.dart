import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:young_gardener/screens/plant_info_screen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:young_gardener/main-screen.dart';
import 'package:young_gardener/screens/Auth.dart';
import 'package:young_gardener/screens/Searchscreen.dart';
import 'package:young_gardener/register.dart';
import 'package:young_gardener/screens/plant_info_screen2.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:young_gardener/screens/wrapper.dart';
import 'package:young_gardener/services/authindication.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';
import 'services/User.dart';

//СДЕЛАЙ В ИНФЕ АППБАР МЕНЬШЕ И СО СТРОКОЙ ПОИСКА РАЗБЕРИСЬ(ТОЖЕ САМОЕ СКОРЕЕ ВСЕГО НАДО СДЕЛАТЬ В ИНФЕ С ПЕТРУХОЙ)
//СДЕЛАТЬ ЧТОБЫ В СТРОКАХ ВВОДА ТЕКСТ НЕ ДОХОДИЛ ДО КОНЦА КОНТЕЙНЕРА
void main() async{
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return StreamProvider<UserYG?>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        theme: ThemeData(
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              foregroundColor: Colors.green,
              backgroundColor: Color.fromARGB(255, 211, 211, 211),
            ),
          ),
          textTheme: TextTheme(
            titleLarge: GoogleFonts.inika(
              fontSize: 30,
              color: Colors.black,
            ),
            titleMedium: GoogleFonts.inder(
              fontSize: 16,
              color: Colors.black,
            ),
            bodyMedium: GoogleFonts.inder(
              fontSize: 18,
              color: Colors.black,
            ),
            displayMedium: GoogleFonts.inder(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          // СПРОСИТЬ У МЕНТОРА КАК ГРАДИЕНТ СЮДА ЗАСУНУТЬ
          appBarTheme: const AppBarTheme(
            elevation: 0,
            backgroundColor: Colors.transparent,
            iconTheme: IconThemeData(color: Colors.black),
          ),
        ),
        routes: {
          '/Info': (context) => PlantInfoScreen(),
          '/Search': (context) => SearchScreen(),
          '/': (context) => Wrapper(),
          '/Auth': (context) => AuthPage(),
          '/mainScreen': (context) => MainScreen(),
          '/Register': (context) => RegisterPage(),
          '/Info2': (context)=> PlantInfoScreen2()
        },
      ),
    );
  }
}
