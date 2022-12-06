// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:ploff/data/models/meal_model.dart';
import 'package:ploff/screens/tab_box/home_screen/sub_screens/get_location_screen/get_location_screen.dart';
import 'package:ploff/screens/tab_box/home_screen/sub_screens/meal_detail_screen/meal_detail_screen.dart';
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
  List<AboutMeal> allMeals = [];
  var s = GetMeals();
  @override
  void initState() {
    allMeals = s.allMeals;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PloffColors.C_F0F0F0,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: PloffColors.white,
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GetLocationScreen(),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          color: PloffColors.black,
                        ),
                        Expanded(
                          child: Text(
                            "Массив Бешягач 19/30",
                            style: PloffTextStyle.w400.copyWith(fontSize: 15),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Image.asset(
                          Plofficons.arrowDown,
                          width: 16,
                          height: 16,
                        ),
                        Spacer()
                      ],
                    ),
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
              child: RefreshIndicator(
                onRefresh: () async {},
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: SizedBox(
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
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        childCount: 5,
                        (context, index) => Container(
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
                                style:
                                    PloffTextStyle.w600.copyWith(fontSize: 22),
                              ),
                              ...List.generate(
                                allMeals.length,
                                (index) => MealItem(
                                  mealDescription:
                                      allMeals[index].mealDescription,
                                  mealName: allMeals[index].mealName,
                                  mealPrice: allMeals[index].mealPrice,
                                  index: index,
                                  length: allMeals.length,
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MealDetailScreen(
                                          aboutMeal: allMeals[index],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
