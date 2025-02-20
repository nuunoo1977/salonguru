import '../models/products_response_model.dart';

abstract class ProductSource {
  Future<ProductResponseModel> getProducts();
}
