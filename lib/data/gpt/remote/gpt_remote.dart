import 'package:dartz/dartz.dart';
import 'package:fgpt_ai/core/network/app_network.dart';
import 'package:fgpt_ai/data/endpoints.dart';
import 'package:fgpt_ai/data/gpt/entities/gpt_model_entity.dart';
import 'package:fgpt_ai/domain/app_failure/app_failure.dart';
import 'package:fgpt_ai/domain/common_types/type_defs.dart';
import 'package:fgpt_ai/domain/gpt/models/gpt_process_model.dart';

class GptRemote {
  static FutureEither<List<GptProcessModel>> getProcessingModels() async {
    try {
      final response = await AppNetwork.get(url: Api.baseUrl + EndPoints.model);

      if (AppNetwork.checkResponse(response)) {
        final models = (response.data['data'] as List<dynamic>)
            .map((e) => GptModelEntity.fromJson(e).toModel())
            .toList();

        return Right(models);
      } else {
        return Left(AppFailure.server(
            response.statusMessage ?? response.statusCode.toString()));
      }
    } catch (e) {
      return Left(AppFailure.client(e.toString()));
    }
  }
}
