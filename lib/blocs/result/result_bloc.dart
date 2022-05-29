import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:Plantfix/modals/result_model.dart';
import 'package:Plantfix/repositories/result_repo.dart';

part 'result_event.dart';
part 'result_state.dart';

class ResultBloc extends Bloc<ResultEvent, ResultState> {
  ResultRepository repository;
  ResultBloc({required this.repository}) : super(ResultState.initial()) {
    on<GetResult>((event, emit) async {
      emit(state.copyWith(resultStatus: ResultStatus.loading));
      try {
        Result result = await repository.getResult(event.id);
        emit(state.copyWith(resultStatus: ResultStatus.loaded, result: result));
      } catch (e) {
        emit(state.copyWith(resultStatus: ResultStatus.error));
      }
    });
  }
}
