import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ploff/screens/tab_box/my_orders_screen/sub_screens/detail_order_screen.dart';
import 'package:ploff/screens/tab_box/my_orders_screen/widgets/history_order_item.dart';
import 'package:ploff/screens/tab_box/widgets/custom_tab_bar.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/icons/icons.dart';
import 'package:ploff/utils/style/text_style.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen>
    with TickerProviderStateMixin {
  bool isCurrent = false;
  int index = 0;
  late TabController tabController;
  bool isVisible = false;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PloffColors.C_F0F0F0,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'My Orders',
          style: PloffTextStyle.w600.copyWith(fontSize: 20),
        ),
        bottom: CustomTabBar(
          firstTabText: 'Active order',
          secondTabText: 'History Order',
          tabController: tabController,
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          Column(
            children: [
              const SizedBox(
                height: 6,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const DetailOrderScreen(),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  padding: const EdgeInsets.all(16),
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
                            child: const Text("Order is processed"),
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
                            child: Container(
                              height: 2,
                              color: !isVisible
                                  ? PloffColors.C_FFCC00
                                  : PloffColors.C_F0F0F0,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(13),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: PloffColors.C_FFCC00,
                            ),
                            child: SvgPicture.asset(Plofficons.chef),
                          ),
                          Expanded(
                            child: Container(
                              height: 2,
                              color: !isVisible
                                  ? PloffColors.C_FFCC00
                                  : PloffColors.C_F0F0F0,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: PloffColors.C_FAFAFA,
                            ),
                            child: SvgPicture.asset(Plofficons.car),
                          ),
                          Expanded(
                            child: Container(
                              height: 2,
                              color: isVisible
                                  ? PloffColors.C_FFCC00
                                  : PloffColors.C_F0F0F0,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: PloffColors.C_FAFAFA,
                            ),
                            child: SvgPicture.asset(Plofficons.flag),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          Column(
            children: const [
              SizedBox(
                height: 6,
              ),
              HistoryOrderItem(),
              HistoryOrderItem(),
              HistoryOrderItem(),
              SizedBox(
                height: 6,
              ),
            ],
          )
        ],
      ),
    );
  }
}
