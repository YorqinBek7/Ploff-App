part of 'current_location_cubit.dart';

enum CurrentLocationEnum {
  initialState,
  selectedState,
}

class CurrentLocationState extends Equatable {
  final String errorText;
  final String locationName;
  final CurrentLocationEnum currentLocationEnum;
  const CurrentLocationState({
    required this.errorText,
    required this.currentLocationEnum,
    required this.locationName,
  });

  CurrentLocationState copyWith({
    String? errorText,
    CurrentLocationEnum? currentLocationEnum,
    String? locationName,
  }) =>
      CurrentLocationState(
        errorText: errorText ?? this.errorText,
        currentLocationEnum: currentLocationEnum ?? this.currentLocationEnum,
        locationName: locationName ?? this.locationName,
      );
  @override
  List<Object> get props => [errorText, currentLocationEnum, locationName];
}
