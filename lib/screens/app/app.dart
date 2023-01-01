import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ploff/cubits/bottom_navigation/bottom_navigation_cubit.dart';
import 'package:ploff/cubits/change_language/change_language_cubit.dart';
import 'package:ploff/cubits/count_meals/count_meals_cubit.dart';
import 'package:ploff/cubits/current_loc/current_location_cubit.dart';
import 'package:ploff/cubits/empty_cart/empty_cart_cubit.dart';
import 'package:ploff/cubits/get_product_categ_bann/get_product_and_category_cubit.dart';
import 'package:ploff/cubits/modifiers/modifiers_cubit.dart';
import 'package:ploff/cubits/sign_up/sign_up_cubit.dart';
import 'package:ploff/screens/ploff_app.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BottomNavigationCubit(),
        ),
        BlocProvider(
          create: (context) => SignUpCubit(),
        ),
        BlocProvider(
          create: (context) => GetProductAndCategoryCubit(),
        ),
        BlocProvider(
          create: (context) => CurrentLocationCubit(),
        ),
        BlocProvider(
          create: (context) => CountMealsCubit(),
        ),
        BlocProvider(
          create: (context) => ModifiersCubit(),
        ),
        BlocProvider(
          create: (context) => EmptyCartCubit(),
        ),
        BlocProvider(
          create: (context) => ChangeLanguageCubit(),
        ),
      ],
      child: const PloffApp(),
    );
  }
}
