import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../configs/theme/app_textstyles.dart';
import '../../../configs/theme/app_theme.dart';
import '../../../core/utils/double_extensions.dart';
import '../../../domain/entities/product.dart';
import '../../common/cart_bloc/cart_cubit.dart';
import '../../common/widgets/cart_quantity_edit.dart';
import '../../common/widgets/product_image.dart';

class ProductCartTile extends StatelessWidget {
  final Product product;
  const ProductCartTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) => Card(
        color: Colors.transparent,
        elevation: 0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                product.name,
                textAlign: TextAlign.left,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextstyles.cardTitles,
              ),
            ),
            SizedBox(
              height: 70,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      ProductImage(product: product),
                      _RemoveFromCartButton(product),
                    ],
                  ),
                  _PriceInformation(product),
                  _QuantityEditor(product),
                ],
              ),
            ),
          ],
        ),
      );
}

class _RemoveFromCartButton extends StatelessWidget {
  final Product product;
  const _RemoveFromCartButton(this.product);

  @override
  Widget build(BuildContext context) => BlocBuilder<CartCubit, CartState>(
        buildWhen: (previous, current) =>
            current.itemQty(product.id) != previous.itemQty(product.id),
        builder: (context, state) => Positioned(
          right: 0,
          top: 0,
          child: IconButton.filled(
              visualDensity: VisualDensity.compact,
              style: AppTheme.overlayButton,
              iconSize: 16,
              icon: Icon(Icons.remove_shopping_cart),
              onPressed: () {
                context.read<CartCubit>().clearItem(product.id);
              }),
        ),
      );
}

class _QuantityEditor extends StatelessWidget {
  final Product product;
  const _QuantityEditor(this.product);

  @override
  Widget build(BuildContext context) => BlocBuilder<CartCubit, CartState>(
      buildWhen: (previous, current) => current.itemQty(product.id) != previous.itemQty(product.id),
      builder: (context, state) {
        return CartQuantityEdit(
          product: product,
          qty: state.itemQty(product.id),
        );
      });
}

class _PriceInformation extends StatelessWidget {
  final Product product;
  const _PriceInformation(this.product);

  @override
  Widget build(BuildContext context) => BlocBuilder<CartCubit, CartState>(
        buildWhen: (previous, current) =>
            current.itemQty(product.id) != previous.itemQty(product.id),
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Total price",
                textAlign: TextAlign.left,
              ),
              Text(
                (state.itemQty(product.id) * product.price).toStringEuros,
                textAlign: TextAlign.left,
                style: AppTextstyles.bodyStrongMessage,
              ),
            ],
          );
        },
      );
}
