part of 'result_bloc.dart';

enum ResultStatus { loading, loaded,error }

class ResultState extends Equatable {
  final ResultStatus resultStatus;
  final Result result;

  const ResultState({required this.resultStatus, required this.result});

  factory ResultState.initial() {
    return ResultState(resultStatus: ResultStatus.loading, result: Result('', '', '', '', '', ''));
  }

  @override
  List<Object> get props => [resultStatus, result];

  @override
  String toString() =>
      'ResultState(resultStatus: $resultStatus, result: $result)';

  ResultState copyWith({
    ResultStatus? resultStatus,
    Result? result,
  }) {
    return ResultState(
      resultStatus: resultStatus ?? this.resultStatus,
      result: result ?? this.result,
    );
  }
}
