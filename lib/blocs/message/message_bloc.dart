import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:Plantfix/modals/message.dart';
import 'package:Plantfix/repositories/message_repositry.dart';

part 'message_event.dart';
part 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  final MessageRepository messageRepository;
  MessageBloc({required this.messageRepository})
      : super(MessageState.initial()) {
    on<GetMessage>((event, emit) async {
      emit(state.copyWith(messageStatus: MessageStatus.loading));
      try {
        final messages =
            await messageRepository.getMessages(event.discussionId);
        emit(state.copyWith(
            messages: messages, messageStatus: MessageStatus.loaded));
      } catch (e) {
        emit(state.copyWith(messageStatus: MessageStatus.error));
      }
    });

    on<SendMessage>((event, emit) async {
      try {
        final resmessage = await messageRepository.sendMessages(
            event.discussionId, event.message);
        emit(state.copyWith(
            messages: [...state.messages, resmessage],
            messageStatus: MessageStatus.loaded));
      } catch (e) {
        emit(state.copyWith(messageStatus: MessageStatus.error));
      }
    });
  }
}
