import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cart_bloc/cart_cubit.dart';

class CartStatusButton extends StatelessWidget {
  final void Function()? onPressed;
  const CartStatusButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) => BlocBuilder<CartCubit, CartState>(
      buildWhen: (previous, current) => current.totalItems != previous.totalItems,
      builder: (context, state) {
        return Row(
          children: [
            IconButton(
              icon: Badge(
                offset: state.totalItems > 9 ? Offset(-2, 12) : Offset(2, 12),
                isLabelVisible: state.totalItems > 0,
                label: Text(state.totalItems.toString()),
                child: const Icon(Icons.shopping_cart),
              ),
              onPressed: () => onPressed?.call(), // not set directly to onPressed to mantain color
            ),
          ],
        );
      });
}
