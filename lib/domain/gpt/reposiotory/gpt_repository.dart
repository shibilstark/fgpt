import 'package:fgpt_ai/domain/common_types/type_defs.dart';
import 'package:fgpt_ai/domain/gpt/models/gpt_process_model.dart';

abstract class GptRepository {
  FutureEither<List<GptProcessModel>> getAllRemoteModels();

  GptProcessModel? getModelFromDb();

  void saveGptModel(GptProcessModel model);
}
