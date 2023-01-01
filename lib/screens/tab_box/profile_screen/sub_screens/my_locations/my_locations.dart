import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ploff/data/service/hive_service/hive_service.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/icons/icons.dart';
import 'package:ploff/utils/style/text_style.dart';

class MyLocations extends StatelessWidget {
  const MyLocations({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Locations",
          style: PloffTextStyle.w600.copyWith(fontSize: 20.0.sp),
        ),
      ),
      backgroundColor: PloffColors.C_F0F0F0,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0.h),
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                itemCount: HiveService.instance.userLocations.length,
                itemBuilder: (context, index) => Container(
                  padding: EdgeInsets.symmetric(vertical: 10.0.h),
                  margin: EdgeInsets.symmetric(vertical: 4.0.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0.r),
                    color: PloffColors.white,
                  ),
                  child: ListTile(
                    tileColor: PloffColors.C_F0F0F0,
                    leading: SvgPicture.asset(Plofficons.location_center),
                    title: Text(HiveService.instance.userLocations
                        .getAt(index)!
                        .nameLocation),
                    subtitle: Text(HiveService.instance.userLocations
                        .getAt(index)!
                        .address),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
