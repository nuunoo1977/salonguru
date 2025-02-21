part of 'cart_cubit.dart';

sealed class CartState extends Equatable {
  int itemQty(int productId) => 0;
  int get totalItems => 0;

  @override
  List<Object?> get props => [];
}

class CartUninitialized extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  // TODO(nunofelicio): Fix issue with equatable not comparing maps and remote timestamp when not needed
  final int _timestamp;
  final Map<int, int> itemsQty;
  CartLoaded({required this.itemsQty}) : _timestamp = DateTime.now().millisecondsSinceEpoch;

  @override
  int itemQty(int productId) => itemsQty[productId] ?? 0;
  @override
  int get totalItems => itemsQty.values.fold(0, (prev, qty) => prev + qty);

  @override
  List<Object?> get props => [itemsQty, _timestamp];
}

class CartLoadingFailure extends CartState {}
