import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final String name;
  final int quantity;
  final double price;
  final String description;
  final String image;

  const Product({
    required this.id,
    required this.name,
    required this.quantity,
    required this.price,
    required this.description,
    required this.image,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        quantity,
        price,
        description,
        image,
      ];
}
