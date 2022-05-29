part of 'predection_bloc.dart';

abstract class PredectionEvent extends Equatable {
  const PredectionEvent();

  @override
  List<Object?> get props => [];
}

class PredictImage extends PredectionEvent {
  final File image;
  PredictImage({
    required this.image,
  });

  @override
  List<Object?> get props => [image];
}
