import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop/pages/Home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      '/home': (context)=> Home(),
    },
    themeMode: ThemeMode.light,
    theme: ThemeData(
      primarySwatch: Colors.yellow,
      fontFamily: GoogleFonts.baloo().fontFamily,
      // primaryTextTheme: GoogleFonts.latoTextTheme()
    ),
    darkTheme: ThemeData(
      brightness: Brightness.dark
    ),
  ));
}
