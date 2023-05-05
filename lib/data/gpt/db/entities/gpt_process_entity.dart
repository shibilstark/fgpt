import 'package:fgpt_ai/domain/gpt/models/gpt_process_model.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class GptProcessEntity {
  int id;
  final String uid;
  final String object;
  final String ownedBy;
  GptProcessEntity({
    this.id = 0,
    required this.uid,
    required this.object,
    required this.ownedBy,
  });

  factory GptProcessEntity.fromModel(GptProcessModel model) => GptProcessEntity(
        uid: model.id,
        object: model.object,
        ownedBy: model.ownedBy,
      );

  GptProcessModel toModel() =>
      GptProcessModel(id: uid, object: object, ownedBy: ownedBy);
}
