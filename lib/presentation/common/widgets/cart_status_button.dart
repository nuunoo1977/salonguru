import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/double_extensions.dart';
import '../../cart_details/cart_details_page.dart';
import '../cart_bloc/cart_cubit.dart';
import '../products_bloc/products_cubit.dart';

class CartStatusButton extends StatelessWidget {
  final bool onPressedNavigateToCart;
  const CartStatusButton({super.key, this.onPressedNavigateToCart = true});

  @override
  Widget build(BuildContext context) => BlocBuilder<ProductsCubit, ProductsState>(
        buildWhen: (previous, current) => current.products != previous.products,
        builder: (context, stateProducts) {
          return BlocBuilder<CartCubit, CartState>(
              buildWhen: (previous, current) => current.totalItems != previous.totalItems,
              builder: (context, state) {
                return Row(
                  children: [
                    Text(state.totalPrice(stateProducts.products).toStringEuros),
                    IconButton(
                        icon: Badge(
                          offset: state.totalItems > 9 ? Offset(-2, 12) : Offset(2, 12),
                          isLabelVisible: state.totalItems > 0,
                          label: Text(state.totalItems.toString()),
                          child: const Icon(Icons.shopping_cart),
                        ),
                        onPressed: () {
                          if (!onPressedNavigateToCart) return;
                          Navigator.of(context).popUntil((route) => route.isFirst);
                          MaterialPageRoute(
                            builder: (context) => CartDetailsPage(),
                          );
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => CartDetailsPage(),
                            ),
                          );
                        }),
                  ],
                );
              });
        },
      );
}
