import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ploff/data/models/category_with_products/categ_products.dart';
import 'package:ploff/data/models/category_with_products/categ_with_product.dart';
import 'package:ploff/data/models/category_with_products/description.dart';
import 'package:ploff/data/models/category_with_products/title.dart';
import 'package:ploff/data/models/orders/orders.dart';
import 'package:ploff/data/models/user_locations/user_locations.dart';
import 'package:ploff/data/service/hive_service/hive_service.dart';
import 'package:ploff/data/service/storage_service/shared_preferences.dart';
import 'package:ploff/screens/app/app.dart';
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
        Locale("ru", "RU"),
      ],
      path: 'assets/translations',
      child: const App(),
    ),
  );
}
