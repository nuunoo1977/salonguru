import 'dart:convert';

import 'package:injectable/injectable.dart';

import '../mocks/json_mock_products_list_ok.dart';
import '../models/checkout_item_model.dart';
import '../models/products_response_model.dart';
import 'product_source.dart';

@Injectable(as: ProductSource, env: [Environment.dev])
class ProductSourceMock implements ProductSource {
  ProductSourceMock();

  @override
  Future<ProductResponseModel> getProducts() async {
    await Future.delayed(const Duration(seconds: 2));
    return ProductResponseModel.fromJson(jsonDecode(jsonMockProductsListOk));
  }

  @override
  Future<void> checkout(List<CheckoutItemModel> items) async {
    await Future.delayed(const Duration(seconds: 2));
  }
}
