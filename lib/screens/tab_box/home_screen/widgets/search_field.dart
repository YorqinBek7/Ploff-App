import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/style/text_style.dart';

class SearchField extends StatelessWidget {
  final TextEditingController textEditingController;
  final ValueChanged onChanged;
  const SearchField({
    Key? key,
    required this.textEditingController,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3.0.r),
      margin: EdgeInsets.symmetric(horizontal: 10.0.w),
      decoration: BoxDecoration(
        color: PloffColors.C_F5F5F5,
        borderRadius: BorderRadius.circular(8.0.r),
      ),
      child: TextField(
        controller: textEditingController,
        onChanged: onChanged,
        decoration: InputDecoration(
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          prefixIcon: const Icon(Icons.search_outlined),
          hintText: tr("search"),
          hintStyle: PloffTextStyle.w400.copyWith(color: PloffColors.C_858585),
        ),
      ),
    );
  }
}
