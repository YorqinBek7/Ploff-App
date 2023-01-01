import 'dart:io' show Platform;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:ploff/cubits/bottom_navigation/bottom_navigation_cubit.dart';
import 'package:ploff/cubits/empty_cart/empty_cart_cubit.dart';
import 'package:ploff/cubits/modifiers/modifiers_cubit.dart';
import 'package:ploff/data/models/category_with_products/categ_products.dart';
import 'package:ploff/data/service/hive_service/hive_service.dart';
import 'package:ploff/data/service/storage_service/shared_preferences.dart';
import 'package:ploff/screens/tab_box/widgets/global_button.dart';
import 'package:ploff/screens/tab_box/home_screen/sub_screens/meal_detail_screen/widgets/appbar_bottom.dart';
import 'package:ploff/screens/tab_box/home_screen/sub_screens/meal_detail_screen/widgets/inc_dec_buttons.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/constants/const.dart';
import 'package:ploff/utils/helper/helper.dart';
import 'package:ploff/utils/icons/icons.dart';
import 'package:ploff/utils/style/text_style.dart';

class MealDetailScreen extends StatefulWidget {
  const MealDetailScreen({super.key, required this.aboutMeal});
  final CategWithProduct aboutMeal;
  @override
  State<MealDetailScreen> createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  int modifierindex = -1;
  int modifierPrice = 0;
  int price = 0;
  int count = 0;
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
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(.8),
                        ),
                        child: Platform.isAndroid
                            ? const Icon(Icons.arrow_back)
                            : const Icon(Icons.arrow_back_ios),
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
                    child: BlocBuilder<ModifiersCubit, ModifiersState>(
                      builder: (context, state) {
                        if (state.status == FormzStatus.submissionInProgress) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state.status ==
                            FormzStatus.submissionFailure) {
                          return Center(
                            child: Text(state.errorText),
                          );
                        } else {
                          return Column(
                            children: [
                              ...List.generate(
                                state.variants.length,
                                (index) => Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: index != 3 - 1
                                          ? BorderSide(
                                              color: PloffColors.black
                                                  .withOpacity(.1),
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
                                    title: Text(state.variants[index].title.uz),
                                    trailing: Text(Helper.formatSumm(state
                                        .variants[index].outPrice
                                        .toString())),
                                    onTap: () {
                                      setState(() {
                                        modifierindex = index;
                                        modifierPrice =
                                            state.variants[index].outPrice;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          );
                        }
                      },
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
                Row(
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
                              setState(() {
                                if (count > 1) count--;
                                price = count * widget.aboutMeal.outPrice;
                              });
                            },
                          ),
                          Text(
                            "$count",
                            style: PloffTextStyle.w500.copyWith(
                              fontSize: 15,
                            ),
                          ),
                          IncDecButtons(
                            onTap: () {
                              setState(() {
                                count++;
                                price = count * widget.aboutMeal.outPrice;
                              });
                            },
                            imagePath: Plofficons.plus,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Text(
                        Helper.formatSumm((modifierPrice + price).toString()),
                        textAlign: TextAlign.end,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: PloffTextStyle.w600.copyWith(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                GlobalButton(
                  buttonText: "To Cart",
                  onTap: () async {
                    if (count == 0) {
                      Helper.showFailedSnackBar(
                          tr("didnt_enter_product"), context);
                      return;
                    }
                    if (SharedPreferencesService.instance.sharedPreferences
                            .getString("numberPhone") ==
                        null) {
                      Navigator.pushReplacementNamed(
                          context, Constants.enterPhoneNumberScreen);
                    } else {
                      Helper.showSuccesSnackBar(
                          "Product added to cart", context);
                      await HiveService.instance
                          .addProductToStorage(widget.aboutMeal);
                      context
                          .read<BottomNavigationCubit>()
                          .changeBottomNavigationPages(1);
                      context.read<EmptyCartCubit>().notEmpty();
                      Navigator.pop(context);
                    }
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
