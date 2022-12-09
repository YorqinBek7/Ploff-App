import 'package:flutter/material.dart';
import 'package:ploff/utils/style/text_style.dart';

class SelectOptions extends StatelessWidget {
  final String title;
  final String firstSelect;
  final String secondSelect;
  Object? firstValue;
  Object? firstGroupValue;
  Object? secondValue;
  Object? secondGroupValue;
  final ValueChanged firstOnTap;
  final ValueChanged secondOnTap;
  SelectOptions({
    super.key,
    required this.firstGroupValue,
    required this.firstOnTap,
    required this.firstValue,
    required this.secondGroupValue,
    required this.secondValue,
    required this.secondOnTap,
    required this.title,
    required this.firstSelect,
    required this.secondSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: PloffTextStyle.w600.copyWith(fontSize: 17),
        ),
        RadioListTile(
          title: Text(
            firstSelect,
            style: PloffTextStyle.w600.copyWith(fontSize: 15),
          ),
          value: firstValue,
          groupValue: firstGroupValue,
          onChanged: firstOnTap,
        ),
        Divider(),
        RadioListTile(
          title: Text(
            secondSelect,
            style: PloffTextStyle.w600.copyWith(fontSize: 15),
          ),
          value: secondValue,
          groupValue: secondGroupValue,
          onChanged: secondOnTap,
        ),
      ],
    );
  }
}
