import 'package:flutter/material.dart';
import 'package:ploff/screens/tab_box/cart_screen/check_out_screen/check_out_screen.dart';
import 'package:ploff/screens/tab_box/widgets/auth_button.dart';
import 'package:ploff/screens/tab_box/widgets/custom_app_bar.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/icons/icons.dart';
import 'package:ploff/utils/style/text_style.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PloffColors.C_F0F0F0,
      appBar: const CustomAppBar(
        title: 'Savatcha',
      ),
      body: Column(
        children: [
          // const Spacer(),
          // Column(
          //   children: [
          //     Image.asset(Plofficons.ploffLogo),
          //     const Text("Savatda hali mahsulot yo'q"),
          //   ],
          // ),
          Container(
            height: 100,
            margin: EdgeInsets.symmetric(vertical: 15),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: PloffColors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Image.asset(
                  Plofficons.meal,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("lamba shurpa"),
                    Text("28000"),
                  ],
                ),
                Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(Icons.cancel),
                    Row(
                      children: [
                        Text("-"),
                        Text("0"),
                        Text("+"),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),

          Container(
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
                  style: PloffTextStyle.w500.copyWith(fontSize: 14),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: PloffColors.C_F0F0F0,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "add comment to order",
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Container(
            decoration: BoxDecoration(color: PloffColors.white),
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Order price"),
                    Text("28000"),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                GlobalButton(
                  buttonText: "Mahsulot qo'shing",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
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
