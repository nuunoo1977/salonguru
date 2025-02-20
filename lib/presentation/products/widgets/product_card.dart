import 'package:flutter/material.dart';

import '../../../configs/theme/app_textstyles.dart';
import '../../../domain/entities/product.dart';
import '../../common/widgets/network_image_with_loader.dart';

// TODO(nunofelicio): add price and availabilty information
class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({required this.product, super.key});

  @override
  Widget build(BuildContext context) => Card(
        color: Colors.transparent,
        elevation: 0,
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: NetworkImageWithLoader(product.image, key: ValueKey(product.image)),
              ),
              Flexible(
                child: Text(
                  textAlign: TextAlign.center,
                  product.name,
                  maxLines: 2,
                  style: AppTextstyles.cardTitles,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              // Transform.translate(
              //   offset: Offset(55, -58),
              //   child: Container(
              //     width: 30,
              //     // height: 30,
              //     clipBehavior: Clip.hardEdge,
              //     decoration: BoxDecoration(),
              //     child: Center(
              //       child: MaterialButton(
              //         onPressed: () {
              //           // setState(() {
              //           //   item["isSaved"] = !item["isSaved"];
              //           // });
              //         },
              //         color: Colors.white,
              //         height: 35,
              //         minWidth: 40,
              //         padding: EdgeInsets.all(0),
              //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              //         child: Icon(Icons.bookmark, size: 22, color: Colors.yellow[700]),
              //       ),
              //     ),
              //   ),
              // ),
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
