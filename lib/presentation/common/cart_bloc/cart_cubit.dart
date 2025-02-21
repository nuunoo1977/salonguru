import 'dart:async';

import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/cart_repository.dart';
import '../../../domain/entities/product.dart';

part 'cart_state.dart';

@injectable
class CartCubit extends Cubit<CartState> {
  static const _saveDebounceDuration = Duration(milliseconds: 200);

  final CartRepository _repository;
  final Map<int, int> _itemsQty = {};
  Timer? _saveDebounce;

  CartCubit({required CartRepository repository})
      : _repository = repository,
        super(CartUninitialized()) {
    _initialize();
  }

  void _initialize() async {
    final res = await _repository.load();
    res.fold(
        (_) => {
              emit(CartLoadingFailure()),
            }, (v) {
      _itemsQty.clear();
      _itemsQty.addAll(v);
      emit(CartLoaded(itemsQty: Map.of(_itemsQty)));
    });
  }

  void updateItem(int productId, int qty) async {
    if (qty == 0) {
      _itemsQty.remove(productId);
    } else {
      _itemsQty[productId] = qty;
    }
    emit(CartLoaded(itemsQty: Map.of(_itemsQty)));
    _saveToRepository();
  }

  void addItem(int productId, [int qty = 1]) =>
      updateItem(productId, (_itemsQty[productId] ?? 0) + qty);

  void removeItem(int productId, [int qty = 1]) =>
      updateItem(productId, (_itemsQty[productId] ?? 0) - qty);

  void clearItem(int productId) => updateItem(productId, 0);

  void clear() {
    _itemsQty.clear();
    emit(CartLoaded(itemsQty: Map.of(_itemsQty)));
    _saveToRepository();
  }

  void _saveToRepository() async {
    if (_saveDebounce?.isActive ?? false) _saveDebounce!.cancel();
    _saveDebounce = Timer(_saveDebounceDuration, () {
      _repository.save(_itemsQty);
    });
  }
}
