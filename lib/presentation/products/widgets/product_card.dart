import 'package:flutter/material.dart';

import '../../../configs/di/injection.dart';
import '../../../configs/theme/app_textstyles.dart';
import '../../../domain/cart_repository.dart';
import '../../../domain/entities/product.dart';
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
                  child: StreamBuilder(
                      stream: getIt<CartRepository>().watchItem(product.id),
                      builder: (context, snapshot) {
                        return Badge(
                          isLabelVisible: snapshot.data != null,
                          label: Text(snapshot.data?.quantity.toString() ?? ''),
                          //label: Text("99"),
                          child: Container(),
                        );
                      }),
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

  // @override
  // Widget build(BuildContext context) {
  //   return GestureDetector(
  //     onTap: () {
  //       //AppNavigator.push(context, const MyOrdersPage());
  //     },
  //     child: Container(
  //       height: 150,
  //       padding: const EdgeInsets.symmetric(horizontal: 16),
  //       decoration: BoxDecoration(
  //           color: AppColors.secondBackground, borderRadius: BorderRadius.circular(10)),
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           Container(
  //             child: NetworkImageWithLoader(src: product.image),
  //           ),
  //           Text(
  //             product.name,
  //             style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
  //           ),
  //           Icon(Icons.arrow_forward_ios_rounded)
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
