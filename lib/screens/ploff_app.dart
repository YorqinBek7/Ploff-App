import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ploff/screens/routers.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/constants/const.dart';

class PloffApp extends StatelessWidget {
  const PloffApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: context.locale,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: null,
        radioTheme: RadioThemeData(
          fillColor: MaterialStateProperty.all(
            PloffColors.C_FFCC00,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Ploff app',
      onGenerateRoute: Routers.generateRoute,
      initialRoute: Constants.splashScreen,
    );
  }
}
