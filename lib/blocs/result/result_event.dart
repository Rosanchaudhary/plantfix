part of 'result_bloc.dart';

abstract class ResultEvent extends Equatable {
  const ResultEvent();

  @override
  List<Object> get props => [];
}

class GetResult extends ResultEvent {
  final String id;
  GetResult({
    required this.id,
  });

    @override
  List<Object> get props => [id];
  
}
