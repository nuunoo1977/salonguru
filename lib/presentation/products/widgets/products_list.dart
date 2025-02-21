import 'package:flutter/material.dart';

import '../../../configs/di/injection.dart';
import '../../../domain/cart_repository.dart';
import '../../../domain/entities/cart_item.dart';
import '../../../domain/entities/product.dart';
import 'product_card.dart';

// TODO(nunofelicio): make grid responsive for different screen orientations

class ProductsList extends StatelessWidget {
  final List<Product> products;
  const ProductsList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
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
          onTap: () =>
              getIt<CartRepository>().update(CartItem(productId: products[index].id, quantity: 1)),
        );
      },
    );
  }
}
