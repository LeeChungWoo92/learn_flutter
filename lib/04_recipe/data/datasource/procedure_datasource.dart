import 'package:learn_flutter/04_recipe/data/model/procedure.dart';

abstract interface class ProcedureDatasource {
  Future<List<Procedure>> getProcedures();
}