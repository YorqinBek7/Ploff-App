import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/icons/icons.dart';
import 'package:ploff/utils/style/text_style.dart';

class ProfileOptionsItem extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onTap;
  final bool isDivider;
  const ProfileOptionsItem({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
    required this.isDivider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: isDivider
              ? Border(
                  bottom: BorderSide(
                    color: PloffColors.black.withOpacity(.01),
                  ),
                )
              : null),
      child: ListTile(
        tileColor: PloffColors.white,
        onTap: onTap,
        leading: SvgPicture.asset(icon),
        title: Text(
          title,
          style: PloffTextStyle.w500.copyWith(fontSize: 16),
        ),
        trailing: SvgPicture.asset(Plofficons.arrow_right),
      ),
    );
  }
}
