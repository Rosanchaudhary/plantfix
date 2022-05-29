import 'package:Plantfix/repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Plantfix/blocs/message/message_bloc.dart';
import 'package:Plantfix/blocs/result/result_bloc.dart';
import 'package:Plantfix/blocs/community/community_bloc.dart';
import 'package:Plantfix/blocs/login/login_bloc.dart';
import 'package:Plantfix/blocs/predection/predection_bloc.dart';
import 'package:Plantfix/blocs/profile/profile_bloc.dart';
import 'package:Plantfix/blocs/signup/signup_bloc.dart';
import 'package:Plantfix/repositories/ask_community.dart';
import 'package:Plantfix/repositories/message_repositry.dart';
import 'package:Plantfix/repositories/predictimage_repository.dart';
import 'package:Plantfix/repositories/result_repo.dart';
import 'package:Plantfix/screens/askcommunity_screen.dart';
import 'package:Plantfix/screens/home_screen.dart';
import 'package:Plantfix/screens/login_screen.dart';
import 'package:Plantfix/screens/otp_screen.dart';
import 'package:Plantfix/screens/register_screen.dart';
import 'screens/camera.dart';
import 'screens/result.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  //SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(
            create: (context) => AuthRepository()),
        RepositoryProvider<AskCommunityRepository>(
            create: ((context) => AskCommunityRepository())),
        RepositoryProvider<PredictImageRepository>(
            create: ((context) => PredictImageRepository())),
        RepositoryProvider<ResultRepository>(
            create: (((context) => ResultRepository()))),
        RepositoryProvider<MessageRepository>(
            create: (context) => MessageRepository())
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<SignupBloc>(
              create: (context) =>
                  SignupBloc(authRepository: context.read<AuthRepository>())),
          BlocProvider<LoginBloc>(
              create: (context) =>
                  LoginBloc(authRepository: context.read<AuthRepository>())),
          BlocProvider<CommunityBloc>(
              create: (context) => CommunityBloc(
                  askCommunity: context.read<AskCommunityRepository>())),
          BlocProvider<PredectionBloc>(
              create: (context) => PredectionBloc(
                  predictImageRepository:
                      context.read<PredictImageRepository>())),
          BlocProvider<ProfileBloc>(
              create: (context) =>
                  ProfileBloc(authRepository: context.read<AuthRepository>())),
          BlocProvider<ResultBloc>(
              create: (((context) =>
                  ResultBloc(repository: context.read<ResultRepository>())))),
          BlocProvider<MessageBloc>(
              create: (context) => MessageBloc(
                  messageRepository: context.read<MessageRepository>()))
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: 'Gotham'),
          // home: QuestionDetails(),
          initialRoute: '/',
          routes: {
            '/': (context) => HomeScreen(),
            '/login': (context) => Login(),
            '/register': (context) => Register(),
            '/camera': (context) => CameraScreen(),
            '/result': (context) => ResultScreen(
                  id: '',
                ),
            '/askCommunity': (context) => AskCommunity(),
            '/otp': (context) => OTPScreen()
          },
        ),
      ),
    );
  }
}
