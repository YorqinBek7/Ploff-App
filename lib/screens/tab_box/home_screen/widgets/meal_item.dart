import 'package:flutter/material.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/icons/icons.dart';
import 'package:ploff/utils/style/text_style.dart';

class MealItem extends StatelessWidget {
  final String mealName;
  final String mealDescription;
  final String mealPrice;
  const MealItem({
    Key? key,
    required this.mealName,
    required this.mealDescription,
    required this.mealPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: PloffColors.black.withOpacity(.1),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                mealName,
                style: PloffTextStyle.w500.copyWith(fontSize: 15),
              ),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .5,
                child: Text(
                  mealDescription,
                  style: PloffTextStyle.w400.copyWith(
                    color: PloffColors.black.withOpacity(.4),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                mealPrice,
                style: PloffTextStyle.w600.copyWith(fontSize: 16),
              )
            ],
          ),
          Image.asset(
            Plofficons.meal,
            width: 130.0,
            height: 130.0,
          )
        ],
      ),
    );
  }
}
