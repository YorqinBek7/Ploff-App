import 'dart:developer';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';

class Helper {
  static final Helper instance = Helper._();
  factory Helper() => instance;
  Helper._();

  static String formatSumm(String summ) {
    return NumberFormat.simpleCurrency(locale: "Uz_uz").format(int.parse(summ));
  }

  Position? position;
  List<Placemark>? placemark;

  Future<void> getLocation() async {
    position = await _determinePosition();
    log(position?.latitude.toString() ?? "asdasda");
    placemark = await placemarkFromCoordinates(
      position!.latitude,
      position!.longitude,
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location service are disabled');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permission are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permission are permanetly denied, we cannot request permission');
    }
    return await Geolocator.getCurrentPosition();
  }
}