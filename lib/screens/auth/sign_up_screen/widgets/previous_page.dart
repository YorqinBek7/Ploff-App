import 'package:flutter/material.dart';

void toPreviousPage(
    BuildContext context, int index, PageController _pageController) {
  if (index > -1) {
    index--;
  }
  if (index >= 0) {
    _pageController.jumpToPage(index);
  } else {
    Navigator.pop(context);
  }
}
