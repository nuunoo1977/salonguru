import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../core/errors/failures.dart';
import '../../../domain/entities/checkout_result.dart';
import '../../../domain/usecases/checkout_use_case.dart';
import '../../common/cart_bloc/cart_cubit.dart';
import '../../common/failure_to_user_message_extension.dart';
import '../../common/products_bloc/products_cubit.dart';

part 'cart_checkout_state.dart';

@injectable
class CartCheckoutCubit extends Cubit<CartCheckoutState> {
  final CheckoutUseCase _checkoutUseCase;
  final CartCubit _cartCubit;
  final ProductsCubit _productsCubit;

  CartCheckoutCubit({
    @factoryParam required CartCubit cartCubit,
    @factoryParam required ProductsCubit productsCubit,
    required CheckoutUseCase checkoutUseCase,
  })  : _checkoutUseCase = checkoutUseCase,
        _cartCubit = cartCubit,
        _productsCubit = productsCubit,
        super(CheckoutReady());

  void checkout(Map<int, int> itemsQty) async {
    if (state is MakingCheckout) return;
    emit(MakingCheckout());

    try {
      var res = await _checkoutUseCase.execute(itemsQty);
      res.fold((failure) {
        emit(CheckoutFailure(messageToUser: failure.toUserMessage()));
      }, (result) {
        _cartCubit.clear();
        _productsCubit.load(true);
        emit(CheckoutSuccess(result: result));
      });
    } catch (e) {
      emit(CheckoutFailure(messageToUser: UnknownFailure().toUserMessage()));
    }
  }
}
