part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

class SignIn extends LoginEvent {
  final String username;
  final String password;

  SignIn({
    required this.username,
    required this.password,
  });

}
