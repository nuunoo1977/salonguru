import '../models/checkout_item_model.dart';
import '../models/products_response_model.dart';

abstract class ProductSource {
  Future<ProductResponseModel> getProducts();
  Future<void> checkout(List<CheckoutItemModel> items);
}
