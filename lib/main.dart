import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ploff/cubits/bottom_navigation/bottom_navigation_cubit.dart';
import 'package:ploff/cubits/count_meals/count_meals_cubit.dart';
import 'package:ploff/cubits/count_selected_meal/count_selected_meal_cubit.dart';
import 'package:ploff/cubits/current_loc/current_location_cubit.dart';
import 'package:ploff/cubits/empty_cart/empty_cart_cubit.dart';
import 'package:ploff/cubits/get_product_categ_bann/get_product_and_category_cubit.dart';
import 'package:ploff/cubits/modifiers/modifiers_cubit.dart';
import 'package:ploff/cubits/sign_up/sign_up_cubit.dart';
import 'package:ploff/data/models/category_with_products/categ_products.dart';
import 'package:ploff/data/models/category_with_products/categ_with_product.dart';
import 'package:ploff/data/models/category_with_products/description.dart';
import 'package:ploff/data/models/category_with_products/title.dart';
import 'package:ploff/data/models/orders/orders.dart';
import 'package:ploff/data/models/user_locations/user_locations.dart';
import 'package:ploff/data/service/hive_service/hive_service.dart';
import 'package:ploff/data/service/storage_service/shared_preferences.dart';
import 'package:ploff/screens/splash_screen/splash_screen.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  SharedPreferencesService.instance.sharedPreferences =
      await SharedPreferences.getInstance();
  Hive.registerAdapter<CategProducts>(CategProductsAdapter());
  Hive.registerAdapter<Description>(DescriptionAdapter());
  Hive.registerAdapter<CategWithProduct>(CategWithProductAdapter());
  Hive.registerAdapter<TitleModel>(TitleModelAdapter());
  Hive.registerAdapter<UserLocations>(UserLocationsAdapter());
  Hive.registerAdapter<Orders>(OrdersAdapter());
  await Hive.initFlutter();
  await HiveService.instance.createBox();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarBrightness: Brightness.light,
    statusBarColor: PloffColors.white,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale("uz", "UZ"),
        Locale("en", "EN"),
      ],
      fallbackLocale: const Locale('uz', 'UZ'),
      path: 'assets/translations',
      child: const PloffApp(),
    ),
  );
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
      ],
      child: MyWidget(),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

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
      home: SplashScreen(),
    );
  }
}
