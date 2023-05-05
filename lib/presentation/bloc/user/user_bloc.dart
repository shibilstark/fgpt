import 'package:fgpt_ai/core/global/user_data.dart';
import 'package:fgpt_ai/domain/gpt/reposiotory/gpt_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fgpt_ai/domain/gpt/models/gpt_process_model.dart';
import 'package:injectable/injectable.dart';

part 'user_event.dart';
part 'user_state.dart';

@injectable
class UserBloc extends Bloc<UserEvent, UserState> {
  final GptRepository repository;
  UserBloc(this.repository) : super(const UserState(null)) {
    on<LoadUserData>(_loadUserData);
    on<SetNewModel>(_setNewModel);
  }

  void _loadUserData(LoadUserData event, Emitter<UserState> emit) {
    final currentModel = repository.getModelFromDb();

    if (currentModel != null) {
      UserData.currentProcessModel = currentModel;
    }

    emit(UserState(currentModel));
  }

  void _setNewModel(SetNewModel event, Emitter<UserState> emit) {
    UserData.currentProcessModel = event.model;
    repository.saveGptModel(event.model);
    emit(UserState(event.model));
  }
}
