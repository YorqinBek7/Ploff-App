import 'package:flutter/material.dart';
import 'package:ploff/utils/colors/colors.dart';

class EditFields extends StatelessWidget {
  final TextEditingController controller;
  final bool isDisable;

  const EditFields({
    Key? key,
    required this.controller,
    required this.isDisable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: PloffColors.C_F0F0F0,
      ),
      child: TextField(
        enabled: isDisable,
        controller: controller,
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
      ),
    );
  }
}
