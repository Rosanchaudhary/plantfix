part of 'message_bloc.dart';

abstract class MessageEvent extends Equatable {
  const MessageEvent();

  @override
  List<Object> get props => [];
}

class GetMessage extends MessageEvent {
  final String discussionId;
  const GetMessage({required this.discussionId});
}

class SendMessage extends MessageEvent {
  final String discussionId;
  final String message;
  const SendMessage({
    required this.discussionId,
    required this.message
  });
}
