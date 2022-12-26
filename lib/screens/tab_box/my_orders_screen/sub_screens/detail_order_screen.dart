import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ploff/data/service/hive_service/hive_service.dart';
import 'package:ploff/screens/tab_box/cart_screen/check_out_screen/widgets/check_item.dart';
import 'package:ploff/screens/tab_box/my_orders_screen/sub_screens/widgets/order_detail_texts.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/icons/icons.dart';
import 'package:ploff/utils/style/text_style.dart';

class DetailOrderScreen extends StatelessWidget {
  final int orderIndex;
  const DetailOrderScreen({super.key, required this.orderIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PloffColors.C_F0F0F0,
      appBar: AppBar(
        title: Text(
          "${tr("orderNo")} No:1232131",
          style: PloffTextStyle.w600.copyWith(fontSize: 20),
        ),
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 16),
              padding: const EdgeInsets.all(16.0),
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
                        "${tr("orderNo")} No:123321",
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
                        child: Text(
                          tr("order_in_process"),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: PloffColors.C_FFCC00,
                        ),
                        child: SvgPicture.asset(Plofficons.done),
                      ),
                      Expanded(
                        child: Visibility(
                          visible: true,
                          child: Container(
                            height: 2,
                            color: PloffColors.C_FFCC00,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: PloffColors.C_FFCC00,
                        ),
                        child: SvgPicture.asset(Plofficons.chef),
                      ),
                      Expanded(
                        child: Visibility(
                          visible: false,
                          child: Container(
                            height: 2,
                            color: PloffColors.C_FFCC00,
                          ),
                        ),
                      ),
                      Container(
                          padding: const EdgeInsets.all(16),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: PloffColors.C_F0F0F0,
                          ),
                          child: SvgPicture.asset(Plofficons.car)),
                      Expanded(
                        child: Visibility(
                          visible: false,
                          child: Container(
                            height: 2,
                            color: PloffColors.C_FFCC00,
                          ),
                        ),
                      ),
                      Container(
                          padding: const EdgeInsets.all(16),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: PloffColors.C_F0F0F0,
                          ),
                          child: SvgPicture.asset(Plofficons.flag)),
                    ],
                  ),
                  OrderDetailTexts(
                    description: HiveService.instance.orderProductsBox
                        .getAt(orderIndex)!
                        .address,
                    icon: Icons.location_on,
                    title: tr("address"),
                  ),
                  OrderDetailTexts(
                    description: HiveService.instance.orderProductsBox
                        .getAt(orderIndex)!
                        .time,
                    icon: Icons.location_on,
                    title: tr('time'),
                  ),
                  OrderDetailTexts(
                    description: HiveService.instance.orderProductsBox
                        .getAt(orderIndex)!
                        .date,
                    icon: Icons.location_on,
                    title: tr('date'),
                  ),
                  OrderDetailTexts(
                    description: HiveService.instance.orderProductsBox
                        .getAt(orderIndex)!
                        .paymentType,
                    icon: Icons.location_on,
                    title: tr('payment_type'),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(16),
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
                        tr('courier'),
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
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: PloffColors.C_F0F0F0,
                    ),
                    child: SvgPicture.asset(Plofficons.phone),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: PloffColors.white,
              ),
              child: Column(
                children: [
                  ...List.generate(
                    HiveService.instance.orderProductsBox
                        .getAt(orderIndex)!
                        .orderedProducts
                        .length,
                    (index) => Column(
                      children: [
                        const SizedBox(height: 5),
                        CheckItem(
                            item: HiveService.instance.orderProductsBox
                                .getAt(orderIndex)!
                                .orderedProducts[index]
                                .title
                                .uz,
                            price: HiveService.instance.orderProductsBox
                                .getAt(orderIndex)!
                                .orderedProducts[index]
                                .outPrice
                                .toString()),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
