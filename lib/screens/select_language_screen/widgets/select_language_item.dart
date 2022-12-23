import 'package:flutter/material.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/style/text_style.dart';

class SelectLanguageItem extends StatelessWidget {
  final String languageText;
  final String flagImage;
  final VoidCallback onTap;
  const SelectLanguageItem({
    Key? key,
    required this.languageText,
    required this.flagImage,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 16),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
          color: PloffColors.C_F7F7F7,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          children: [
            Image.asset(
              flagImage,
              width: 32.0,
              height: 32.0,
            ),
            const SizedBox(width: 12.0),
            Text(
              languageText,
              style: PloffTextStyle.w500.copyWith(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
