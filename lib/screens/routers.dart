import 'package:flutter/cupertino.dart';
import 'package:ploff/data/models/category_with_products/categ_products.dart';
import 'package:ploff/screens/auth/sign_up_screen/enter_phone_number_page.dart';
import 'package:ploff/screens/auth/sign_up_screen/otp_page.dart';
import 'package:ploff/screens/no_router_screen.dart';
import 'package:ploff/screens/select_language_screen/select_language_screen.dart';
import 'package:ploff/screens/splash_screen/splash_screen.dart';
import 'package:ploff/screens/tab_box/cart_screen/check_out_screen/check_out_screen.dart';
import 'package:ploff/screens/tab_box/home_screen/sub_screens/get_location_screen/get_location_screen.dart';
import 'package:ploff/screens/tab_box/home_screen/sub_screens/meal_detail_screen/meal_detail_screen.dart';
import 'package:ploff/screens/tab_box/home_tab/home_tab.dart';
import 'package:ploff/screens/tab_box/profile_screen/sub_screens/about_screen/about_screen.dart';
import 'package:ploff/screens/tab_box/profile_screen/sub_screens/about_screen/sub_screens/condensation_policy_screen.dart';
import 'package:ploff/screens/tab_box/profile_screen/sub_screens/about_screen/sub_screens/license_agreements.dart';
import 'package:ploff/screens/tab_box/profile_screen/sub_screens/branches_screen/branches_screen.dart';
import 'package:ploff/screens/tab_box/profile_screen/sub_screens/branches_screen/detail_branch_screen/detail_branch_screen.dart';
import 'package:ploff/screens/tab_box/profile_screen/sub_screens/edit_profile_screen/edit_profile_screen.dart';
import 'package:ploff/screens/tab_box/profile_screen/sub_screens/my_locations/my_locations.dart';
import 'package:ploff/screens/tab_box/profile_screen/sub_screens/settings_screen/settings_screen.dart';
import 'package:ploff/utils/constants/const.dart';

class Routers {
  static final Routers routers = Routers._();
  factory Routers() => routers;
  Routers._();
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Constants.splashScreen:
        return CupertinoPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case Constants.selectLanguageScreeen:
        return CupertinoPageRoute(
          builder: (context) => const SelectLanguageScreen(),
        );
      case Constants.getLocationScreen:
        return CupertinoPageRoute(
          builder: (context) => const GetLocationScreen(),
        );
      case Constants.homeTab:
        return CupertinoPageRoute(
          builder: (context) => const HomeTab(),
        );
      case Constants.mealDetailScreen:
        return CupertinoPageRoute(
          builder: (context) => MealDetailScreen(
            aboutMeal: settings.arguments as CategWithProduct,
          ),
        );
      case Constants.checkoutScreen:
        return CupertinoPageRoute(
          builder: (context) => const CheckOutScreen(),
        );
      case Constants.orderDetail:
        return CupertinoPageRoute(
          builder: (context) => const DetailBranchScreen(),
        );
      case Constants.myAddressesScreen:
        return CupertinoPageRoute(
          builder: (context) => const MyLocations(),
        );
      case Constants.branchesScreeen:
        return CupertinoPageRoute(
          builder: (context) => const BranchesScreen(),
        );
      case Constants.settingsScreen:
        return CupertinoPageRoute(
          builder: (context) => const SettingsScreen(),
        );
      case Constants.aboutScreen:
        return CupertinoPageRoute(
          builder: (context) => const AboutScreen(),
        );
      case Constants.detailBranchesScreeen:
        return CupertinoPageRoute(
          builder: (context) => const DetailBranchScreen(),
        );
      case Constants.condesationPolicyScreen:
        return CupertinoPageRoute(
          builder: (context) => const CondensationPolicyScreen(),
        );
      case Constants.licenseScreeen:
        return CupertinoPageRoute(
          builder: (context) => const LicenceScreen(),
        );
      case Constants.otpScreen:
        return CupertinoPageRoute(
          builder: (context) => OtpPage(),
        );
      case Constants.editProfileScreen:
        return CupertinoPageRoute(
          builder: (context) => const EditProfileScreen(),
        );
      case Constants.enterPhoneNumberScreen:
        return CupertinoPageRoute(
          builder: (context) => EnterPhoneNumberPage(),
        );
      default:
        return CupertinoPageRoute(
          builder: (context) => const NoRouterScreen(),
        );
    }
  }
}
