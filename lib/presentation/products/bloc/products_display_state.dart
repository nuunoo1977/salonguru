part of 'products_display_cubit.dart';

sealed class ProductsDisplayState extends Equatable {
  @override
  List<Object?> get props => [];
}

class Uninitialized extends ProductsDisplayState {}

class ProductsLoading extends ProductsDisplayState {}

class ProductsLoaded extends ProductsDisplayState {
  final List<Product> products;
  ProductsLoaded({required this.products});
}

class ProductsLoadingFailure extends ProductsDisplayState {
  final String messageToUser;
  ProductsLoadingFailure({required this.messageToUser});
}
