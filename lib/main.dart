import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop/pages/Language.dart';
import 'package:shop/pages/SharedPreference.dart';
import 'package:shop/pages/UserDatabase.dart';
import 'package:shop/widgets/AlertDialog_widget.dart';
import 'package:shop/pages/Home.dart';
import 'package:shop/pages/Login.dart';
import 'package:shop/pages/MovieList.dart';
import 'package:shop/pages/WidgetsPage.dart';
import 'package:shop/utils/Routes.dart';
import 'package:shop/widgets/Animation_widget.dart';
import 'package:shop/widgets/BottomNavigation_widget.dart';
import 'package:shop/widgets/BottomSheet_widget.dart';
import 'package:shop/widgets/Carousel_widget.dart';
import 'package:shop/widgets/GridView_widget.dart';
import 'package:shop/widgets/TabBar_widget.dart';
import 'package:shop/widgets/Table_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  await Firebase.initializeApp();
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
  //   SystemUiOverlay.bottom
  // ]);  // to hide only bottom bar

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.homeRoute,
    routes: {
      Routes.homeRoute: (context) => Home(),
      Routes.loginRoute: (context) => Login(),
      Routes.movieListRoute: (context) => MovieList(),
      Routes.widgetPageRoute: (context) => WidgetsPage(),
      Routes.alertDialogWidgetRoute: (context) => AlertDialogWidget(),
      Routes.bottomNavigationWidgetRoute: (context) => BottomNavigationWidget(),
      Routes.bottomSheetWidgetRoute: (context) => BottomSheetWidget(),
      Routes.tableWidgetRoute: (context) => TableWidget(),
      Routes.tabBarWidgetRoute: (context) => TabBarWidget(),
      Routes.carouselWidgetRoute: (context) => CarouselWidget(),
      Routes.gridViewWidgetRoute: (context) => GridViewWidget(),
      Routes.animationWidgetRoute: (context) => AnimationWidget(),
      Routes.userDatabaseRoute: (context) => UserDatabase(),
      Routes.languageRoute: (context) => Language(),
      Routes.sharedPreferenceRoute: (context) => SharedPreference(),
    },
    themeMode: ThemeMode.light,
    theme: ThemeData(
        primarySwatch: Colors.amber,
        fontFamily: GoogleFonts.lato().fontFamily,
        appBarTheme: AppBarTheme(
          color: Colors.amberAccent,
          iconTheme: IconThemeData(color: Colors.black),
        )
        // primaryTextTheme: GoogleFonts.latoTextTheme()
        ),
    darkTheme: ThemeData(brightness: Brightness.dark),

    //FOR LOCALIZATION
    onGenerateTitle: (context) => AppLocalizations.of(context)!.helloWorld,
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,


  ));
}
