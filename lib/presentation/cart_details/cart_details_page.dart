import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../configs/di/injection.dart';
import '../common/cart_bloc/cart_cubit.dart';
import '../common/products_bloc/products_cubit.dart';
import '../common/widgets/body_wrapper.dart';
import '../common/widgets/cart_status_button.dart';
import '../common/widgets/error_message_widget.dart';
import 'cart_checkout_cubit/cart_checkout_cubit.dart';
import 'widgets/cart_details_body.dart';

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
                child: BlocBuilder<ProductsCubit, ProductsState>(
              builder: (BuildContext context, state) => switch (state) {
                Uninitialized() => const Center(
                    child: SizedBox.shrink(),
                  ),
                ProductsLoading() => const Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                ProductsLoadingFailure() => Center(
                    child: ErrorMessageWidget(
                      message: state.messageToUser,
                      onRetry: () => context.read<ProductsCubit>().load(true),
                    ),
                  ),
                ProductsLoaded() => CartDetailsBody(),
              },
            )),
          ),
        ),
      ),
    );
  }
}
