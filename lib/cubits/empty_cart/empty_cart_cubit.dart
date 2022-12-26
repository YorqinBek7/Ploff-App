import 'package:flutter_bloc/flutter_bloc.dart';

part 'empty_cart_state.dart';

class EmptyCartCubit extends Cubit<EmptyCartState> {
  EmptyCartCubit() : super(EmptyCartEmpty());

  void notEmpty() => emit(EmptyCartNoEmpty());
  void empty() => emit(EmptyCartEmpty());
}
