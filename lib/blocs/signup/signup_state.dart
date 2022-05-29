part of 'signup_bloc.dart';

enum SignupStatus {
  intitial,
  submitting,
  success,
  error,
  verified,
  unverified,
  verifying
}

class SignupState extends Equatable {
  final SignupStatus signupStatus;
  final CustomError error;
  final String pk;
  SignupState({required this.signupStatus, required this.error,required this.pk});

  factory SignupState.initial() {
    return SignupState(
        signupStatus: SignupStatus.intitial, error: CustomError(),pk: '');
  }

  @override
  List<Object> get props => [signupStatus, error,pk];

  @override
  String toString() =>
      'SignupState(signupStatus: $signupStatus, error: $error,pk:$pk)';

  SignupState copyWith({
    SignupStatus? signupStatus,
    CustomError? error,
    String? pk
  }) {
    return SignupState(
      signupStatus: signupStatus ?? this.signupStatus,
      error: error ?? this.error,
      pk: pk ?? this.pk
    );
  }
}
