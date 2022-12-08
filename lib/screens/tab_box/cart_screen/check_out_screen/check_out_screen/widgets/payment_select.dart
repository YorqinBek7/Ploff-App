import 'package:flutter/material.dart';
import 'package:ploff/utils/enum_classes/enum_classes.dart';
import 'package:ploff/utils/colors/colors.dart';

class TypePayment extends StatelessWidget {
  ValueChanged valueChanged;
  Object? paymentType;
  TypePayment({
    super.key,
    required this.valueChanged,
    required this.paymentType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: PloffColors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Тип оплаты"),
          RadioListTile(
              title: const Text("Наличные"),
              value: PaymentType.Cash,
              groupValue: paymentType,
              onChanged: valueChanged),
          const Divider(),
          RadioListTile(
              title: const Text("Payme"),
              value: PaymentType.Payme,
              groupValue: paymentType,
              onChanged: valueChanged),
          const Divider(),
          RadioListTile(
              title: const Text("Click"),
              value: PaymentType.Click,
              groupValue: paymentType,
              onChanged: valueChanged),
        ],
      ),
    );
  }
}
