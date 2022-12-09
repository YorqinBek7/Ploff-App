import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ploff/screens/tab_box/home_screen/sub_screens/get_location_screen/get_location_screen.dart';
import 'package:ploff/screens/tab_box/widgets/auth_button.dart';
import 'package:ploff/utils/style/text_style.dart';

Future<dynamic> BottomDialog(BuildContext context, List<int> numbers,
    Object? _address, Position position, List<Placemark> placemark) {
  return showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
    ),
    builder: (context) => StatefulBuilder(
      builder: (context, setState) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Text(
                "Мои адреса",
                style: PloffTextStyle.w600.copyWith(fontSize: 20),
              ),
            ),
            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                children: [
                  ...List.generate(
                    5,
                    (index) => RadioListTile(
                      subtitle: Text("qwerty"),
                      value: numbers[index],
                      title: Text("Qwerty"),
                      groupValue: _address,
                      onChanged: (value) {
                        setState(
                          () => {
                            _address = value,
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: GlobalButton(
                buttonText: "Add address",
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => GetLocationScreen(
                        position: position,
                        placemark: placemark,
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        );
      },
    ),
  );
}
