import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ploff/data/service/storage_service/shared_preferences.dart';
import 'package:ploff/screens/tab_box/widgets/global_button.dart';
import 'package:ploff/screens/tab_box/profile_screen/sub_screens/edit_profile_screen/widgets/edit_fields.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/style/text_style.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController controller = TextEditingController();

  final TextEditingController numberController = TextEditingController();

  final TextEditingController dateController = TextEditingController();
  @override
  void initState() {
    numberController.text = SharedPreferencesService.instance.sharedPreferences
        .getString("numberPhone")
        .toString();
    controller.text = "Yorqin";
    dateController.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PloffColors.C_F0F0F0,
      appBar: AppBar(
        title: Text(
          tr("edit_profile"),
          style: PloffTextStyle.w600.copyWith(fontSize: 20.0.sp),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0.h),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10.0.r),
              decoration: const BoxDecoration(
                color: PloffColors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(tr("name")),
                  EditFields(
                    controller: controller,
                    isDisable: true,
                  ),
                  Text(tr("phone_number")),
                  EditFields(
                    controller: numberController,
                    isDisable: false,
                  ),
                  Text(tr("date_of_birth")),
                  GestureDetector(
                    onTap: () => {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => Container(
                          padding: EdgeInsets.all(40.0.r),
                          decoration: const BoxDecoration(color: Colors.white),
                          child: Column(
                            children: [
                              const Text("Select Date"),
                              SfCalendar(
                                view: CalendarView.month,
                                onTap: (calendarTapDetails) => {
                                  dateController.text = DateFormat.yMd()
                                      .format(calendarTapDetails.date!),
                                  Navigator.pop(context),
                                  setState(
                                    () => {},
                                  ),
                                },
                              ),
                            ],
                          ),
                        ),
                      )
                    },
                    child: EditFields(
                      controller: dateController,
                      isDisable: false,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0.w),
              child: GlobalButton(
                buttonText: tr("confirm"),
                onTap: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
