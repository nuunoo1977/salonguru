part of 'cart_checkout_cubit.dart';

sealed class CartCheckoutState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckoutReady extends CartCheckoutState {}

class MakingCheckout extends CartCheckoutState {}

class CheckoutSuccess extends CartCheckoutState {
  final CheckoutResult result;
  CheckoutSuccess({required this.result});

  @override
  List<Object?> get props => [result];
}

class CheckoutFailure extends CartCheckoutState {
  final String messageToUser;
  CheckoutFailure({required this.messageToUser});

  @override
  List<Object?> get props => [messageToUser];
}
