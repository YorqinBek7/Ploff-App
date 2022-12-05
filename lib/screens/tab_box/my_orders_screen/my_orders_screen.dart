import 'package:flutter/material.dart';
import 'package:ploff/screens/tab_box/my_orders_screen/widgets/select_orders_button.dart';
import 'package:ploff/screens/tab_box/widgets/custom_app_bar.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/icons/icons.dart';
import 'package:ploff/utils/style/text_style.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  bool isCurrent = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'My Orders',
      ),
      body: Column(
        children: [
          Container(
            color: PloffColors.white,
            padding: const EdgeInsets.all(16),
            child: Container(
              decoration: BoxDecoration(
                color: PloffColors.C_F0F0F0,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SelectOrderInfoButton(
                      onTap: () {
                        setState(() {
                          isCurrent = !isCurrent;
                        });
                      },
                      text: 'Current Orders',
                      isCurrent: !isCurrent,
                    ),
                  ),
                  Expanded(
                    child: SelectOrderInfoButton(
                      onTap: () {
                        setState(() {
                          isCurrent = !isCurrent;
                        });
                      },
                      text: 'History Orders',
                      isCurrent: isCurrent,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          Column(
            children: [
              Image.asset(
                Plofficons.ploffLogo,
                width: 100,
                height: 100,
              ),
              Text(
                "Order unavialable",
                style: PloffTextStyle.w500,
              ),
            ],
          ),
          Spacer()
        ],
      ),
    );
  }
}
