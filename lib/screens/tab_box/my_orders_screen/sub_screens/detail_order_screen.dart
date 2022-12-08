import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ploff/screens/tab_box/cart_screen/check_out_screen/check_out_screen/widgets/check_item.dart';
import 'package:ploff/screens/tab_box/my_orders_screen/sub_screens/widgets/order_detail_texts.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/icons/icons.dart';
import 'package:ploff/utils/style/text_style.dart';

class DetailOrderScreen extends StatelessWidget {
  const DetailOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PloffColors.C_F0F0F0,
      appBar: AppBar(
        title: Text(
          "Order No:1232131",
          style: PloffTextStyle.w600.copyWith(fontSize: 20),
        ),
      ),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 16),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: PloffColors.white,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Order No:123321",
                        style: PloffTextStyle.w600.copyWith(
                          fontSize: 17,
                        ),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          shadowColor: MaterialStateProperty.all(
                            Colors.transparent,
                          ),
                        ),
                        onPressed: () {},
                        child: Text("Order is processed"),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: PloffColors.C_FFCC00,
                        ),
                        child: SvgPicture.asset(Plofficons.done),
                      ),
                      SvgPicture.asset(Plofficons.chef),
                      SvgPicture.asset(Plofficons.car),
                      SvgPicture.asset(Plofficons.flag),
                    ],
                  ),
                  OrderDetailTexts(
                    description: 'Massive',
                    icon: Icons.location_on,
                    title: 'Address',
                  ),
                  OrderDetailTexts(
                    description: 'Massive',
                    icon: Icons.location_on,
                    title: 'Address',
                  ),
                  OrderDetailTexts(
                    description: 'Massive',
                    icon: Icons.location_on,
                    title: 'Address',
                  ),
                  OrderDetailTexts(
                    description: 'Massive',
                    icon: Icons.location_on,
                    title: 'Address',
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: PloffColors.white,
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Courier",
                        style: PloffTextStyle.w600.copyWith(
                          fontSize: 17,
                        ),
                      ),
                      Text(
                        "YorqinBek Yuldashev",
                        style: PloffTextStyle.w400.copyWith(
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  SvgPicture.asset(Plofficons.phone)
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: PloffColors.white,
              ),
              child: Column(
                children: [
                  CheckItem(item: "Osh", price: "23000"),
                  CheckItem(item: "Osh", price: "23000"),
                  CheckItem(item: "Osh", price: "23000"),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
