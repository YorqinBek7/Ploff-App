import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ploff/data/service/hive_service/hive_service.dart';
import 'package:ploff/screens/tab_box/profile_screen/sub_screens/branches_screen/detail_branch_screen/detail_branch_screen.dart';
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
          style: PloffTextStyle.w600.copyWith(fontSize: 20),
        ),
      ),
      backgroundColor: PloffColors.C_F0F0F0,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                itemCount: HiveService.instance.userLocations.length,
                itemBuilder: (context, index) => Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
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
