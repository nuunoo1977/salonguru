import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../configs/di/injection.dart';
import '../../configs/theme/app_textstyles.dart';
import '../../domain/cart_repository.dart';
import '../common/widgets/body_wrapper.dart';
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
            Builder(builder: (context) {
              return IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: () {
                  context.read<ProductsDisplayCubit>().loadOrders(true);
                },
              );
            }),
            StreamBuilder(
                stream: getIt<CartRepository>().watchItems,
                builder: (context, snapshot) {
                  return IconButton(
                    icon: Badge(
                      offset: const Offset(2, 12),
                      isLabelVisible: snapshot.data?.isNotEmpty ?? false,
                      label: Text(snapshot.data?.length.toString() ?? ''),
                      child: const Icon(Icons.shopping_cart),
                    ),
                    onPressed: () {
                      //context.read<ProductsDisplayCubit>().loadOrders(true);
                    },
                  );
                }),
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
