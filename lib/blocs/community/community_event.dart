part of 'community_bloc.dart';

abstract class CommunityEvent extends Equatable {
  const CommunityEvent();

  @override
  List<Object> get props => [];
}

class AskToCommunity extends CommunityEvent {
  final String image;
  final String title;
  final String about;
  AskToCommunity(
      {required this.title, required this.about, required this.image});
}

class GetAllCommunity extends CommunityEvent {
}
