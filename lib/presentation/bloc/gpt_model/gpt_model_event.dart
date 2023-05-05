part of 'gpt_model_bloc.dart';

abstract class GptModelEvent extends Equatable {
  const GptModelEvent();

  @override
  List<Object> get props => [];
}

class GetAllGptModels extends GptModelEvent {
  final BuildContext context;
  final bool doReload;
  const GetAllGptModels({required this.context, this.doReload = false});

  @override
  List<Object> get props => [context];
}
