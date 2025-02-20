import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/product.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@Freezed(toJson: false, fromJson: true)
class ProductModel with _$ProductModel {
  const factory ProductModel({
    required int id,
    required String name,
    required int quantity,
    required double price,
    required String description,
    required String image,
  }) = _ProductModel;

  const ProductModel._();

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);

  Product toDomain() => Product(
        id: id,
        name: name,
        quantity: quantity,
        price: price,
        description: description,
        image: image,
      );
}
