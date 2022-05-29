part of 'signup_bloc.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();
  @override
  List<Object?> get props => [];
}

class SignUp extends SignupEvent {
  final String email;
  final String username;
  final String password1;
  final String password2;
  SignUp({
    required this.email,
    required this.username,
    required this.password1,
    required this.password2,
  });
}

class RegisterEvent extends SignupEvent {
  final String email;
  final String username;
  final String password1;
  final String password2;
  RegisterEvent({
    required this.email,
    required this.username,
    required this.password1,
    required this.password2,
  });
}

class VerifyUser extends SignupEvent {
  final String otp;
  VerifyUser({
    required this.otp,
  });
}
