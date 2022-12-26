import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ploff/utils/colors/colors.dart';

class AddressTextFields extends StatelessWidget {
  final bool isEnabled;
  final TextEditingController addressController;
  const AddressTextFields(
      {Key? key, required this.isEnabled, required this.addressController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: PloffColors.C_F0F0F0,
      ),
      child: TextField(
        controller: addressController,
        enabled: isEnabled,
        decoration: InputDecoration(
          hintText: tr('address'),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
