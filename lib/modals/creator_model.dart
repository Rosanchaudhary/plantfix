import 'package:equatable/equatable.dart';

class Creator extends Equatable{
  final String username;
  final String email;
  Creator({
    required this.username,
    required this.email,
  }); 

 factory Creator.fromJson(dynamic json,) {
    return Creator(username: json['username'], email: json["email"]);
  }

  @override
  List<Object?> get props => [username,email];
}
