import 'package:flutter/material.dart';

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
        Text(title),
        RadioListTile(
          title: Text(firstSelect),
          value: firstValue,
          groupValue: firstGroupValue,
          onChanged: firstOnTap,
        ),
        Divider(),
        RadioListTile(
          title: Text(secondSelect),
          value: secondValue,
          groupValue: secondGroupValue,
          onChanged: secondOnTap,
        ),
      ],
    );
  }
}
