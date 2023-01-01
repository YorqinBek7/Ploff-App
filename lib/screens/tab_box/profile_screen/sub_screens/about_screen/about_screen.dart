import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/constants/const.dart';
import 'package:ploff/utils/icons/icons.dart';
import 'package:ploff/utils/style/text_style.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "About the service",
          style: PloffTextStyle.w600.copyWith(fontSize: 20.0.sp),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0.h),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10.0.r),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0.r),
                color: PloffColors.white,
              ),
              child: Column(
                children: [
                  ListTile(
                    title: const Text("Condensation policy"),
                    trailing: SvgPicture.asset(Plofficons.arrow_right),
                    onTap: () {
                      Navigator.pushNamed(
                          context, Constants.condesationPolicyScreen);
                    },
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text("License agreements"),
                    trailing: SvgPicture.asset(Plofficons.arrow_right),
                    onTap: () {
                      Navigator.pushNamed(context, Constants.licenseScreeen);
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
