part of 'cart_cubit.dart';

sealed class CartState extends Equatable {
  int itemQty(int productId) => 0;
  int get totalItems => 0;
  int get totalDistinctProducts => 0;
  double totalPrice(List<Product> products) => 0.0;
  Map<int, int> get itemsQty => {};

  @override
  List<Object?> get props => [];
}

class CartUninitialized extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  // TODO(nunofelicio): Fix issue with equatable not comparing maps and remove timestamp when not needed
  final int _timestamp;
  @override
  final Map<int, int> itemsQty;
  CartLoaded({required this.itemsQty}) : _timestamp = DateTime.now().millisecondsSinceEpoch;

  @override
  int itemQty(int productId) => itemsQty[productId] ?? 0;

  @override
  int get totalItems => itemsQty.values.fold(0, (prev, qty) => prev + qty);

  @override
  double totalPrice(List<Product> products) => itemsQty.entries.fold(
      0.0,
      (prev, item) =>
          prev + item.value * (products.firstWhereOrNull((e) => e.id == item.key)?.price ?? 0));

  @override
  int get totalDistinctProducts => itemsQty.length;

  @override
  List<Object?> get props => [itemsQty, _timestamp];
}

class CartLoadingFailure extends CartState {}
