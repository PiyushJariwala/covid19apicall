import 'package:covid19apicall/drower.dart';
import 'package:covid19apicall/homepage.dart';
import 'package:covid19apicall/hospital.dart';
import 'package:covid19apicall/notifications.dart';
import 'package:covid19apicall/splash.dart';
import 'package:covid19apicall/testing.dart';
import 'package:covid19apicall/web_viwe.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context)=> SplashPage(),
        '/firstscreen':(context)=>MyApp(),
        '/test':(context)=>TestingStats(),
        '/hospital':(context)=>HospitalDetails(),
        '/helpline':(context)=>HelpLine(),
        '/web':(context)=>WebViweScreen(),
        '/notification':(context)=>NotificationScreen(),
      },
      theme: ThemeData(
        brightness: Brightness.light,
        splashColor: Colors.orange,
        primarySwatch: Colors.orange,
        primaryColor: Colors.orange,
        textTheme: TextTheme(
          headline1: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),
          headline2: GoogleFonts.poppins(color: Colors.black,fontSize: 13),
          headline3: GoogleFonts.poppins(color: Colors.black,fontSize: 20),
          headline4: GoogleFonts.poppins(color: Colors.red,fontSize: 20),
          headline5: GoogleFonts.poppins(color: Colors.green.shade700,fontSize: 20),
          headline6: GoogleFonts.poppins(color: Colors.black,fontSize: 13,fontWeight: FontWeight.bold),
          subtitle1: GoogleFonts.poppins(color: Colors.black,fontSize: 10),
          subtitle2: GoogleFonts.poppins(color: Colors.black,fontSize: 15),
          bodyText1: GoogleFonts.poppins(color: Colors.blue,fontSize: 13,fontWeight: FontWeight.bold),
        ),
      ),
    ),
  );
}
