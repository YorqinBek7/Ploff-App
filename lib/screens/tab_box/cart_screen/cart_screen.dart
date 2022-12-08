import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ploff/screens/tab_box/cart_screen/check_out_screen/check_out_screen.dart';
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
        actions: [
          InkWell(
              onTap: () => {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Очистить корзину?",
                              style: PloffTextStyle.w600.copyWith(fontSize: 20),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Text(
                              "Вы уверены, что хотите очистить корзину?",
                              style: PloffTextStyle.w400.copyWith(
                                fontSize: 15,
                                color: PloffColors.C_858585,
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () => {
                                      Navigator.pop(context),
                                    },
                                    child: DialogButtons(
                                      color: PloffColors.C_F0F0F0,
                                      text: 'Нет',
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () => {
                                      Navigator.pop(context),
                                    },
                                    child: DialogButtons(
                                      color: PloffColors.C_FFCC00,
                                      text: 'Да',
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  },
              child: SvgPicture.asset(Plofficons.korzina)),
          SizedBox(width: 5)
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 15),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: PloffColors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(
                      Plofficons.meal,
                      width: 88,
                      height: 88,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "lamba shurpa",
                          style: PloffTextStyle.w600.copyWith(fontSize: 17),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "28000",
                          style: PloffTextStyle.w500.copyWith(fontSize: 15),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SvgPicture.asset(Plofficons.cancel),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () => {
                                if (count > 0)
                                  {
                                    count--,
                                  },
                                setState(
                                  () => {},
                                )
                              },
                              child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 8),
                                  padding: EdgeInsets.all(10),
                                  height: 32,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: PloffColors.C_FAFAFA,
                                  ),
                                  child: SvgPicture.asset(Plofficons.minus)),
                            ),
                            Text("$count"),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  count++;
                                });
                              },
                              child: Container(
                                  height: 32,
                                  margin: EdgeInsets.symmetric(horizontal: 8),
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: PloffColors.C_FAFAFA,
                                  ),
                                  child: SvgPicture.asset(Plofficons.plus)),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
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
          const Spacer(),
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
                      style: PloffTextStyle.w500.copyWith(fontSize: 15),
                    ),
                    Text(
                      "28000",
                      style: PloffTextStyle.w500.copyWith(fontSize: 15),
                    ),
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

class DialogButtons extends StatelessWidget {
  final String text;
  final Color color;
  const DialogButtons({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      child: Center(
        child: Text(
          text,
          style: PloffTextStyle.w600.copyWith(fontSize: 15),
        ),
      ),
    );
  }
}
