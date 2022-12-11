import 'package:flutter/material.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/style/text_style.dart';

class OrderDetailTexts extends StatelessWidget {
  final String title;
  final IconData icon;
  final String description;
  const OrderDetailTexts({
    Key? key,
    required this.title,
    required this.icon,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(icon),
          SizedBox(width: 5),
          Text(
            title,
            style: PloffTextStyle.w400.copyWith(
              fontSize: 15,
              color: PloffColors.C_858585,
            ),
          ),
          Spacer(),
          Text(
            description,
            style: PloffTextStyle.w500.copyWith(
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
