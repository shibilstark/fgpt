part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class LoadUserData extends UserEvent {
  const LoadUserData();

  @override
  List<Object> get props => [];
}

class SetNewModel extends UserEvent {
  final GptProcessModel model;
  const SetNewModel(this.model);

  @override
  List<Object> get props => [model];
}
