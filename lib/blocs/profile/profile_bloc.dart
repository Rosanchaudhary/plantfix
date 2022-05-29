import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:Plantfix/repositories/auth_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final AuthRepository authRepository;
  ProfileBloc({required this.authRepository}) : super(ProfileState.initial()) {
    on<GetUserDataEvent>((event, emit) async {
      final storage = new FlutterSecureStorage();
      String? value = await storage.read(key: "x-auth-token");
      emit(state.copyWith(profileStatus: ProfileStatus.loading));
      if (value != null) {
        final profile = await authRepository.getUserData();
        emit(state.copyWith(
            profileStatus: ProfileStatus.loaded,
            username: profile.username,
            email: profile.email));
      } else {
        emit(state.copyWith(profileStatus: ProfileStatus.unauthenticated));
      }
    });
    on<GetProfileEvent>((event, emit) async {
      final storage = new FlutterSecureStorage();
      String? value = await storage.read(key: "x-auth-token");

      if (value != null) {
        emit(state.copyWith(profileStatus: ProfileStatus.authenticated));
      } else {
        emit(state.copyWith(profileStatus: ProfileStatus.unauthenticated));
      }
    });
    on<Logout>((event, emit) {
      final storage = new FlutterSecureStorage();
      storage.deleteAll();
      emit(state.copyWith(profileStatus: ProfileStatus.unauthenticated));
    });
  }
}
