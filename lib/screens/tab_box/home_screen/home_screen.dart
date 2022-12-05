// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:ploff/screens/tab_box/home_screen/widgets/banner_widget.dart';
import 'package:ploff/screens/tab_box/home_screen/widgets/category.dart';
import 'package:ploff/screens/tab_box/home_screen/widgets/meal_item.dart';
import 'package:ploff/screens/tab_box/home_screen/widgets/search_field.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/icons/icons.dart';
import 'package:ploff/utils/style/text_style.dart';

List<int> categoryIndex = [];

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PloffColors.C_F0F0F0,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: PloffColors.white,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        color: PloffColors.black,
                      ),
                      Text(
                        "Массив Бешягач 19/30",
                        style: PloffTextStyle.w400.copyWith(fontSize: 15),
                      ),
                      SizedBox(width: 5),
                      Image.asset(
                        Plofficons.arrowDown,
                        width: 16,
                        height: 16,
                      )
                    ],
                  ),
                  SizedBox(height: 12),
                  SearchField(),
                  SizedBox(height: 16),
                  CategoryItem(
                    setter: (fn) => {
                      setState(() => {}),
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                children: [
                  SizedBox(
                    height: 170,
                    child: ListView.builder(
                      shrinkWrap: true,
                      key: GlobalKey(),
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemCount: 5,
                      itemBuilder: (context, index) => BannerWidget(),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: PloffColors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Birinchi taomlar",
                              style: PloffTextStyle.w600.copyWith(fontSize: 22),
                            ),
                            SizedBox(
                              height: 500,
                              child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 7,
                                itemBuilder: (context, index) => MealItem(
                                  mealDescription:
                                      "Nimadur nimadur Nimadur nimadurNimadur nimadurNimadur nimadur",
                                  mealName: "Go'ja",
                                  mealPrice: '23 000',
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
