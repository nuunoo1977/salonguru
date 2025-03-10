import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../configs/theme/app_textstyles.dart';
import '../../../configs/theme/app_theme.dart';
import '../../../domain/entities/product.dart';
import '../../common/cart_bloc/cart_cubit.dart';
import '../../common/widgets/product_image.dart';

// TODO(nunofelicio): add availabilty information (Sold out banner)
class ProductCard extends StatelessWidget {
  final Product product;
  final void Function()? onTap;
  const ProductCard({required this.product, super.key, this.onTap});

  @override
  Widget build(BuildContext context) => Card(
        color: Colors.transparent,
        elevation: 0,
        child: GestureDetector(
          onTap: onTap,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(children: [
                ProductImage(product: product),
                BlocBuilder<CartCubit, CartState>(
                    buildWhen: (previous, current) =>
                        current.itemQty(product.id) != previous.itemQty(product.id),
                    builder: (context, state) {
                      final qty = state.itemQty(product.id);
                      return Positioned(
                        right: 0,
                        bottom: 8,
                        child: Badge(
                          offset: qty > 9 ? Offset(-2, -4) : Offset(4, -4),
                          isLabelVisible: qty > 0,
                          label: Text(qty.toString()),
                          child: Container(),
                        ),
                      );
                    }),
                BlocBuilder<CartCubit, CartState>(
                    buildWhen: (previous, current) =>
                        current.itemQty(product.id) != previous.itemQty(product.id),
                    builder: (context, state) {
                      final qty = state.itemQty(product.id);
                      if (qty == 0) return Container();
                      return Positioned(
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
                      );
                    }),
              ]),
              SizedBox(height: 2),
              Flexible(
                child: Text(
                  textAlign: TextAlign.center,
                  product.name,
                  maxLines: 2,
                  style: AppTextstyles.cardTitles,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      );
}
