part of 'get_location_cubit.dart';

class GetLocationState extends Equatable {
  final String error;

  const GetLocationState({required this.error});
  GetLocationState copyWith({
    String? error,
  }) {
    return GetLocationState(
      error: error ?? this.error,
    );
  }

  @override
  List<Object> get props => [
        error,
      ];
}
