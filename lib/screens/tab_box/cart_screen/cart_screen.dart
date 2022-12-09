import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ploff/data/local_database/cached_meals.dart';
import 'package:ploff/data/local_database/local_database.dart';
import 'package:ploff/screens/tab_box/cart_screen/check_out_screen/check_out_screen.dart';
import 'package:ploff/screens/tab_box/cart_screen/check_out_screen/delete_dialog.dart';
import 'package:ploff/screens/tab_box/cart_screen/widgets/carts_item.dart';
import 'package:ploff/screens/tab_box/widgets/auth_button.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/icons/icons.dart';
import 'package:ploff/utils/style/text_style.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<CachedMeals> meals = [];
  @override
  void initState() {
    init();
    super.initState();
  }

  init() async {
    meals = await LocalDataBase.getAllCachedMeals();

    setState(() {});
  }

  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PloffColors.C_F0F0F0,
      appBar: AppBar(
        title: Text(
          "Savatcha",
          style: PloffTextStyle.w600.copyWith(fontSize: 20),
        ),
        scrolledUnderElevation: 0.0,
        actions: [
          InkWell(
            onTap: () => {
              deleteAllDialog(context),
            },
            child: SvgPicture.asset(Plofficons.korzina),
          ),
          const SizedBox(width: 20)
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 15,
                  ),
                ),
                ...List.generate(
                  meals.length,
                  (index) => SliverToBoxAdapter(
                    child: CartsItem(
                      meals: meals,
                      count: count,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 15,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: PloffColors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Add comment",
                          style: PloffTextStyle.w600.copyWith(fontSize: 15),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: PloffColors.C_F0F0F0,
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Add comment to order",
                              hintStyle: PloffTextStyle.w400.copyWith(
                                fontSize: 15,
                                color: PloffColors.C_858585,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 12,
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(color: PloffColors.white),
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Order price",
                      style: PloffTextStyle.w400.copyWith(fontSize: 18),
                    ),
                    Text(
                      NumberFormat.simpleCurrency(locale: "Uz_uz")
                          .format(654678),
                      style: PloffTextStyle.w400.copyWith(fontSize: 18),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                GlobalButton(
                  buttonText: "Mahsulot qo'shing",
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => CheckOutScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
