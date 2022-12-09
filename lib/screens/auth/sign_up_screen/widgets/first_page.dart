import 'package:flutter/material.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/style/text_style.dart';

class FistPage extends StatelessWidget {
  final TextEditingController phoneController;
  final GlobalKey<FormState> formKey;

  const FistPage({
    required this.phoneController,
    required this.formKey,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Номер телефона",
          style: PloffTextStyle.w400.copyWith(fontSize: 15),
        ),
        Form(
          key: formKey,
          child: TextFormField(
            autovalidateMode: AutovalidateMode.always,
            controller: phoneController,
            style: PloffTextStyle.w500.copyWith(fontSize: 15),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Enter something";
              }
              return null;
            },
            decoration: InputDecoration(
              filled: true,
              focusColor: PloffColors.C_FFCC00,
              prefixIcon: Text(
                " +998 ",
                style: PloffTextStyle.w500.copyWith(fontSize: 15),
              ),
              prefixIconConstraints: BoxConstraints(
                maxHeight: 60,
                maxWidth: 60,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
