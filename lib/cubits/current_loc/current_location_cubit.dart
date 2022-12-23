import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ploff/data/service/hive_service/hive_service.dart';

part 'current_location_state.dart';

class CurrentLocationCubit extends Cubit<CurrentLocationState> {
  CurrentLocationCubit()
      : super(
          CurrentLocationState(
              errorText: "",
              currentLocationEnum: CurrentLocationEnum.initialState,
              locationName:
                  HiveService.instance.userLocations.getAt(0)!.nameLocation),
        );
  void changeLocationName({required int index}) {
    emit(state.copyWith(
        currentLocationEnum: CurrentLocationEnum.selectedState,
        locationName:
            HiveService.instance.userLocations.getAt(index)!.nameLocation));
  }
}
