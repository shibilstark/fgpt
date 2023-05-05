// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fgpt_ai/domain/gpt/models/gpt_process_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'gpt_model_entity.g.dart';

@JsonSerializable()
class GptModelEntity {
  final String id;
  final String object;
  @JsonKey(name: "owned_by")
  final String ownedBy;
  GptModelEntity({
    required this.id,
    required this.object,
    required this.ownedBy,
  });

  factory GptModelEntity.fromJson(Map<String, dynamic> json) {
    return _$GptModelEntityFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GptModelEntityToJson(this);

  GptProcessModel toModel() =>
      GptProcessModel(id: id, object: object, ownedBy: ownedBy);
}
