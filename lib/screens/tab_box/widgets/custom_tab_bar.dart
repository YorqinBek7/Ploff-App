import 'package:flutter/material.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/style/text_style.dart';

class CustomTabBar extends StatelessWidget implements PreferredSize {
  final String firstTabText;
  final String secondTabText;

  const CustomTabBar({
    Key? key,
    required this.tabController,
    required this.firstTabText,
    required this.secondTabText,
  }) : super(key: key);

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: PloffColors.C_F0F0F0,
      ),
      child: TabBar(
        controller: tabController,
        labelColor: PloffColors.black,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: PloffColors.white,
        ),
        onTap: (value) {},
        tabs: [
          Tab(
            child: Text(
              firstTabText,
              style: PloffTextStyle.w500.copyWith(fontSize: 15),
            ),
          ),
          Tab(
            child: Text(
              secondTabText,
              style: PloffTextStyle.w500.copyWith(fontSize: 15),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size(double.infinity, 80);
}
