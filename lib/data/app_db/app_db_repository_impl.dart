import 'package:injectable/injectable.dart';
import 'package:fgpt_ai/data/app_db/app_db.dart';
import 'package:fgpt_ai/domain/app_db/app_db_repository.dart';

@LazySingleton(as: AppDbRepository)
class AppDbRepositoryImplementation implements AppDbRepository {
  @override
  Future<void> initializeDB() async {
    await ObjectBox.initialize();
    return;
  }
}
