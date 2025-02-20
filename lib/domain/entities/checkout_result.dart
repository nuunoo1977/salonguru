import 'package:equatable/equatable.dart';

import 'checkout_item.dart';

class CheckoutResult extends Equatable {
  final double totalPrice;
  final List<CheckoutItem> items;

  const CheckoutResult({
    required this.totalPrice,
    required this.items,
  });

  @override
  List<Object?> get props => [totalPrice, items];
}
