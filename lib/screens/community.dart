import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:Plantfix/blocs/community/community_bloc.dart';
import 'package:Plantfix/blocs/profile/profile_bloc.dart';
import 'package:Plantfix/constants.dart';
import 'package:Plantfix/modals/custom_error.dart';
import 'package:Plantfix/modals/discussion.dart';
import 'package:Plantfix/screens/message_screen.dart';
import 'package:Plantfix/utils/error_dialog.dart';
import 'package:Plantfix/widgets/discussion_card.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({Key? key}) : super(key: key);

  @override
  _CommunityScreenState createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  late Future<List<Discussion>> discussions;

  @override
  void initState() {
    super.initState();
    context.read<CommunityBloc>().add(GetAllCommunity());
    context.read<ProfileBloc>().add(GetProfileEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            context.read<ProfileBloc>().state.profileStatus ==
                    ProfileStatus.authenticated
                ? Navigator.of(context).pushNamed('/askCommunity')
                : errorDialog(context, CustomError(message: "Login Required"));
          },
          hoverColor: kPrimaryColor.withOpacity(0.8),
          label: const Text("New"),
          icon: const Icon(FontAwesomeIcons.plusCircle),
          backgroundColor: kPrimaryColor),
      body: BlocBuilder<CommunityBloc, CommunityState>(
        builder: (context, state) {
          if (state.communityStatus == CommunityStatus.loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.communityStatus == CommunityStatus.loaded) {
            return ListView.builder(
                itemCount: state.discussion.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MessageScreen(
                                    discussionId: state.discussion[index].id,
                                  )));
                    },
                    child: DiscussionCard(
                      id: state.discussion[index].id,
                      name: state.discussion[index].name,
                      about: state.discussion[index].about,
                      image: state.discussion[index].image,
                      username: state.discussion[index].creater.username,
                    ),
                  );
                });
          }
          return Container(
            child: Center(
              child: Text("Something Went Wrong!!!"),
            ),
          );
        },
      ),
    );
  }
}
