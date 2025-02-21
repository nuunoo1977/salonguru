import 'dart:convert';

import 'package:injectable/injectable.dart';

import '../../../configs/environment_values.dart';
import '../../../configs/remote_api_settings.dart';
import '../../common/dio/dio_client.dart';
import '../models/checkout_item_model.dart';
import '../models/products_response_model.dart';
import 'product_source.dart';

// TODO(nunofelicio): Inject the DioClient

@Injectable(as: ProductSource, env: [Environment.prod])
class ProductSourceRemote implements ProductSource {
  final DioClient _dioClient;

  ProductSourceRemote()
      : _dioClient = DioClient(
          apiKey: EnvironmentValues.restApiKey,
          baseUrl: RemoteApiSettings.baseUrl,
          connectTimeout: RemoteApiSettings.connectTimeout,
          sendTimeout: RemoteApiSettings.sendTimeout,
          receiveTimeout: RemoteApiSettings.receiveTimeout,
        );

  @override
  Future<ProductResponseModel> getProducts() async {
    final response = await _dioClient.get<Map<String, dynamic>>(RemoteApiSettings.productsListPath);
    return ProductResponseModel.fromJson(response.data ?? {});
  }

  @override
  Future<void> checkout(List<CheckoutItemModel> items) async {
    final res = await _dioClient.post<Map<String, dynamic>>(
      RemoteApiSettings.checkoutPath,
      data: jsonEncode(items.map((p) => p.toJson()).toList()),
    );
    // TODO(nunofelicio): Remove this workaround afeter response model is implemented
    if (res.data?['statusCode'] != 200) {
      throw Exception();
    }
  }
}
