import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @preResolve
  @prod
  @lazySingleton
  String environment = 'prod';
}

@module
abstract class AppDevModule {
  @preResolve
  @dev
  @lazySingleton
  String environment = 'dev';
}
