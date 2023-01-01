import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ploff/data/models/user_locations/user_locations.dart';
import 'package:ploff/data/service/hive_service/hive_service.dart';
import 'package:ploff/screens/tab_box/home_screen/sub_screens/get_location_screen/widgets/mini_text_fields.dart';
import 'package:ploff/screens/tab_box/widgets/global_button.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/helper/helper.dart';
import 'package:ploff/utils/icons/icons.dart';
import 'package:ploff/utils/style/text_style.dart';

class GetLocationScreen extends StatefulWidget {
  const GetLocationScreen({super.key});

  @override
  State<GetLocationScreen> createState() => _GetLocationScreenState();
}

class _GetLocationScreenState extends State<GetLocationScreen> {
  final TextEditingController entranceController = TextEditingController();
  final TextEditingController floorController = TextEditingController();
  final TextEditingController flatController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  Helper helper = Helper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        elevation: 0,
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: PloffColors.C_F0F0F0,
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .55,
            child: Stack(
              children: [
                GoogleMap(
                  onCameraMove: (position) async {
                    helper.placemark = await placemarkFromCoordinates(
                      position.target.latitude,
                      position.target.longitude,
                    );
                    setState(() {});
                  },
                  myLocationEnabled: true,
                  myLocationButtonEnabled: false,
                  zoomControlsEnabled: false,
                  onCameraIdle: () {},
                  initialCameraPosition: CameraPosition(
                    target: LatLng(
                      helper.position?.latitude ?? 41.3775,
                      helper.position?.longitude ?? 63.5853,
                    ),
                    zoom: helper.position != null ? 15 : 5,
                  ),
                ),
                Align(
                    alignment: Alignment.center,
                    child: SvgPicture.asset(Plofficons.location_center))
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * .45,
              padding: EdgeInsets.all(10.0.r),
              decoration: const BoxDecoration(
                color: PloffColors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Container(
                      height: 5.0.h,
                      width: 40.0.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: PloffColors.C_F0F0F0,
                      ),
                    ),
                  ),
                  Text(
                    tr("delivery_address"),
                    style: PloffTextStyle.w600.copyWith(fontSize: 20.sp),
                  ),
                  SizedBox(height: 15.h),
                  Container(
                    padding: EdgeInsets.all(10.0.r),
                    decoration: BoxDecoration(
                      color: PloffColors.C_F0F0F0,
                      borderRadius: BorderRadius.circular(10.0.r),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 5.h),
                    child: TextField(
                      maxLines: null,
                      maxLength: null,
                      decoration: InputDecoration(
                        hintText:
                            "${helper.placemark?[0].administrativeArea}, ${helper.placemark?[0].locality}",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      MiniTextaFields(
                        hintText: tr("entrance"),
                        controller: entranceController,
                      ),
                      MiniTextaFields(
                        hintText: tr("floor"),
                        controller: floorController,
                      ),
                      MiniTextaFields(
                        hintText: tr("flat"),
                        controller: flatController,
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  Container(
                    padding: EdgeInsets.all(10.0.r),
                    decoration: BoxDecoration(
                      color: PloffColors.C_F0F0F0,
                      borderRadius: BorderRadius.circular(10.0.r),
                    ),
                    child: TextField(
                      controller: addressController,
                      decoration: InputDecoration(
                        hintText: tr("address_name"),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const Spacer(),
                  GlobalButton(
                    buttonText: tr("confirm"),
                    onTap: () {
                      if (addressController.text.isEmpty ||
                          (helper.placemark?[0].administrativeArea) == null &&
                              (helper.placemark?[0].locality) == null) {
                        Helper.showFailedSnackBar(
                            tr("please_fill_fields"), context);
                      } else {
                        HiveService.instance.addLocationToStorage(
                          UserLocations(
                            address:
                                (helper.placemark?[0].administrativeArea)! +
                                    (helper.placemark?[0].locality)!,
                            nameLocation: addressController.text,
                          ),
                        );
                        Navigator.pop(context);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
