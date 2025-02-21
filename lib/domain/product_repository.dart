import 'package:dartz/dartz.dart';

import '../core/errors/failures.dart';
import 'entities/cart_item.dart';
import 'entities/checkout_result.dart';
import 'entities/product.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getAll({bool force = false});

  Future<Either<Failure, CheckoutResult>> checkout(List<CartItem> items);
}
