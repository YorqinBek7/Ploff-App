import 'package:flutter/material.dart';
import 'package:ploff/screens/splash_screen/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? sharedPreferences;
void main() async {
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(const PloffApp());
}

class PloffApp extends StatelessWidget {
  const PloffApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: null,
      ),
      debugShowCheckedModeBanner: false,
      title: 'Ploff app',
      home: SplashScreen(),
    );
  }
}
