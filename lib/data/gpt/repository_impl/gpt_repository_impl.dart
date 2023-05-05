import 'package:fgpt_ai/data/gpt/db/gpt_model_db.dart';
import 'package:fgpt_ai/data/gpt/remote/gpt_remote.dart';
import 'package:fgpt_ai/domain/gpt/models/gpt_process_model.dart';
import 'package:fgpt_ai/domain/common_types/type_defs.dart';
import 'package:fgpt_ai/domain/gpt/reposiotory/gpt_repository.dart';

class GptRepositoryImpl implements GptRepository {
  final gptModelsDb = GptModelDb();

  @override
  FutureEither<List<GptProcessModel>> getAllRemoteModels() async {
    return await GptRemote.getProcessingModels();
  }

  @override
  GptProcessModel? getModelFromDb() {
    return gptModelsDb.getModel();
  }

  @override
  void saveGptModel(GptProcessModel model) {
    return gptModelsDb.saveModel(model);
  }
}
