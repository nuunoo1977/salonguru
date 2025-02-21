import 'entities/cart_item.dart';

abstract class CartRepository {
  Stream<List<CartItem>> get watchItems;
  Stream<CartItem?> watchItem(int id);

  void update(CartItem item);

  List<CartItem> getAll();

  CartItem? get(int id);

  void clear(int id);

  void dispose();
}
