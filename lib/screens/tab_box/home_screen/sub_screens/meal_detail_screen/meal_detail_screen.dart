// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ploff/cubits/bottom_navigation/bottom_navigation_cubit.dart';
import 'package:ploff/cubits/count_selected_meal/count_selected_meal_cubit.dart';
import 'package:ploff/data/models/category_with_products/categ_products.dart';
import 'package:ploff/data/models/modifier/variants.dart';
import 'package:ploff/data/service/api_service/api_service.dart';
import 'package:ploff/data/service/hive_service/hive_service.dart';
import 'package:ploff/screens/tab_box/widgets/global_button.dart';
import 'package:ploff/screens/tab_box/home_screen/sub_screens/meal_detail_screen/widgets/appbar_bottom.dart';
import 'package:ploff/screens/tab_box/home_screen/sub_screens/meal_detail_screen/widgets/inc_dec_buttons.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/helper/helper.dart';
import 'package:ploff/utils/icons/icons.dart';
import 'package:ploff/utils/style/text_style.dart';

class MealDetailScreen extends StatefulWidget {
  MealDetailScreen({
    super.key,
    required this.aboutMeal,
    required this.price,
    required this.firstlyPrice,
  });
  final CategWithProduct aboutMeal;
  double price;
  double firstlyPrice;

  @override
  State<MealDetailScreen> createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  int count = 1;
  int modifierindex = 0;
  ApiService apiService = ApiService();
  List<VariantsModel> variants = [];
  @override
  void initState() {
    init();
    super.initState();
  }

  init() async {
    ApiService apiService = ApiService();
    variants =
        await apiService.getModifiers('ec0db30d-a935-4ef7-b1d5-6c4649ff18ca');
    log(variants.length.toString());
  }

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
                            ? const Icon(Icons.arrow_back)
                            : const Icon(
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
                          widget.aboutMeal.title.uz,
                          style: PloffTextStyle.w500,
                        ),
                        Text(
                          "Ba'tafsil: ${widget.aboutMeal.description.uz}",
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
                          variants.length,
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
                            child: ListTile(
                              leading: modifierindex == index
                                  ? const Icon(
                                      Icons.radio_button_checked,
                                      color: PloffColors.C_FFCC00,
                                    )
                                  : const Icon(Icons.radio_button_off),
                              title: Text(variants[index].title.uz),
                              trailing: Text(Helper.formatSumm(
                                  variants[index].out_price.toString())),
                              onTap: () {
                                setState(() {
                                  modifierindex = index;
                                  widget.price = widget.firstlyPrice;
                                  widget.price += variants[index].out_price;
                                });
                              },
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
                          Helper.formatSumm(widget.price.toInt().toString()),
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
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Product added to cart")),
                    );
                    await HiveService.instance
                        .addProductToStorage(widget.aboutMeal);
                    log(HiveService.instance.dataBox.length.toString());
                    context
                        .read<BottomNavigationCubit>()
                        .changeBottomNavigationPages(1);
                    Navigator.pop(context);
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
