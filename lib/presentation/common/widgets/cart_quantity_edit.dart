import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../configs/theme/app_textstyles.dart';
import '../../../domain/entities/product.dart';
import '../cart_bloc/cart_cubit.dart';

class CartQuantityEdit extends StatelessWidget {
  final Product product;

  final int qty;
  const CartQuantityEdit({
    super.key,
    required this.product,
    required this.qty,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton.filled(
          icon: Icon(Icons.remove),
          onPressed: () => context.read<CartCubit>().removeItem(product.id, 1),
        ),
        ConstrainedBox(
          constraints: BoxConstraints(minWidth: 50),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                qty.toString(),
                style: AppTextstyles.productDetailsQty,
              ),
            ),
          ),
        ),
        IconButton.filled(
          icon: Icon(Icons.add),
          onPressed:
              qty < product.quantity ? () => context.read<CartCubit>().addItem(product.id) : null,
        ),
      ],
    );
  }
}
