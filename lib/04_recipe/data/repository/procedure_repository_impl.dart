import 'package:learn_flutter/04_recipe/data/datasource/procedure_datasource.dart';
import 'package:learn_flutter/04_recipe/data/repository/procedure_repository.dart';
import 'package:learn_flutter/04_recipe/core/result.dart';
import 'package:learn_flutter/04_recipe/data/model/procedure.dart';

class ProcedureRepositoryImpl implements ProcedureRepository {
  final ProcedureDatasource _procedureDatasource;

  ProcedureRepositoryImpl(this._procedureDatasource);

  @override
  Future<Result<List<Procedure>>> getProcedures() async {
    try {
      final data = await _procedureDatasource.getProcedures();
      return Result.success(data);
    } catch (e) {
      return Result.error(e.toString());
    }
  }
}
