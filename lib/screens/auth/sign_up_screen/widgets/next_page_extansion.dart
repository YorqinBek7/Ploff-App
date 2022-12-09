import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ploff/main.dart';
import 'package:ploff/screens/tab_box/home_tab/home_tab.dart';

Future<void> toNextPage(
    BuildContext context,
    TextEditingController phoneController,
    int index,
    PageController _pageController) async {
  if (phoneController.text.isNotEmpty) {
    await sharedPreferences!.setString("numberPhone", phoneController.text);
  }
  index++;
  if (index < 2 && phoneController.text.isNotEmpty) {
    _pageController.jumpToPage(index);
  } else if (phoneController.text.isEmpty) {
  } else {
    Navigator.pushReplacement(
      context,
      CupertinoPageRoute(
        builder: (context) => const HomeTab(),
      ),
    );
  }
}
