import 'package:equatable/equatable.dart';

class Profile extends Equatable{
  final String username;
  final String email;
  Profile({
    required this.username,
    required this.email,
  }); 

 factory Profile.fromJson(dynamic json,) {
    return Profile(username: json['username'], email: json["email"]);
  }

  @override
  List<Object?> get props => [username,email];
}
