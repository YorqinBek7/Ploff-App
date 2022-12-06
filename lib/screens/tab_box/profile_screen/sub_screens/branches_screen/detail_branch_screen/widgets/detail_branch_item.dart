import 'package:flutter/material.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/style/text_style.dart';

class BranchesInfoItem extends StatelessWidget {
  final IconData icon;
  final String info;
  final String title;
  const BranchesInfoItem({
    Key? key,
    required this.icon,
    required this.info,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(
            icon,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: PloffTextStyle.w400.copyWith(
              color: PloffColors.black.withOpacity(.5),
            ),
          ),
          const Spacer(),
          Expanded(
            flex: 2,
            child: Text(
              info,
              textAlign: TextAlign.end,
              style: PloffTextStyle.w500.copyWith(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
