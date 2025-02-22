import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../common/products_bloc/products_cubit.dart';
import '../common/widgets/body_wrapper.dart';
import '../common/widgets/cart_status_button.dart';
import '../common/widgets/error_message_widget.dart';
import 'widgets/products_list.dart';

final class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Salonguru Shop'),
        actions: [
          const CartStatusButton(),
        ],
      ),
      body: BodyWrapper(
        child: BlocBuilder<ProductsCubit, ProductsState>(
            builder: (context, state) => switch (state) {
                  Uninitialized() => const Center(
                      child: SizedBox.shrink(),
                    ),
                  ProductsLoading() => const Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
                  ProductsLoaded() => ProductsList(products: state.products),
                  ProductsLoadingFailure() => Center(
                      child: ErrorMessageWidget(
                        message: state.messageToUser,
                        onRetry: () => context.read<ProductsCubit>().load(true),
                      ),
                    ),
                }),
      ),
    );
  }
}
