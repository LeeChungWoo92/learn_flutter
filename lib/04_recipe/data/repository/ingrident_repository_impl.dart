import 'package:learn_flutter/04_recipe/data/datasource/ingrident_datasource.dart';
import 'package:learn_flutter/04_recipe/domain/repository/ingrident_repository.dart';
import 'package:learn_flutter/01_widget_rule/data/model/ingrident.dart';
import 'package:learn_flutter/04_recipe/core/result.dart';

class IngridentRepositoryImpl implements IngridentRepository {
  IngridentDatasource ingridentDatasource;

  IngridentRepositoryImpl(this.ingridentDatasource);

  @override
  Future<Result<List<Ingrident>>> getIngridents() async {
    try {
      final data = await ingridentDatasource.getIngridents();
      return Result.success(data);
    } catch (e) {
      return Result.error(e.toString());
    }
  }
}
