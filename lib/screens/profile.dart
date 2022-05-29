import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Plantfix/blocs/profile/profile_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    context.read<ProfileBloc>().add(GetProfileEvent());
    context.read<ProfileBloc>().add(GetUserDataEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3))
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    CircleAvatar(
                      minRadius: 40,
                      maxRadius: 50,
                      backgroundImage: NetworkImage(
                        'https://cdn1.vectorstock.com/i/1000x1000/31/95/user-sign-icon-person-symbol-human-avatar-vector-12693195.jpg',
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text(
                            context.watch<ProfileBloc>().state.profileStatus ==
                                    ProfileStatus.unauthenticated
                                ? 'Not Logged in'
                                : context.watch<ProfileBloc>().state.username,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child:
                              context.watch<ProfileBloc>().state.username == ''
                                  ? Text("Join Plantfix Community")
                                  : Text(''),
                        ),
                        context.watch<ProfileBloc>().state.profileStatus ==
                                ProfileStatus.loaded
                            ? Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: GestureDetector(
                                  onTap: () =>
                                      context.read<ProfileBloc>().add(Logout()),
                                  child: Container(
                                    height: 40,
                                    width: 160,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            width: 2.0,
                                            color: Colors.greenAccent)),
                                    child: Center(child: Text("Logout")),
                                  ),
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: GestureDetector(
                                  onTap: () =>
                                      Navigator.pushNamed(context, '/login'),
                                  child: Container(
                                    height: 40,
                                    width: 160,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            width: 2.0,
                                            color: Colors.greenAccent)),
                                    child: Center(child: Text("Sign In")),
                                  ),
                                ),
                              )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
