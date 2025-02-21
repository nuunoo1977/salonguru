import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../configs/di/injection.dart';
import '../../configs/theme/app_textstyles.dart';
import '../common/widgets/body_wrapper.dart';
import '../common/widgets/cart_status_button.dart';
import 'bloc/products_display_cubit.dart';
import 'widgets/products_list.dart';

final class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProductsDisplayCubit>()..loadOrders(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Salonguru Shop'),
          actions: [
            const CartStatusButton(),
          ],
        ),
        body: BodyWrapper(
          child: BlocBuilder<ProductsDisplayCubit, ProductsDisplayState>(
              builder: (context, state) => switch (state) {
                    Uninitialized() => const Center(
                        child: SizedBox.shrink(),
                      ),
                    ProductsLoading() => const Center(
                        child: CircularProgressIndicator.adaptive(),
                      ),
                    ProductsLoaded() => ProductsList(products: state.products),
                    ProductsLoadingFailure() => Center(
                        child: Text(
                          state.messageToUser,
                          textAlign: TextAlign.center,
                          style: AppTextstyles.errorMessage,
                        ),
                      )
                  }),
        ),
      ),
    );
  }
}
