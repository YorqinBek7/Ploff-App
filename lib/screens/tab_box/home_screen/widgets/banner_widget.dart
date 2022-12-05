import 'package:flutter/material.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/icons/icons.dart';
import 'package:ploff/utils/style/text_style.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.0,
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: PloffColors.white,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: PloffColors.C_F0F0F0,
        ),
        child: Stack(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      Plofficons.smallPloffLogo,
                      width: 37.0,
                      height: 31.0,
                    ),
                    SizedBox(
                      width: 138,
                      child: Text(
                        "Плов для 5 за 50 тысяч сум",
                        maxLines: 2,
                        style: PloffTextStyle.w400.copyWith(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                Image.asset(
                  Plofficons.meal,
                  width: 148,
                  height: 152,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
