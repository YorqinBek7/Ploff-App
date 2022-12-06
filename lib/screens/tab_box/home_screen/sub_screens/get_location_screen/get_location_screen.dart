import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ploff/screens/tab_box/widgets/auth_button.dart';
import 'package:ploff/utils/colors/colors.dart';
import 'package:ploff/utils/style/text_style.dart';

class GetLocationScreen extends StatelessWidget {
  const GetLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PloffColors.C_F0F0F0,
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: CustomScrollView(
              physics: NeverScrollableScrollPhysics(),
              slivers: [
                SliverAppBar(
                  pinned: true,
                  expandedHeight: MediaQuery.of(context).size.height * .6,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                      children: [
                        GoogleMap(
                          markers: {
                            Marker(
                              markerId: MarkerId(
                                "value",
                              ),
                            ),
                          },
                          onCameraIdle: () {},
                          initialCameraPosition: CameraPosition(
                            target: LatLng(41, 69),
                            zoom: 10,
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.location_on_outlined,
                            size: 40,
                            color: PloffColors.red,
                          ),
                        )
                      ],
                    ),
                  ),
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back),
                  ),
                  bottom: BottomAppBar(),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: PloffColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "data",
                    style: PloffTextStyle.w600.copyWith(fontSize: 20),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: PloffColors.C_F0F0F0,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      MiniTextaFields(hintText: "hintText"),
                      MiniTextaFields(hintText: "hintText"),
                      MiniTextaFields(hintText: "hintText"),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: PloffColors.C_F0F0F0,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "asdqwe",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Spacer(),
                  GlobalButton(
                    buttonText: "asdasd",
                    onTap: () {},
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomAppBar extends StatelessWidget implements PreferredSize {
  const BottomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: PloffColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 10);
}

class MiniTextaFields extends StatelessWidget {
  final String hintText;

  const MiniTextaFields({
    Key? key,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: PloffColors.C_F0F0F0,
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: TextField(
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
