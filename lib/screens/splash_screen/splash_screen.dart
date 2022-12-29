import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ploff/data/service/storage_service/shared_preferences.dart';
import 'package:ploff/screens/select_language_screen/select_language_screen.dart';
import 'package:ploff/screens/tab_box/home_tab/home_tab.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/constants/const.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _init();
    super.initState();
  }

  Future<void> _init() async {
    await Future.delayed(const Duration(seconds: 2), () {
      if (SharedPreferencesService.instance.sharedPreferences
              .getString("lan") ==
          null) {
        Navigator.pushReplacementNamed(
            context, Constants.selectLanguageScreeen);
      } else {
        Navigator.pushReplacementNamed(context, Constants.homeTab);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PloffColors.white,
      body: Center(
        child: Image.asset(
          "assets/images/ploff_logo.png",
          height: 240.0,
          width: 271.0,
        ),
      ),
    );
  }
}
