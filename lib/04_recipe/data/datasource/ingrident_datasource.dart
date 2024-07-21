import 'package:learn_flutter/01_widget_rule/data/model/ingrident.dart';

abstract interface class IngridentDatasource{
  Future<List<Ingrident>> getIngridents ();

}