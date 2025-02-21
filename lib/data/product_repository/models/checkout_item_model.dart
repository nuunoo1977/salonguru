import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/cart_item.dart';

part 'checkout_item_model.freezed.dart';
part 'checkout_item_model.g.dart';

@Freezed(toJson: true, fromJson: false)
class CheckoutItemModel with _$CheckoutItemModel {
  const factory CheckoutItemModel({
    @JsonKey(name: 'product_id') required int productId,
    @JsonKey(name: 'quantity') required int quantity,
  }) = _CheckoutItemModel;

  const CheckoutItemModel._();

  factory CheckoutItemModel.fromDomain(CartItem item) => CheckoutItemModel(
        productId: item.productId,
        quantity: item.quantity,
      );
}
