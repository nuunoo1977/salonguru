// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/cart_repository/cart_repository_impl.dart' as _i325;
import '../../data/cart_repository/sources/cart_source.dart' as _i144;
import '../../data/cart_repository/sources/cart_source_shared_preferences.dart'
    as _i273;
import '../../data/product_repository/product_repository_impl.dart' as _i689;
import '../../data/product_repository/sources/product_source.dart' as _i855;
import '../../data/product_repository/sources/product_source_mock.dart'
    as _i619;
import '../../data/product_repository/sources/product_source_remote.dart'
    as _i657;
import '../../domain/cart_repository.dart' as _i155;
import '../../domain/product_repository.dart' as _i416;
import '../../domain/usecases/checkout_use_case.dart' as _i835;
import '../../presentation/cart_details/cart_checkout_cubit/cart_checkout_cubit.dart'
    as _i172;
import '../../presentation/common/cart_bloc/cart_cubit.dart' as _i34;
import '../../presentation/common/products_bloc/products_cubit.dart' as _i1009;

const String _dev = 'dev';
const String _prod = 'prod';

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i855.ProductSource>(
      () => _i619.ProductSourceMock(),
      registerFor: {_dev},
    );
    gh.factory<_i144.CartSource>(() => _i273.CartSourceSharedPreferences());
    gh.factory<_i855.ProductSource>(
      () => _i657.ProductSourceRemote(),
      registerFor: {_prod},
    );
    gh.factory<_i155.CartRepository>(
        () => _i325.CartRepositoryImpl(gh<_i144.CartSource>()));
    gh.singleton<_i416.ProductRepository>(
        () => _i689.ProductRepositoryImpl(gh<_i855.ProductSource>()));
    gh.factory<_i835.CheckoutUseCase>(
        () => _i835.CheckoutUseCase(gh<_i416.ProductRepository>()));
    gh.factory<_i34.CartCubit>(
        () => _i34.CartCubit(repository: gh<_i155.CartRepository>()));
    gh.factory<_i1009.ProductsCubit>(() => _i1009.ProductsCubit(
        productsRepository: gh<_i416.ProductRepository>()));
    gh.factoryParam<_i172.CartCheckoutCubit, _i34.CartCubit,
        _i1009.ProductsCubit>((
      cartCubit,
      productsCubit,
    ) =>
        _i172.CartCheckoutCubit(
          cartCubit: cartCubit,
          productsCubit: productsCubit,
          checkoutUseCase: gh<_i835.CheckoutUseCase>(),
        ));
    return this;
  }
}
