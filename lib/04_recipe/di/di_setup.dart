import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:learn_flutter/04_recipe/di/di_setup.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => getIt.init(environment: Environment.dev);
