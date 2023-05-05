import 'package:equatable/equatable.dart';

class GptProcessModel extends Equatable {
  final String id;
  final String object;
  final String ownedBy;
  const GptProcessModel({
    required this.id,
    required this.object,
    required this.ownedBy,
  });

  @override
  List<Object?> get props => [
        id,
        object,
        ownedBy,
      ];
}
