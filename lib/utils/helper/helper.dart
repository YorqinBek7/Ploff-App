import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

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

  static void showSuccesSnackBar(String text, BuildContext context) {
    showTopSnackBar(
      Overlay.of(context)!,
      CustomSnackBar.success(message: text),
    );
  }

  static void showFailedSnackBar(String text, BuildContext context) {
    showTopSnackBar(
      Overlay.of(context)!,
      CustomSnackBar.error(message: text),
    );
  }
}
