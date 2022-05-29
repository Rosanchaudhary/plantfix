import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:Plantfix/modals/custom_error.dart';
import 'package:Plantfix/repositories/predictimage_repository.dart';

part 'predection_event.dart';
part 'predection_state.dart';

class PredectionBloc extends Bloc<PredectionEvent, PredectionState> {
  final PredictImageRepository predictImageRepository;
  PredectionBloc({required this.predictImageRepository})
      : super(PredectionState.initial()) {
    on<PredictImage>((event, emit) async {
      emit(state.copyWith(predectionStatus: PredectionStatus.loading));
      try {
        final label = await predictImageRepository.predictImage(event.image);

        emit(state.copyWith(
            predectionStatus: PredectionStatus.loaded, label: label));
      } catch (e) {}
    });
  }
}
