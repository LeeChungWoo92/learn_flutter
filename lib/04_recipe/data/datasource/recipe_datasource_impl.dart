import 'package:learn_flutter/04_recipe/data/datasource/recipe_datasource.dart';
import 'package:learn_flutter/04_recipe/data/model/recipe.dart';

class RecipeDatasourceImpl implements RecipeDatasource {
  @override
  Future<List<Recipe>> getRecipes() async {
    return [
      const Recipe(
        imageUrl:
            'https://cdn.pixabay.com/photo/2019/11/23/15/25/korea-food-4647402_1280.jpg',
        foodName: '삼겹살',
        chefName: '이청우',
        grade: 4.5,
        cookingTime: '25',
      ),
      const Recipe(
        imageUrl:
            'https://cdn.pixabay.com/photo/2020/04/26/22/32/black-bean-noodles-5097423_1280.jpg',
        foodName: '짜장면',
        chefName: '이연복',
        grade: 5.0,
        cookingTime: '20',
      ),
      const Recipe(
        imageUrl:
            'https://cdn.pixabay.com/photo/2020/10/11/05/06/chicken-5644762_1280.jpg',
        foodName: '치킨',
        chefName: '백종원',
        grade: 4.5,
        cookingTime: '35',
      ),
      const Recipe(
        imageUrl:
            'https://cdn.pixabay.com/photo/2018/12/03/01/04/spicy-seafood-3852529_1280.jpg',
        foodName: '짬뽕',
        chefName: '이청우',
        grade: 4.0,
        cookingTime: '15',
      ),
      const Recipe(
        imageUrl:
            'https://cdn.pixabay.com/photo/2016/10/13/19/15/bibimbap-1738580_1280.jpg',
        foodName: '비빔밥',
        chefName: 'Hong gil dong',
        grade: 4.0,
        cookingTime: '15',
      ),
      const Recipe(
        imageUrl:
            'https://cdn.pixabay.com/photo/2024/04/23/09/32/ai-generated-8714517_1280.jpg',
        foodName: '피자',
        chefName: '도민호',
        grade: 5.0,
        cookingTime: '30',
      ),
      const Recipe(
        imageUrl:
        'https://cdn.pixabay.com/photo/2024/05/02/17/47/sushi-8735286_1280.jpg',
        foodName: '초밥',
        chefName: '오노 지로',
        grade: 5.0,
        cookingTime: '60',
      ),
    ];
  }
}
