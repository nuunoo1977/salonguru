import 'dart:developer' as dev;

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/errors/failures.dart';
import '../../domain/cart_repository.dart';
import 'sources/cart_source.dart';

@Injectable(as: CartRepository)
class CartRepositoryImpl implements CartRepository {
  final CartSource _source;

  CartRepositoryImpl(CartSource source) : _source = source;

  @override
  Future<Either<Failure, Map<int, int>>> load() async {
    try {
      return Right(await _source.load());
    } catch (e) {
      dev.log("CardRepository save: $e");
      return left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, void>> save(Map<int, int> items) async {
    try {
      return Right(await _source.save(items));
    } catch (e) {
      dev.log("CardRepository save: $e");
      return left(UnknownFailure());
    }
  }
}
