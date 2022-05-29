part of 'profile_bloc.dart';

enum ProfileStatus { authenticated, unauthenticated,loading,loaded }

class ProfileState extends Equatable {
  final ProfileStatus profileStatus;
  final String username;
  final String email;

  ProfileState({required this.profileStatus, required this.username,required this.email});

  factory ProfileState.initial() {
    return ProfileState(
        profileStatus: ProfileStatus.unauthenticated, username: '',email: '');
  }

  @override
  List<Object> get props => [profileStatus,username];

  @override
  String toString() => 'ProfileState(profileStatus: $profileStatus,username:$username)';

  ProfileState copyWith({
    ProfileStatus? profileStatus,
    final String? username,
    final String? email
  }) {
    return ProfileState(
      profileStatus: profileStatus ?? this.profileStatus,
      email: email ?? this.email,
      username: username ?? this.username
    );
  }
}
