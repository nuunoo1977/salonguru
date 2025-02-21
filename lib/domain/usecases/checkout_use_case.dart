import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/errors/failures.dart';
import '../entities/cart_item.dart';
import '../entities/checkout_result.dart';
import '../product_repository.dart';

@injectable
class CheckoutUseCase {
  final ProductRepository _productRepository;

  CheckoutUseCase(this._productRepository);

  Future<Either<Failure, CheckoutResult>> execute(Map<int, int> itemsQty) async {
    return _productRepository.checkout(
        itemsQty.entries.map((e) => CartItem(productId: e.key, quantity: e.value)).toList());
  }
}
