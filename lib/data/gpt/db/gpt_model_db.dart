import 'package:fgpt_ai/data/app_db/app_db.dart';
import 'package:fgpt_ai/data/gpt/db/entities/gpt_process_entity.dart';
import 'package:fgpt_ai/domain/gpt/models/gpt_process_model.dart';

class GptModelDb {
  final processBox = ObjectBox.instance.store.box<GptProcessEntity>();

  void saveModel(GptProcessModel model) {
    processBox.removeAll();
    processBox.put(GptProcessEntity.fromModel(model));
    return;
  }

  GptProcessModel? getModel() {
    final datas = processBox.getAll().toList();

    if (datas.isEmpty) {
      return null;
    }

    return datas.first.toModel();
  }
}
