import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ploff/main.dart';
import 'package:ploff/screens/auth/sign_up_screen/sign_up_screen.dart';
import 'package:ploff/screens/tab_box/cart_screen/cart_screen.dart';
import 'package:ploff/screens/tab_box/home_screen/home_screen.dart';
import 'package:ploff/screens/tab_box/my_orders_screen/my_orders_screen.dart';
import 'package:ploff/screens/tab_box/profile_screen/profile_screen.dart';
import 'package:ploff/utils/colors/colors.dart';

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
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: PloffColors.C_FFCC00,
        currentIndex: index,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        type: BottomNavigationBarType.fixed,
        onTap: (value) async {
          setState(() {
            index = value;
          });
          if ((index == 2 || index == 3) &&
              sharedPreferences?.getString("numberPhone") == null) {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SignUpScreen(),
              ),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Главная",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: "Корзина",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: "Мои заказы",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Профиль",
          ),
        ],
      ),
    );
  }
}
