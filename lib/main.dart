import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ploff/cubits/bottom_navigation/bottom_navigation_cubit.dart';
import 'package:ploff/cubits/count_selected_meal/count_selected_meal_cubit.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BottomNavigationCubit(),
        ),
        BlocProvider(
          create: (context) => CountSelectedMealCubit(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: null,
        ),
        debugShowCheckedModeBanner: false,
        title: 'Ploff app',
        home: SplashScreen(),
      ),
    );
  }
}
