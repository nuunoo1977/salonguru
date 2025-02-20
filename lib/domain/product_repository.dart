import 'package:dartz/dartz.dart';

import '../core/errors/failures.dart';
import 'entities/product.dart';

abstract class ProductRepository {
  // Stream<Either<Failure, List<Product>>> get items;

  Future<Either<Failure, List<Product>>> getAll({bool force = false});

  Future<Either<Failure, Product>> get(int id, {bool force = false});

  // Future<Either<Failure, CheckoutResult>> checkout(List<CartItem> items);
}
