import 'package:dartz/dartz.dart';

import '../core/errors/failures.dart';

abstract class CartRepository {
  Future<Either<Failure, Map<int, int>>> load();
  Future<Either<Failure, void>> save(Map<int, int> items);
}
