import 'dart:async';

import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/subjects.dart';

import '../../domain/cart_repository.dart';
import '../../domain/entities/cart_item.dart';

// TODO(nunofelicio): implement persistence

@Singleton(as: CartRepository)
class CartRepositoryMemory implements CartRepository {
  final BehaviorSubject<List<CartItem>> _itemsStreamControllher = BehaviorSubject.seeded([]);

  List<CartItem> _items = [];

  @disposeMethod
  void dispose() {
    _itemsStreamControllher.close();
  }

  @override
  CartItem? get(int id) => _items.firstWhereOrNull((e) => e.productId == id);

  @override
  List<CartItem> getAll() => _items;

  @override
  Stream<CartItem?> watchItem(int id) => _itemsStreamControllher.stream.transform(
        StreamTransformer.fromHandlers(
          handleData: (data, sink) {
            sink.add(data.firstWhereOrNull((e) => e.productId == id));
          },
        ),
      );

  @override
  Stream<List<CartItem>> get watchItems => _itemsStreamControllher.stream;

  @override
  void update(CartItem item) {
    final index = _items.indexWhere((e) => e.productId == item.productId);
    if (index == -1) {
      if (item.quantity == 0) return;
      _items.add(item);
    } else {
      if (item.quantity == 0) {
        _items.removeAt(index);
      } else {
        _items[index] = item;
      }
    }
    _itemsStreamControllher.add(_items);
  }

  @override
  void clear(int id) {
    _items.clear();
    _itemsStreamControllher.add(_items);
  }
}
