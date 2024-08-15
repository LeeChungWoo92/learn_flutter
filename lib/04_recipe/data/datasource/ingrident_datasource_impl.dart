import 'package:injectable/injectable.dart';
import 'package:learn_flutter/04_recipe/data/datasource/ingrident_datasource.dart';
import 'package:learn_flutter/01_widget_rule/data/model/ingrident.dart';

@Singleton(as: IngridentDatasource)
class IngridentDatasourceImpl implements IngridentDatasource {
  @override
  Future<List<Ingrident>> getIngridents() async {
    return [
      const Ingrident(
        imageUrl:
            'https://cdn.pixabay.com/photo/2019/07/03/20/56/tomatoes-4315442_1280.png',
        name: 'Tomatos',
        weight: '500',
      ),
      const Ingrident(
        imageUrl:
        'https://cdn.pixabay.com/photo/2020/12/02/16/35/korea-5798134_1280.jpg',
        name: 'Cabbage',
        weight: '300',
      ),
      const Ingrident(
        imageUrl:
        'https://cdn.pixabay.com/photo/2022/11/28/20/05/taco-7623097_1280.jpg',
        name: 'Taco',
        weight: '300',
      ),
      const Ingrident(
        imageUrl:
        'https://cdn.pixabay.com/photo/2020/06/21/15/01/bakery-5325300_1280.jpg',
        name: 'Slice Bread',
        weight: '300',
      ),
      const Ingrident(
        imageUrl:
        'https://cdn.pixabay.com/photo/2017/06/27/22/21/banana-2449019_1280.jpg',
        name: 'Banana',
        weight: '200',
      ),
    ];
  }
}
