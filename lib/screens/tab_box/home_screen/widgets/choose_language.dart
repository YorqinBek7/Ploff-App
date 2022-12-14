import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ploff/cubits/current_loc/current_location_cubit.dart';
import 'package:ploff/data/service/hive_service/hive_service.dart';
import 'package:ploff/data/service/storage_service/shared_preferences.dart';
import 'package:ploff/screens/tab_box/widgets/global_button.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/constants/const.dart';
import 'package:ploff/utils/style/text_style.dart';

Future<dynamic> chooseLocation(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10.0.r),
        topRight: Radius.circular(10.0.r),
      ),
    ),
    builder: (context) => StatefulBuilder(builder: (context, setState) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Text(
              tr("my_locations"),
              style: PloffTextStyle.w600.copyWith(fontSize: 20.0.sp),
            ),
          ),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              children: [
                ...List.generate(
                  HiveService.instance.userLocations.length,
                  (index) => ListTile(
                    leading: SharedPreferencesService.instance.sharedPreferences
                                .getInt("current_loc_index") ==
                            index
                        ? const Icon(
                            Icons.radio_button_checked,
                            color: PloffColors.C_FFCC00,
                          )
                        : const Icon(Icons.radio_button_off_outlined),
                    subtitle: Text(
                      HiveService.instance.userLocations.getAt(index)!.address,
                    ),
                    title: Text(HiveService.instance.userLocations
                        .getAt(index)!
                        .nameLocation),
                    onTap: () => {
                      setState(
                        () => {
                          SharedPreferencesService.instance.sharedPreferences
                              .setInt("current_loc_index", index),
                          context
                              .read<CurrentLocationCubit>()
                              .changeLocationName(index: index)
                        },
                      )
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0.r),
            child: GlobalButton(
              buttonText: tr("add_location"),
              onTap: () {
                Navigator.pushNamed(context, Constants.getLocationScreen);
              },
            ),
          )
        ],
      );
    }),
  );
}
