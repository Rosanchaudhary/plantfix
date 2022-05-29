import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:Plantfix/blocs/result/result_bloc.dart';
import 'package:Plantfix/constants.dart';

class ResultScreen extends StatefulWidget {
  final String id;
  const ResultScreen({Key? key, required this.id}) : super(key: key);

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  ScrollController? _controller;

  @override
  void initState() {
    context.read<ResultBloc>().add(GetResult(id: widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResultBloc, ResultState>(
      builder: (context, state) {
        if (state.resultStatus == ResultStatus.loading) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (state.resultStatus == ResultStatus.loaded) {
          return Scaffold(
            body: CustomScrollView(
              controller: _controller,
              slivers: [
                SliverAppBar(
                  leading: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: kWhiteGrey.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(30)),
                    child: InkWell(
                      child: Icon(CupertinoIcons.multiply,
                          color: Colors.white, size: 30),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  backgroundColor: Colors.white,
                  stretch: true,
                  primary: false,
                  pinned: true,
                  floating: true,
                  elevation: 0,
                  expandedHeight: MediaQuery.of(context).size.height * 1 / 3,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Padding(
                      padding: const EdgeInsets.only(
                        bottom: kPadding / 3,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: FadeInImage.assetNetwork(
                          placeholder: 'assets/images/placeholders.gif',
                          image: '${state.result.image}',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Text(
                      "${state.result.name}",
                      style: TextStyle(fontSize: 25, color: Colors.black),
                    ),
                    //titlePadding: EdgeInsetsDirectional.only(bottom: 10, start: 10),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Padding(
                        padding: const EdgeInsets.all(kPadding / 3),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                            color: Colors.grey.withOpacity(0.2),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white,
                                blurRadius: 3.50,
                                spreadRadius: 3,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(kPadding),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: [
                                    Icon(FontAwesomeIcons.leaf),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Symptoms",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text('${state.result.symptoms}',
                                    textAlign: TextAlign.justify),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Icon(FontAwesomeIcons.bookMedical),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Recommendation",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text('${state.result.recommendations}',
                                    textAlign: TextAlign.justify),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    Icon(FontAwesomeIcons.bookMedical),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Organic Control",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text('${state.result.organiccontrol}',
                                    textAlign: TextAlign.justify),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    Icon(FontAwesomeIcons.bookMedical),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Chemical Control",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text('${state.result.chemicalcontrol}',
                                    textAlign: TextAlign.justify),
                                SizedBox(
                                  height: 8,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
