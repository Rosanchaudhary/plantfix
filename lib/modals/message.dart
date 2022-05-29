import 'package:Plantfix/modals/creator_model.dart';

class Message {
  int id;
  String message;
  Creator created;

  Message({required this.id, required this.message, required this.created});

  Message.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        message = json['message'],
        created = Creator.fromJson(json['sender']);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'message': message,
      'created': created,
    };
  }
}

    // {
    //     "id": 1,
    //     "message": "I am contacting you because I work for Adam at GuaranteedBusinessFunding.org , and we offer business",
    //     "created": "2022-02-13T06:49:24.693099Z",
    //     "sender": 1
    // },