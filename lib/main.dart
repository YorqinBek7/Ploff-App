import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ploff/screens/splash_screen/splash_screen.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? sharedPreferences;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarBrightness: Brightness.light,
    statusBarColor: PloffColors.white,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(const PloffApp());
}

class PloffApp extends StatelessWidget {
  const PloffApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: null,
      ),
      debugShowCheckedModeBanner: false,
      title: 'Ploff app',
      home: SplashScreen(),
    );
  }
}
