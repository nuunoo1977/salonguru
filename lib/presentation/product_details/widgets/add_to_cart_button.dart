import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/product.dart';
import '../../common/cart_bloc/cart_cubit.dart';

class AddToCartButton extends StatelessWidget {
  final Product product;
  const AddToCartButton({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton.icon(
        onPressed: () => context.read<CartCubit>().addItem(product.id),
        label: Text("Add to cart"),
        icon: Icon(Icons.add),
      ),
    );
  }
}
