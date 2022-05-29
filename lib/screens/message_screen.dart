import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Plantfix/blocs/message/message_bloc.dart';
import 'package:Plantfix/modals/message.dart';
import 'package:Plantfix/widgets/message_card.dart';
import 'package:Plantfix/widgets/sendmessage_card.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key, required this.discussionId}) : super(key: key);
  final int discussionId;

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  late Future<List<Message>> messages;

  void initState() {
    super.initState();

    context
        .read<MessageBloc>()
        .add(GetMessage(discussionId: widget.discussionId.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text("PLANTFIX"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.76,
              child: BlocBuilder<MessageBloc, MessageState>(
                builder: (context, state) {
                  if (state.messageStatus == MessageStatus.loading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state.messageStatus == MessageStatus.loaded) {
                    return ListView.builder(
                        itemCount: state.messages.length,
                        itemBuilder: (context, index) {
                          return MessageCard(
                            id: state.messages[index].id.toString(),
                            message: state.messages[index].message,
                            created: state.messages[index].created,
                            sender: 1,
                          );
                        });
                  }
                  return Container();
                },
              ),
            ),
            SendMessageCard(discussionId: widget.discussionId)
          ],
        ),
      ),
    );
  }
}
