import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ploff/cubits/bottom_navigation/bottom_navigation_cubit.dart';
import 'package:ploff/data/service/hive_service/hive_service.dart';
import 'package:ploff/main.dart';
import 'package:ploff/screens/auth/sign_up_screen/enter_phone_number_page.dart';
import 'package:ploff/screens/tab_box/cart_screen/cart_screen.dart';
import 'package:ploff/screens/tab_box/home_screen/home_screen.dart';
import 'package:ploff/screens/tab_box/my_orders_screen/my_orders_screen.dart';
import 'package:ploff/screens/tab_box/profile_screen/profile_screen.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/icons/icons.dart';
import 'package:ploff/utils/style/text_style.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List<Widget> screens = [
    const HomeScreen(),
    const CartScreen(),
    const MyOrdersScreen(),
    const ProfileScreen()
  ];

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
                  (sharedPreferences?.getString("numberPhone") == null ||
                      sharedPreferences?.getString("numberPhone") == "")) {
                await Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) {
                      value = index;
                      return EnterPhoneNumberPage();
                    },
                  ),
                );
              }
              context
                  .read<BottomNavigationCubit>()
                  .changeBottomNavigationPages(value);
            },
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(Plofficons.home),
                label: "Главная",
                activeIcon: SvgPicture.asset(
                  Plofficons.home,
                  color: PloffColors.C_FFCC00,
                ),
              ),
              BottomNavigationBarItem(
                icon: Badge(
                  badgeContent: Text(
                    HiveService.instance.dataBox.length.toString(),
                    style: PloffTextStyle.w500
                        .copyWith(color: PloffColors.white, fontSize: 8.5),
                  ),
                  child: SvgPicture.asset(Plofficons.cart),
                ),
                label: "Корзина",
                activeIcon: Badge(
                  badgeContent: Text(
                    HiveService.instance.dataBox.length.toString(),
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
                label: "Мои заказы",
                activeIcon: SvgPicture.asset(
                  Plofficons.shopping_bag,
                  color: PloffColors.C_FFCC00,
                ),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(Plofficons.user),
                label: "Профиль",
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
