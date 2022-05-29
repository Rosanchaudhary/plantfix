part of 'community_bloc.dart';

enum CommunityStatus {
  intitial,
  submitting,
  success,
  loading,
  loaded,
  error,
}

class CommunityState extends Equatable {
  final CommunityStatus communityStatus;
  final CustomError error;
  final List<Discussion> discussion;

  const CommunityState({
    required this.communityStatus,
    required this.error,
    required this.discussion
  });

  factory CommunityState.initial() {
    return CommunityState(
        communityStatus: CommunityStatus.intitial, error: CustomError(),discussion: <Discussion>[]);
  }

  @override
  List<Object> get props => [communityStatus, error,discussion];

  @override
  String toString() =>
      'CommunityState(communityStatus: $communityStatus, error: $error,discussion:$discussion)';

  CommunityState copyWith({
    CommunityStatus? communityStatus,
    CustomError? error,
    List<Discussion>? discussion
  }) {
    return CommunityState(
      communityStatus: communityStatus ?? this.communityStatus,
      error: error ?? this.error,
      discussion: discussion ?? this.discussion
    );
  }
}
