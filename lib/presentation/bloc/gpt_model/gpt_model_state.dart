part of 'gpt_model_bloc.dart';

abstract class GptModelState extends Equatable {
  const GptModelState();

  @override
  List<Object> get props => [];
}

class GptModelInitial extends GptModelState {}

class GptModelSuccess extends GptModelState {
  final List<GptProcessModel> allModels;

  const GptModelSuccess(this.allModels);

  @override
  List<Object> get props => [allModels];
}

class GptModelError extends GptModelState {
  final AppFailure error;

  const GptModelError(this.error);
  @override
  List<Object> get props => [error];
}

class GptModelLoading extends GptModelState {}
