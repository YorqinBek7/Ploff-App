import 'package:flutter/material.dart';
import 'package:ploff/utils/colors/colors.dart';

class AddressTextFields extends StatelessWidget {
  final bool isEnabled;
  const AddressTextFields({
    Key? key,
    required this.isEnabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: PloffColors.C_F0F0F0,
      ),
      child: TextField(
        enabled: isEnabled,
        decoration: const InputDecoration(
          hintText: "Address",
          border: InputBorder.none,
        ),
      ),
    );
  }
}
