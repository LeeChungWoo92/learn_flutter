import 'package:learn_flutter/04_recipe/core/result.dart';
import 'package:learn_flutter/04_recipe/data/model/procedure.dart';

abstract interface class ProcedureRepository {
  Future<Result<List<Procedure>>> getProcedures();
}
