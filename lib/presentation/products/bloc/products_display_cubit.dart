import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/product.dart';
import '../../../domain/product_repository.dart';
import '../../common/failure_to_user_message_extension.dart';

part 'products_display_state.dart';

@injectable
class ProductsDisplayCubit extends Cubit<ProductsDisplayState> {
  final ProductRepository _productsRepository;

  ProductsDisplayCubit({required ProductRepository productsRepository})
      : _productsRepository = productsRepository,
        super(Uninitialized());

  void loadOrders([bool ignoreCache = false]) async {
    if (state is ProductsLoading) return;
    emit(ProductsLoading());
    var res = await _productsRepository.getAll(force: ignoreCache);
    res.fold((failure) {
      emit(ProductsLoadingFailure(messageToUser: failure.toUserMessage()));
    }, (products) {
      emit(ProductsLoaded(products: products));
    });
  }
}
