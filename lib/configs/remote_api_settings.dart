// TODO(nunofelicio): Set settings for each environment using flavours and DI

abstract class RemoteApiSettings {
  static const String baseUrl = 'https://g93902zutc.execute-api.eu-central-1.amazonaws.com';
  static const String productsListPath = '/prod/products';
  static const String checkoutPath = '/prod/checkout';
  static const Duration connectTimeout = Duration(seconds: 15);
  static const Duration sendTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
}
