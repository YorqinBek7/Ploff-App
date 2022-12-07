import 'package:flutter/material.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/style/text_style.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  final String title;
  final PreferredSizeWidget? bottom;
  final bool notTabBar;
  const CustomAppBar({
    Key? key,
    required this.title,
    required this.notTabBar,
    this.bottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: PloffColors.white,
      centerTitle: true,
      title: Text(
        title,
        style: PloffTextStyle.w600.copyWith(fontSize: 18),
      ),
      bottom: bottom,
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => Size(double.infinity, notTabBar ? 69 : 120);
}
