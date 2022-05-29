import 'package:bloc/bloc.dart';
import 'package:Plantfix/modals/custom_error.dart';
import 'package:Plantfix/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final AuthRepository authRepository;
  SignupBloc({required this.authRepository}) : super(SignupState.initial()) {
    on<SignUp>((event, emit) async {
      emit(state.copyWith(signupStatus: SignupStatus.submitting));
      try {
        await authRepository.authenticateUser(
            event.username, event.email, event.password1, event.password2);
        emit(state.copyWith(signupStatus: SignupStatus.success));
      } on CustomError catch (e) {
        emit(state.copyWith(signupStatus: SignupStatus.error, error: e));
      }
    });
    on<RegisterEvent>((event, emit) async {
      emit(state.copyWith(signupStatus: SignupStatus.submitting));
      try {
        final pk = await authRepository.signup(
            event.username, event.email, event.password1, event.password2);
        emit(state.copyWith(signupStatus: SignupStatus.success, pk: pk));
      } on CustomError catch (e) {
        emit(state.copyWith(signupStatus: SignupStatus.error, error: e));
      }
    });
    on<VerifyUser>((event, emit) async {
      emit(state.copyWith(signupStatus: SignupStatus.verifying));
      try {
        await authRepository.verifyuser(event.otp, state.pk);
        emit(state.copyWith(signupStatus: SignupStatus.verified));
      } on CustomError catch (e) {
        emit(state.copyWith(signupStatus: SignupStatus.error, error: e));
      }
    });
  }
}
