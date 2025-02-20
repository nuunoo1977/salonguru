import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../environment_values.dart';
import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void configureDependencies() => getIt.init(environment: EnvironmentValues.env);

@module
abstract class RegisterModule {}
