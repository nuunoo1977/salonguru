import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../common/cart_bloc/cart_cubit.dart';
import '../common/widgets/body_wrapper.dart';
import '../common/widgets/cart_status_button.dart';
import 'widgets/cart_products_list.dart';

final class CartDetailsPage extends StatelessWidget {
  const CartDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        actions: [
          const CartStatusButton(onPressedNavigateToCart: false),
        ],
      ),
      body: BodyWrapper(
        child: BlocBuilder<CartCubit, CartState>(
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
                          onPressed: () => {},
                          label: Text("Checkout"),
                          icon: Icon(Icons.shopping_cart_checkout),
                        ),
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
