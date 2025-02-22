import 'dart:developer' as dev;

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/errors/failures.dart';
import '../../domain/entities/cart_item.dart';
import '../../domain/entities/checkout_result.dart';
import '../../domain/entities/product.dart';
import '../../domain/product_repository.dart';
import '../common/exceptions/http_exception.dart';
import '../common/exceptions/http_exception_to_failure_extension.dart';
import 'models/checkout_item_model.dart';
import 'sources/product_source.dart';

@Singleton(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  final ProductSource _source;
  List<Product>? _cachedProducts;

  ProductRepositoryImpl(ProductSource source) : _source = source;

  @override
  Future<Either<Failure, List<Product>>> getAll({bool force = false}) async {
    if (!force && _cachedProducts != null) return Right(_cachedProducts!);

    return _tryAndMapFailures(() async {
      final response = await _source.getProducts();
      _cachedProducts = response.toDomain();
      return Right(_cachedProducts!);
    });
  }

  @override
  Future<Either<Failure, CheckoutResult>> checkout(List<CartItem> items) async {
    // TODO(nunofelicio): Implement the process of the checkout response
    return _tryAndMapFailures(() async {
      await _source.checkout(
        items.map((e) => CheckoutItemModel.fromDomain(e)).toList(),
      );
      return Right(CheckoutResult(items: [], totalPrice: 0));
    });
  }

  Future<Either<Failure, T>> _tryAndMapFailures<T>(Future<Either<Failure, T>> Function() f) async {
    try {
      return await f();
    } on HttpException catch (e) {
      dev.log("$e");
      return left(e.toFailure());
    } catch (e) {
      dev.log("$e");
      return left(UnknownFailure());
    }
  }
}
