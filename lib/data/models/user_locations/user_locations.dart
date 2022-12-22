import 'package:hive_flutter/hive_flutter.dart';

part 'user_locations.g.dart';

@HiveType(typeId: 4)
class UserLocations {
  @HiveField(0)
  final String nameLocation;
  @HiveField(1)
  final String address;
  UserLocations({
    required this.address,
    required this.nameLocation,
  });
}
