import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../configs/theme/app_textstyles.dart';
import '../../../domain/entities/product.dart';
import '../../common/cart_bloc/cart_cubit.dart';
import '../../common/widgets/network_image_with_loader.dart';

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
                ClipRRect(
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
                  ]),
                ),
                Positioned(
                  right: 12,
                  top: 8,
                  child: BlocBuilder<CartCubit, CartState>(
                      buildWhen: (previous, current) =>
                          current.itemQty(product.id) != previous.itemQty(product.id),
                      builder: (context, state) => Badge(
                            isLabelVisible: state.itemQty(product.id) > 0,
                            label: Text(state.itemQty(product.id).toString()),
                            child: Container(),
                          )),
                ),
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
