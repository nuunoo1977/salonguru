import 'dart:developer' as dev;

import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../core/errors/failures.dart';
import '../../domain/entities/product.dart';
import '../../domain/product_repository.dart';
import '../common/exceptions/http_exception.dart';
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
  Future<Either<Failure, Product>> get(int id, {bool force = false}) async {
    final resGetAll = await getAll(force: force);
    return resGetAll.fold(
      (l) => left(l),
      (p) {
        final product = _cachedProducts!.firstWhereOrNull((e) => e.id == id);
        return product != null ? right(product) : left(NotFound());
      },
    );
  }

  // Future<Either<Failure, CheckoutResult>> checkout(List<CartItem> items) {}

  Future<Either<Failure, T>> _tryAndMapFailures<T>(Future<Either<Failure, T>> Function() f) async {
    try {
      return await f();
    } on DioException catch (e) {
      dev.log("$e");
      return switch (e.error) {
        ConnectionTimeoutException() => left(ConnectionFailure()),
        SendTimeoutException() => left(ConnectionFailure()),
        ReceiveTimeoutException() => left(ConnectionFailure()),
        _ => left(ServerFailure()),
      };
    } catch (e) {
      dev.log("$e");
      return left(UnknownFailure());
    }
  }
}
