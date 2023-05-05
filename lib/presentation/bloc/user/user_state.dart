part of 'user_bloc.dart';

class UserState extends Equatable {
  final GptProcessModel? model;
  const UserState(this.model);

  @override
  List<Object?> get props => [model];
}
