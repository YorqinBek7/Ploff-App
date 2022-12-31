import 'package:badges/badges.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ploff/cubits/bottom_navigation/bottom_navigation_cubit.dart';
import 'package:ploff/data/service/hive_service/hive_service.dart';
import 'package:ploff/data/service/storage_service/shared_preferences.dart';
import 'package:ploff/screens/tab_box/cart_screen/cart_screen.dart';
import 'package:ploff/screens/tab_box/home_screen/home_screen.dart';
import 'package:ploff/screens/tab_box/my_orders_screen/my_orders_screen.dart';
import 'package:ploff/screens/tab_box/profile_screen/profile_screen.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/constants/const.dart';
import 'package:ploff/utils/icons/icons.dart';
import 'package:ploff/utils/style/text_style.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List<Widget> screens = [];
  @override
  void initState() {
    screens = [
      const HomeScreen(),
      CartScreen(),
      const MyOrdersScreen(),
      const ProfileScreen(),
    ];
    super.initState();
  }

  int index = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationCubit, int>(
      builder: (context, state) {
        return Scaffold(
          body: IndexedStack(
            index: state,
            children: screens,
          ),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: PloffColors.C_FFCC00,
            currentIndex: state,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            type: BottomNavigationBarType.fixed,
            onTap: (value) async {
              if ((value == 2 || value == 3) &&
                  (SharedPreferencesService.instance.sharedPreferences
                              .getString("numberPhone") ==
                          null ||
                      SharedPreferencesService.instance.sharedPreferences
                              .getString("numberPhone") ==
                          "")) {
                value = index;
                await Navigator.pushNamed(context, Constants.enterPhoneNumber);
              }
              context
                  .read<BottomNavigationCubit>()
                  .changeBottomNavigationPages(value);
            },
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(Plofficons.home),
                label: tr("main"),
                activeIcon: SvgPicture.asset(
                  Plofficons.home,
                  color: PloffColors.C_FFCC00,
                ),
              ),
              BottomNavigationBarItem(
                icon: Badge(
                  badgeContent: Text(
                    HiveService.instance.cartProductsBox.length.toString(),
                    style: PloffTextStyle.w500
                        .copyWith(color: PloffColors.white, fontSize: 8.5),
                  ),
                  child: SvgPicture.asset(Plofficons.cart),
                ),
                label: tr("cart"),
                activeIcon: Badge(
                  badgeContent: Text(
                    HiveService.instance.cartProductsBox.length.toString(),
                    style: PloffTextStyle.w500
                        .copyWith(color: PloffColors.white, fontSize: 8.5),
                  ),
                  child: SvgPicture.asset(
                    Plofficons.cart,
                    color: PloffColors.C_FFCC00,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(Plofficons.shopping_bag),
                label: tr("my_orders"),
                activeIcon: SvgPicture.asset(
                  Plofficons.shopping_bag,
                  color: PloffColors.C_FFCC00,
                ),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(Plofficons.user),
                label: tr("profil"),
                activeIcon: SvgPicture.asset(
                  Plofficons.user,
                  color: PloffColors.C_FFCC00,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
