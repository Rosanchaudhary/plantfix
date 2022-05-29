import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:Plantfix/modals/custom_error.dart';
import 'package:Plantfix/repositories/auth_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, SigninState> {
  final AuthRepository authRepository;
  LoginBloc({required this.authRepository}) : super(SigninState.initial()) {
    on<SignIn>((event, emit) async {
      emit(state.copyWith(signinStatus: SigninStatus.submitting));
      try {
        await authRepository.loginUser(event.username, event.password);
        emit(state.copyWith(signinStatus: SigninStatus.success));
      } on CustomError catch (e) {
        emit(state.copyWith(signinStatus: SigninStatus.error, error: e));
      }
    });
  }
}
