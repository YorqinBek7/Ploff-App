import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ploff/data/service/hive_service/hive_service.dart';
import 'package:ploff/screens/tab_box/my_orders_screen/sub_screens/detail_order_screen.dart';
import 'package:ploff/screens/tab_box/my_orders_screen/widgets/active_order_item.dart';
import 'package:ploff/screens/tab_box/my_orders_screen/widgets/history_order_item.dart';
import 'package:ploff/screens/tab_box/widgets/custom_tab_bar.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/constants/const.dart';
import 'package:ploff/utils/style/text_style.dart';

class MyOrdersScreen extends StatefulWidget {
  MyOrdersScreen({super.key});

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
          tr("my_orders"),
          style: PloffTextStyle.w600.copyWith(fontSize: 20),
        ),
        bottom: CustomTabBar(
          firstTabText: tr("active_orders"),
          secondTabText: tr("history_of_orders"),
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
              Expanded(
                child: ListView.builder(
                  itemCount: HiveService.instance.orderProductsBox.length,
                  itemBuilder: (context, index) => ActiveOrderItem(
                    isVisible: isVisible,
                    onTap: () {
                      Navigator.pushNamed(context, Constants.orderDetail);
                    },
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
