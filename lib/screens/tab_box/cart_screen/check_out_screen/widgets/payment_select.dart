import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ploff/utils/enum_classes/enum_classes.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/style/text_style.dart';

class TypePayment extends StatelessWidget {
  final ValueChanged valueChanged;
  final Object? paymentType;
  const TypePayment({
    super.key,
    required this.valueChanged,
    required this.paymentType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0.h),
      padding: EdgeInsets.all(16.0.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0.r),
        color: PloffColors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Тип оплаты",
            style: PloffTextStyle.w600.copyWith(fontSize: 17.0.sp),
          ),
          RadioListTile(
              title: Text(
                "Наличные",
                style: PloffTextStyle.w600.copyWith(fontSize: 15.0.sp),
              ),
              value: PaymentType.Cash,
              groupValue: paymentType,
              onChanged: valueChanged),
          const Divider(),
          RadioListTile(
              title: Text(
                "Payme",
                style: PloffTextStyle.w600.copyWith(fontSize: 15.0.sp),
              ),
              value: PaymentType.Payme,
              groupValue: paymentType,
              onChanged: valueChanged),
          const Divider(),
          RadioListTile(
            title: Text(
              "Click",
              style: PloffTextStyle.w600.copyWith(fontSize: 15.0.sp),
            ),
            value: PaymentType.Click,
            groupValue: paymentType,
            onChanged: valueChanged,
          ),
        ],
      ),
    );
  }
}
