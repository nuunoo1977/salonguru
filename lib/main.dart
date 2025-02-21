import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'configs/di/injection.dart';
import 'configs/theme/app_theme.dart';
import 'presentation/common/cart_bloc/cart_cubit.dart';
import 'presentation/products/products_page.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Salonguru',
      theme: AppTheme.appTheme,
      home: const ProductsPage(),
      builder: (context, widget) => BlocProvider(
        create: (_) => getIt<CartCubit>(),
        child: widget,
      ),
    );
  }
}
