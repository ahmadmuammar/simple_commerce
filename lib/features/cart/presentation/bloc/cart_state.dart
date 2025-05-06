part of 'cart_bloc.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class CartLoadInProgress extends CartState {}

class GetAllCartSuccess extends CartState {
  const GetAllCartSuccess({required this.allCartResponse});
  final List<AllCartResponse> allCartResponse;

  @override
  List<Object> get props => [allCartResponse];
}

class GetProductDetailsSuccess extends CartState {
  const GetProductDetailsSuccess({required this.productDetailsResponse});
  final ProductResponse productDetailsResponse;

  @override
  List<Object> get props => [productDetailsResponse];
}

class CartLoadFailure extends CartState {
  const CartLoadFailure({required this.errorMessage});
  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
