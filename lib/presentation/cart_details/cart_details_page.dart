import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../configs/di/injection.dart';
import '../../configs/theme/app_textstyles.dart';
import '../common/cart_bloc/cart_cubit.dart';
import '../common/products_bloc/products_cubit.dart';
import '../common/widgets/body_wrapper.dart';
import '../common/widgets/cart_status_button.dart';
import 'cart_checkout_cubit/cart_checkout_cubit.dart';
import 'widgets/cart_products_list.dart';

final class CartDetailsPage extends StatelessWidget {
  const CartDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CartCheckoutCubit>(
        param1: context.read<CartCubit>(),
        param2: context.read<ProductsCubit>(),
      ),
      child: Builder(
        builder: (context) => PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, _) {
            if (didPop) return;
            if (context.read<CartCheckoutCubit>().state is MakingCheckout) return;
            Navigator.of(context).pop();
          },
          child: Scaffold(
            appBar: AppBar(
              leading: BlocBuilder<CartCheckoutCubit, CartCheckoutState>(
                buildWhen: (previous, current) => current.runtimeType != previous.runtimeType,
                builder: (context, state) {
                  return state is MakingCheckout ? Container() : BackButton();
                },
              ),
              actions: [
                const CartStatusButton(onPressedNavigateToCart: false),
              ],
            ),
            body: BodyWrapper(
              child: BlocConsumer<CartCheckoutCubit, CartCheckoutState>(
                listener: (context, state) {
                  if (state is CheckoutSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Checkout successful!"),
                      ),
                    );
                    Navigator.of(context).pop();
                  }
                },
                builder: (context, checkoutState) {
                  if (checkoutState is MakingCheckout) {
                    return Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  }

                  return BlocBuilder<CartCubit, CartState>(
                    buildWhen: (previous, current) => current.totalItems != previous.totalItems,
                    builder: (context, state) {
                      return SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            CartProductsList(),
                            if (state.totalItems > 0)
                              Padding(
                                padding: const EdgeInsets.only(top: 24.0),
                                child: Center(
                                  child: ElevatedButton.icon(
                                    onPressed: switch (checkoutState) {
                                      MakingCheckout() => null,
                                      CheckoutSuccess() => null,
                                      _ => () => context
                                          .read<CartCheckoutCubit>()
                                          .checkout(state.itemsQty),
                                    },
                                    label: Text("Checkout"),
                                    icon: Icon(Icons.shopping_cart_checkout),
                                  ),
                                ),
                              ),
                            if (checkoutState is CheckoutFailure)
                              Padding(
                                padding: const EdgeInsets.only(top: 24.0),
                                child: Center(
                                  child: Text(
                                    checkoutState.messageToUser,
                                    style: AppTextstyles.errorMessage,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
