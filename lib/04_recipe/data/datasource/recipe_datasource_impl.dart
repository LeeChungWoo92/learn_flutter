import 'package:learn_flutter/04_recipe/data/datasource/recipe_datasource.dart';
import 'package:learn_flutter/04_recipe/domain/model/recipe.dart';

class RecipeDatasourceImpl implements RecipeDatasource {
  @override
  Future<List<Recipe>> getRecipes() async {
    return [
      const Recipe(
        category: 'Asian',
        imageUrl:
            'https://cdn.pixabay.com/photo/2019/11/23/15/25/korea-food-4647402_1280.jpg',
        foodName: 'Samgyeobsal',
        chefName: '이청우',
        grade: 4.5,
        cookingTime: '25',
      ),
      const Recipe(
        category: 'Chinese',
        imageUrl:
            'https://cdn.pixabay.com/photo/2020/04/26/22/32/black-bean-noodles-5097423_1280.jpg',
        foodName: 'Jajangmyeon',
        chefName: '이연복',
        grade: 5.0,
        cookingTime: '20',
      ),
      const Recipe(
        category: 'Indian',
        imageUrl:
            'https://cdn.pixabay.com/photo/2020/10/11/05/06/chicken-5644762_1280.jpg',
        foodName: 'Chicken',
        chefName: '백종원',
        grade: 4.5,
        cookingTime: '35',
      ),
      const Recipe(
        category: 'Chinese',
        imageUrl:
            'https://cdn.pixabay.com/photo/2018/12/03/01/04/spicy-seafood-3852529_1280.jpg',
        foodName: 'Jjambbong',
        chefName: '이청우',
        grade: 4.0,
        cookingTime: '15',
      ),
      const Recipe(
        category: 'Asian',
        imageUrl:
            'https://cdn.pixabay.com/photo/2016/10/13/19/15/bibimbap-1738580_1280.jpg',
        foodName: 'Bibimbap',
        chefName: 'Hong gil dong',
        grade: 4.0,
        cookingTime: '15',
      ),
      const Recipe(
        category: 'Italian',
        imageUrl:
            'https://cdn.pixabay.com/photo/2024/04/23/09/32/ai-generated-8714517_1280.jpg',
        foodName: 'Pizza',
        chefName: '도민호',
        grade: 5.0,
        cookingTime: '30',
      ),
      const Recipe(
        category: 'Asian',
        imageUrl:
        'https://cdn.pixabay.com/photo/2024/05/02/17/47/sushi-8735286_1280.jpg',
        foodName: 'Sushi',
        chefName: '오노 지로',
        grade: 5.0,
        cookingTime: '60',
      ),
    ];
  }
}
