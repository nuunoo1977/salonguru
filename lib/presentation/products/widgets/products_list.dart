import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/product.dart';
import '../../common/cart_bloc/cart_cubit.dart';
import '../bloc/products_display_cubit.dart';
import 'product_card.dart';

// TODO(nunofelicio): make grid responsive for different screen orientations

class ProductsList extends StatelessWidget {
  final List<Product> products;
  const ProductsList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => context.read<ProductsDisplayCubit>().loadOrders(true),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 0,
          //childAspectRatio: 0.6,
        ),
        itemBuilder: (BuildContext context, int index) {
          return ProductCard(
            product: products[index],
            key: ValueKey(products[index].id),
            onTap: () => context.read<CartCubit>().addItem(products[index].id),
          );
        },
      ),
    );
  }
}
