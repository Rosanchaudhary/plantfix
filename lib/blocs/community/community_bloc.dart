import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:Plantfix/modals/custom_error.dart';
import 'package:Plantfix/modals/discussion.dart';
import 'package:Plantfix/repositories/ask_community.dart';

part 'community_event.dart';
part 'community_state.dart';

class CommunityBloc extends Bloc<CommunityEvent, CommunityState> {
  final AskCommunityRepository askCommunity;
  CommunityBloc({required this.askCommunity})
      : super(CommunityState.initial()) {
    on<AskToCommunity>((event, emit) async {
      emit(state.copyWith(communityStatus: CommunityStatus.submitting));

      try {
        await askCommunity.askCommunity(event.image, event.title, event.about);
        emit(state.copyWith(communityStatus: CommunityStatus.success));
      } on CustomError catch (e) {
        emit(state.copyWith(communityStatus: CommunityStatus.error, error: e));
      }
    });
    on<GetAllCommunity>((event, emit) async {
      emit(state.copyWith(communityStatus: CommunityStatus.loading));
      try {
        final community = await askCommunity.getDiscussions();
        emit(state.copyWith(
            communityStatus: CommunityStatus.loaded, discussion: community));
      } on CustomError catch (e) {
        emit(state.copyWith(communityStatus: CommunityStatus.error, error: e));
      }
    });
  }
}
