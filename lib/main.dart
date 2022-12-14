import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ploff/cubits/bottom_navigation/bottom_navigation_cubit.dart';
import 'package:ploff/cubits/count_selected_meal/count_selected_meal_cubit.dart';
import 'package:ploff/cubits/get_categories/get_categories_cubit.dart';
import 'package:ploff/cubits/get_products/get_products_cubit.dart';
import 'package:ploff/cubits/sign_up/sign_up_cubit.dart';
import 'package:ploff/screens/tab_box/home_tab/home_tab.dart';
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
        BlocProvider(
          create: (context) => SignUpCubit(),
        ),
        BlocProvider(
          create: (context) => GetProductsCubit(),
        ),
        BlocProvider(
          create: (context) => GetCategoriesCubit(),
        ),
      ],
      child: MaterialApp(
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
        home: HomeTab(),
      ),
    );
  }
}
