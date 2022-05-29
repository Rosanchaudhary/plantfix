part of 'predection_bloc.dart';

enum PredectionStatus { initial, loading, loaded, error }

class PredectionState extends Equatable {
  final PredectionStatus predectionStatus;
  final CustomError error;
  final String label;
  final String index;

  const PredectionState(
      {required this.predectionStatus,
      required this.error,
      required this.label,
      required this.index
      });

  factory PredectionState.initial() {
    return PredectionState(
      index: '',
        label: '',
        predectionStatus: PredectionStatus.initial,
        error: CustomError());
  }

  @override
  List<Object> get props => [predectionStatus, error, label,index];

  @override
  String toString() =>
      'PredectionState(predectionStatus: $predectionStatus, error: $error, label: $label,index: $index)';

  PredectionState copyWith({
    PredectionStatus? predectionStatus,
    CustomError? error,
    String? label,
    String? index
  }) {
    return PredectionState(
      index: index ?? this.index,
      predectionStatus: predectionStatus ?? this.predectionStatus,
      error: error ?? this.error,
      label: label ?? this.label,
    );
  }
}
