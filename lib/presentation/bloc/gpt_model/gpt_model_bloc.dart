// ignore_for_file: use_build_context_synchronously

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fgpt_ai/domain/app_failure/app_failure.dart';
import 'package:fgpt_ai/domain/gpt/models/gpt_process_model.dart';
import 'package:fgpt_ai/domain/gpt/reposiotory/gpt_repository.dart';
import 'package:fgpt_ai/presentation/widgets/custom_snackbar.dart';
import 'package:fgpt_ai/utils/connectivity_utils.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'gpt_model_event.dart';
part 'gpt_model_state.dart';

@injectable
class GptModelBloc extends Bloc<GptModelEvent, GptModelState> {
  final GptRepository repository;

  GptModelBloc(this.repository) : super(GptModelInitial()) {
    on<GetAllGptModels>(_getAllGptModels);
  }

  void _getAllGptModels(
      GetAllGptModels event, Emitter<GptModelState> emit) async {
    if (event.doReload) {
      emit(GptModelLoading());
    }

    if (await _checkHaveConnection()) {
      await repository.getAllRemoteModels().then((result) {
        result.fold(
            (l) => emit(GptModelError(l)), (r) => emit(GptModelSuccess(r)));
      });
    } else {
      _handleInternetError(emit, event.context);
    }
  }

  Future<bool> _checkHaveConnection() async =>
      await ConnectivityUtil.checkInternetConnection();

  void _handleInternetError(Emitter<GptModelState> emit, BuildContext context) {
    final failure = AppFailure.internet();
    showCustomSnackBar(context, message: failure.message);
    emit(GptModelError(failure));
  }
}
