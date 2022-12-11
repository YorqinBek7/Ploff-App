import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ploff/cubits/bottom_navigation/bottom_navigation_cubit.dart';
import 'package:ploff/data/local_database/local_database.dart';
import 'package:ploff/main.dart';
import 'package:ploff/screens/auth/sign_up_screen/enter_phone_number_page.dart';
import 'package:ploff/screens/tab_box/cart_screen/cart_screen.dart';
import 'package:ploff/screens/tab_box/home_screen/home_screen.dart';
import 'package:ploff/screens/tab_box/my_orders_screen/my_orders_screen.dart';
import 'package:ploff/screens/tab_box/profile_screen/profile_screen.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/icons/icons.dart';

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
  @override
  void initState() {
    init();
    super.initState();
  }

  init() async {
    context.read<BottomNavigationCubit>().meals =
        await LocalDataBase.getAllCachedMeals();
  }

  int index = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
      builder: (context, state) {
        if (state is BottomNavigationInHome) {
          index = 0;
        } else if (state is BottomNavigationInCart) {
          index = 1;
        } else if (state is BottomNavigationInMyOrders) {
          index = 2;
        } else if (state is BottomNavigationInProfile) {
          index = 3;
        }
        return Scaffold(
          body: IndexedStack(
            index: index,
            children: screens,
          ),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: PloffColors.C_FFCC00,
            currentIndex: index,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            type: BottomNavigationBarType.fixed,
            onTap: (value) async {
              if ((value == 2 || value == 3) &&
                  (sharedPreferences?.getString("numberPhone") == null ||
                      sharedPreferences?.getString("numberPhone") == "")) {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) {
                      value = index;
                      return EnterPhoneNumberPage();
                    },
                  ),
                );
              }
              log(context.read<BottomNavigationCubit>().meals.toString());
              context.read<BottomNavigationCubit>().changeBottomNavigationPages(
                    value,
                    context.read<BottomNavigationCubit>().meals,
                  );
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
                icon: SvgPicture.asset(Plofficons.cart),
                label: "Корзина",
                activeIcon: SvgPicture.asset(
                  Plofficons.cart,
                  color: PloffColors.C_FFCC00,
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
