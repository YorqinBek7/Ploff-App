import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ploff/main.dart';
import 'package:ploff/screens/tab_box/home_screen/sub_screens/get_location_screen/widgets/mini_text_fields.dart';
import 'package:ploff/screens/tab_box/widgets/auth_button.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/icons/icons.dart';
import 'package:ploff/utils/style/text_style.dart';

class GetLocationScreen extends StatefulWidget {
  final Position position;
  List<Placemark> placemark;

  GetLocationScreen(
      {super.key, required this.position, required this.placemark});

  @override
  State<GetLocationScreen> createState() => _GetLocationScreenState();
}

class _GetLocationScreenState extends State<GetLocationScreen> {
  final TextEditingController entranceController = TextEditingController();
  final TextEditingController floorController = TextEditingController();
  final TextEditingController flatController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

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
                    widget.placemark = await placemarkFromCoordinates(
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
                      widget.position.latitude,
                      widget.position.longitude,
                    ),
                    zoom: 20,
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
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: PloffColors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Container(
                      height: 5,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: PloffColors.C_F0F0F0,
                      ),
                    ),
                  ),
                  Text(
                    "Delivery Address",
                    style: PloffTextStyle.w600.copyWith(fontSize: 20),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: PloffColors.C_F0F0F0,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: TextField(
                      maxLines: null,
                      maxLength: null,
                      decoration: InputDecoration(
                        hintText:
                            "${widget.placemark[0].administrativeArea}, ${widget.placemark[0].street}",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      MiniTextaFields(
                        hintText: "Entrance",
                        controller: entranceController,
                      ),
                      MiniTextaFields(
                        hintText: "Floor",
                        controller: floorController,
                      ),
                      MiniTextaFields(
                        hintText: "Flat",
                        controller: flatController,
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: PloffColors.C_F0F0F0,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: addressController,
                      decoration: const InputDecoration(
                        hintText: "Adress name",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const Spacer(),
                  GlobalButton(
                    buttonText: "Confirm",
                    onTap: () {},
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
