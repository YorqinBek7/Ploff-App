import 'dart:developer';
import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ploff/cubits/bottom_navigation/bottom_navigation_cubit.dart';
import 'package:ploff/cubits/count_selected_meal/count_selected_meal_cubit.dart';
import 'package:ploff/data/local_database/cached_meals.dart';
import 'package:ploff/data/local_database/local_database.dart';
import 'package:ploff/screens/tab_box/widgets/auth_button.dart';
import 'package:ploff/screens/tab_box/home_screen/sub_screens/meal_detail_screen/widgets/appbar_bottom.dart';
import 'package:ploff/screens/tab_box/home_screen/sub_screens/meal_detail_screen/widgets/inc_dec_buttons.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/icons/icons.dart';
import 'package:ploff/utils/style/text_style.dart';

class MealDetailScreen extends StatefulWidget {
  MealDetailScreen({
    super.key,
    required this.aboutMeal,
    required this.price,
    required this.firstlyPrice,
  });
  final CachedMeals aboutMeal;
  double price;
  double firstlyPrice;

  @override
  State<MealDetailScreen> createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PloffColors.C_F0F0F0,
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  bottom: const AppBarBottom(),
                  leading: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(.8),
                        ),
                        child: Platform.isAndroid
                            ? Icon(Icons.arrow_back)
                            : Icon(
                                Icons.arrow_back_ios,
                              ),
                      ),
                    ),
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(.8),
                        ),
                        child: SvgPicture.asset(
                          "assets/svg/share.svg",
                        ),
                      ),
                    ),
                  ],
                  pinned: true,
                  collapsedHeight: 200,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.asset(
                      Plofficons.banner,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                      bottom: 10,
                    ),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: PloffColors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.aboutMeal.mealName,
                          style: PloffTextStyle.w500,
                        ),
                        Text(
                          "Ba'tafsil: ${widget.aboutMeal.mealDescription}",
                          style: PloffTextStyle.w400.copyWith(
                            fontSize: 15.0,
                            color: PloffColors.black.withOpacity(.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: PloffColors.white,
                    ),
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      children: [
                        ...List.generate(
                          3,
                          (index) => Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: index != 3 - 1
                                    ? BorderSide(
                                        color:
                                            PloffColors.black.withOpacity(.1),
                                      )
                                    : BorderSide.none,
                              ),
                            ),
                            child: RadioListTile(
                              activeColor: PloffColors.C_FFCC00,
                              title: Text("Select"),
                              groupValue: "k",
                              onChanged: (value) => {
                                setState(() => {}),
                              },
                              value: null,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: PloffColors.white,
            ),
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                BlocBuilder<CountSelectedMealCubit, int>(
                  builder: (context, state) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: PloffColors.white,
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: PloffColors.black.withOpacity(.1),
                            ),
                          ),
                          child: Row(
                            children: [
                              IncDecButtons(
                                imagePath: Plofficons.minus,
                                onTap: () {
                                  if (state > 1) {
                                    context
                                        .read<CountSelectedMealCubit>()
                                        .removeCountMeal();
                                    widget.price = state * widget.firstlyPrice;
                                  }
                                },
                              ),
                              Text(
                                "$state",
                                style: PloffTextStyle.w500.copyWith(
                                  fontSize: 15,
                                ),
                              ),
                              IncDecButtons(
                                onTap: () {
                                  widget.price = state * widget.firstlyPrice;
                                  context
                                      .read<CountSelectedMealCubit>()
                                      .addCountMeal();
                                },
                                imagePath: Plofficons.plus,
                              )
                            ],
                          ),
                        ),
                        Text(
                          "${widget.price} so'm",
                          style: PloffTextStyle.w600.copyWith(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 15),
                GlobalButton(
                  buttonText: "To Cart",
                  onTap: () async {
                    await LocalDataBase.insertMeals(widget.aboutMeal);
                    context
                        .read<BottomNavigationCubit>()
                        .changeBottomNavigationPages(1);
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
