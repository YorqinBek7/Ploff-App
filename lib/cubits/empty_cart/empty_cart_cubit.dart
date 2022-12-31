import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ploff/data/service/hive_service/hive_service.dart';

part 'empty_cart_state.dart';

class EmptyCartCubit extends Cubit<EmptyCartState> {
  EmptyCartCubit() : super(EmptyCartEmpty());

  void notEmpty() => emit(EmptyCartNoEmpty());
  void empty() async {
    await HiveService.instance.clearCarts();
    emit(EmptyCartEmpty());
  }
}
