part of 'products_cubit.dart';

sealed class ProductsState extends Equatable {
  @override
  List<Object?> get props => [];

  List<Product> get products => [];
}

class Uninitialized extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsLoaded extends ProductsState {
  @override
  final List<Product> products;
  ProductsLoaded({required this.products});

  @override
  List<Object?> get props => [products];
}

class ProductsLoadingFailure extends ProductsState {
  final String messageToUser;
  ProductsLoadingFailure({required this.messageToUser});

  @override
  List<Object?> get props => [messageToUser];
}
