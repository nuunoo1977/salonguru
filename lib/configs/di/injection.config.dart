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

import '../../data/cart_repository/cart_repository_memory.dart' as _i595;
import '../../data/product_repository/product_repository_impl.dart' as _i689;
import '../../data/product_repository/sources/product_source.dart' as _i855;
import '../../data/product_repository/sources/product_source_mock.dart' as _i619;
import '../../data/product_repository/sources/product_source_remote.dart' as _i657;
import '../../domain/cart_repository.dart' as _i155;
import '../../domain/product_repository.dart' as _i416;
import '../../presentation/products/bloc/products_display_cubit.dart' as _i36;

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
    gh.singleton<_i155.CartRepository>(
      () => _i595.CartRepositoryMemory(),
      dispose: (i) => i.dispose(),
    );
    gh.factory<_i855.ProductSource>(
      () => _i657.ProductSourceRemote(),
      registerFor: {_prod},
    );
    gh.singleton<_i416.ProductRepository>(
        () => _i689.ProductRepositoryImpl(gh<_i855.ProductSource>()));
    gh.factory<_i36.ProductsDisplayCubit>(
        () => _i36.ProductsDisplayCubit(productsRepository: gh<_i416.ProductRepository>()));
    return this;
  }
}
