import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

class Repository {
  final String title;

  Repository(this.title);

  Future<String> getTitle() async {
    return title;
  }
}

void main() async {
  const title = '홍길동';
  int count = 0;

  // 의존성 등록
  getIt.registerSingleton<String>(title);
  getIt.registerSingleton<int>(count);


  final repository = Repository(getIt<String>());
  print(await repository.getTitle());
}
