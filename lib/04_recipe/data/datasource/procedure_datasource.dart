import 'package:learn_flutter/04_recipe/domain/model/procedure.dart';

abstract interface class ProcedureDatasource {
  Future<List<Procedure>> getProcedures();
}