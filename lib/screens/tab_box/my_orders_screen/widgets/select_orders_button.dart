import 'package:flutter/material.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/style/text_style.dart';

class SelectOrderInfoButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool isCurrent;
  const SelectOrderInfoButton({
    Key? key,
    required this.text,
    required this.onTap,
    required this.isCurrent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isCurrent ? PloffColors.white : PloffColors.C_F0F0F0,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: PloffTextStyle.w500,
          ),
        ),
      ),
    );
  }
}
