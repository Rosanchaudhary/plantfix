part of 'message_bloc.dart';

enum MessageStatus { initial, loading, loaded, error }

class MessageState extends Equatable {
  final MessageStatus messageStatus;
  final List<Message> messages;
  const MessageState({required this.messageStatus, required this.messages});

  factory MessageState.initial() {
    return MessageState(
        messageStatus: MessageStatus.initial, messages: const <Message>[]);
  }

  @override
  List<Object> get props => [messageStatus, messages];

  @override
  String toString() =>
      'MessageState(messageStatus: $messageStatus, messages: $messages)';

  MessageState copyWith({
    MessageStatus? messageStatus,
    List<Message>? messages,
  }) {
    return MessageState(
      messageStatus: messageStatus ?? this.messageStatus,
      messages: messages ?? this.messages,
    );
  }
}
