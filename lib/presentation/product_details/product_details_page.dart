import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../configs/theme/app_textstyles.dart';
import '../../domain/entities/product.dart';
import '../common/cart_bloc/cart_cubit.dart';
import '../common/widgets/body_wrapper.dart';
import '../common/widgets/cart_quantity_edit.dart';
import '../common/widgets/cart_status_button.dart';
import '../common/widgets/product_image.dart';
import 'widgets/add_to_cart_button.dart';

final class ProductDetailPage extends StatelessWidget {
  final Product product;
  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        actions: [
          const CartStatusButton(),
        ],
      ),
      body: BodyWrapper(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(product.name, style: AppTextstyles.bodyTitles, textAlign: TextAlign.left),
              _spacer(),
              ProductImage(
                product: product,
                showAvailability: true,
              ),
              _spacer(),
              Text(product.description, style: AppTextstyles.bodyNormal),
              _spacer(3),
              BlocBuilder<CartCubit, CartState>(
                buildWhen: (previous, current) =>
                    current.itemQty(product.id) != previous.itemQty(product.id),
                builder: (context, state) {
                  final qty = state.itemQty(product.id);

                  if (qty == 0 && product.quantity == 0) return Container();
                  if (qty == 0) return AddToCartButton(product: product);
                  return CartQuantityEdit(product: product, qty: qty);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _spacer([double qty = 1]) => SizedBox(height: qty * 12.0);
}
