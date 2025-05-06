part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class GetAllCartTriggered extends CartEvent {}

class GetProductDetailsPressed extends CartEvent {
  const GetProductDetailsPressed({required this.id});
  final int id;

  @override
  List<Object> get props => [id];
}
