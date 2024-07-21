import 'package:learn_flutter/01_widget_rule/data/model/ingrident.dart';
import 'package:learn_flutter/04_recipe/core/result.dart';

abstract interface class IngridentRepository {
  Future<Result<List<Ingrident>>> getIngridents ();
}