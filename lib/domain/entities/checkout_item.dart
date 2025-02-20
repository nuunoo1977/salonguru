import 'product.dart';

class CheckoutItem extends Product {
  final double totalPrice;

  const CheckoutItem({
    required super.id,
    required super.name,
    required super.quantity,
    required super.price,
    required super.description,
    required super.image,
    required this.totalPrice,
  });

  @override
  List<Object?> get props => [...super.props, totalPrice];
}
