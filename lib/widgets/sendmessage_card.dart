import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Plantfix/blocs/message/message_bloc.dart';

class SendMessageCard extends StatefulWidget {
  const SendMessageCard({Key? key, required this.discussionId})
      : super(key: key);
  final int discussionId;

  @override
  _SendMessageCardState createState() => _SendMessageCardState();
}

class _SendMessageCardState extends State<SendMessageCard> {
  final TextEditingController _message = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      height: 61,
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(35.0),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 3), blurRadius: 5, color: Colors.grey)
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _message,
                      validator: (value) {
                        if (value!.isEmpty) return "Cannot be empty";
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                          hintText: "Type Something...",
                          hintStyle: TextStyle(color: Colors.blueAccent),
                          border: InputBorder.none),
                    ),
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.send,
                        color: Colors.blueAccent,
                      ),
                      onPressed: () {
                        context.read<MessageBloc>().add(SendMessage(
                            discussionId: widget.discussionId.toString(),
                            message: _message.text));
                        FocusManager.instance.primaryFocus?.unfocus();
                        _message.clear();
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
