import 'package:flutter/material.dart';

import '../../../configs/theme/app_textstyles.dart';
import '../../../domain/entities/product.dart';
import 'network_image_with_loader.dart';

class ProductImage extends StatelessWidget {
  final Product product;
  final bool showAvailability;
  const ProductImage({
    super.key,
    required this.product,
    this.showAvailability = false,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(children: [
        NetworkImageWithLoader(product.image, key: ValueKey(product.image)),
        Positioned(
          left: 0,
          bottom: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.6),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              "${product.price} €",
              style: AppTextstyles.cardTitles.copyWith(color: Colors.white),
            ),
          ),
        ),
        if (showAvailability)
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.6),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                product.quantity > 0 ? "${product.quantity} available" : "Sold out",
                style: AppTextstyles.cardTitles.copyWith(color: Colors.white),
              ),
            ),
          ),
      ]),
    );
  }
}
