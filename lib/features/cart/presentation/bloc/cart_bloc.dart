import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:simple_commerce/core/core.dart';
import 'package:simple_commerce/features/cart/data/data.dart';
import 'package:simple_commerce/features/cart/domain/domain.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc({
    required this.getAllCarts,
  }) : super(CartInitial()) {
    on<GetAllCartTriggered>(_getAllCartTriggered);
  }

  final GetAllCarts getAllCarts;

  Future<void> _getAllCartTriggered(
    GetAllCartTriggered event,
    Emitter<CartState> emit,
  ) async {
    emit(CartLoadInProgress());
    final result = await getAllCarts();
    switch (result) {
      case Success(value: final allCartResponse):
        emit(GetAllCartSuccess(allCartResponse: allCartResponse));
      case Failure(exception: final exception):
        emit(CartLoadFailure(errorMessage: exception.toString()));
    }
  }
}
