import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../configs/theme/app_textstyles.dart';
import '../common/products_bloc/products_cubit.dart';
import '../common/widgets/body_wrapper.dart';
import '../common/widgets/cart_status_button.dart';
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
                      child: Text(
                        state.messageToUser,
                        textAlign: TextAlign.center,
                        style: AppTextstyles.errorMessage,
                      ),
                    )
                }),
      ),
    );
  }
}
