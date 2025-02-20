import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/product.dart';
import 'product_model.dart';

part 'products_response_model.freezed.dart';
part 'products_response_model.g.dart';

@Freezed(toJson: false, fromJson: true)
class ProductResponseModel with _$ProductResponseModel {
  const factory ProductResponseModel({
    required int statusCode,
    required List<ProductModel> products,
  }) = _ProductResponseModel;

  const ProductResponseModel._();

  factory ProductResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseModelFromJson(json);

  List<Product> toDomain() {
    if (statusCode != 200) throw Exception('Invalid statusCode ($statusCode)');
    return products.map((e) => e.toDomain()).toList();
  }
}
