import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/icons/icons.dart';
import 'package:ploff/utils/style/text_style.dart';

class HistoryOrderItem extends StatelessWidget {
  const HistoryOrderItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: PloffColors.white,
      ),
      child: Row(
        children: [
          SizedBox(width: 10),
          Column(
            children: [
              Text(
                "Заказ №341",
                style: PloffTextStyle.w600
                    .copyWith(fontSize: 17, color: PloffColors.black),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "85 000 сум",
                style: PloffTextStyle.w600
                    .copyWith(fontSize: 17, color: PloffColors.C_858585),
              ),
            ],
          ),
          Spacer(),
          Column(
            children: [
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      PloffColors.C_22C348.withOpacity(.1),
                    ),
                    shadowColor: MaterialStateProperty.all(Colors.transparent),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Ordered",
                    style: PloffTextStyle.w500
                        .copyWith(fontSize: 15, color: PloffColors.C_22C348),
                  )),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SvgPicture.asset(Plofficons.calender),
                  SizedBox(width: 5),
                  Text(
                    "11.05.2022",
                    style: PloffTextStyle.w400.copyWith(fontSize: 15),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(width: 10),
        ],
      ),
    );
  }
}
