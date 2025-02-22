import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../configs/theme/app_textstyles.dart';
import '../../../domain/entities/product.dart';
import '../../common/cart_bloc/cart_cubit.dart';
import '../../common/products_bloc/products_cubit.dart';
import 'product_cart_tile.dart';

// TODO(nunofelicio): optimize for large lists using CustomScrollView / SliverChildBuilderDelegate

class CartProductsList extends StatelessWidget {
  const CartProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
        builder: (BuildContext context, state) => switch (state) {
              Uninitialized() => const Center(
                  child: SizedBox.shrink(),
                ),
              ProductsLoading() => const Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
              ProductsLoadingFailure() => Center(
                  child: Text(
                    state.messageToUser,
                    textAlign: TextAlign.center,
                    style: AppTextstyles.errorMessage,
                  ),
                ),
              ProductsLoaded() => _productsList(state.products),
            });
  }
}

Widget _productsList(List<Product> products) => BlocBuilder<CartCubit, CartState>(
      buildWhen: (previous, current) =>
          current.totalDistinctProducts != previous.totalDistinctProducts,
      builder: (context, state) {
        if (state.totalItems == 0) {
          return Center(
            child: Text("Your cart is empty",
                style: AppTextstyles.bodyStrongMessage, textAlign: TextAlign.left),
          );
        }
        final productsInCart =
            products.where((e) => ((state as CartLoaded).itemsQty[e.id] ?? 0) > 0).toList();
        return ListView.separated(
          separatorBuilder: (BuildContext context, int index) => const Divider(),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: productsInCart.length,
          itemBuilder: (BuildContext context, int index) {
            return ProductCartTile(
              product: productsInCart[index],
              key: ValueKey(products[index].id),
            );
          },
        );
      },
    );
