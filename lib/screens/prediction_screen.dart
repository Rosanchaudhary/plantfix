import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:Plantfix/blocs/predection/predection_bloc.dart';
import 'package:Plantfix/screens/result.dart';

class Prediction extends StatefulWidget {
  const Prediction({required this.imagePath});

  final String imagePath;

  @override
  _PredictionState createState() => _PredictionState();
}

class _PredictionState extends State<Prediction> {
  late Future<String> name;
  late File image;
  List<String> Categories = ['Healthy', 'LeafBlast', 'Hispa', 'BrownSpot'];

  @override
  void initState() {
    super.initState();
    image = File(widget.imagePath);
    context.read<PredectionBloc>().add(PredictImage(image: image));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: context
                  .watch<PredectionBloc>()
                  .state
                  .predectionStatus ==
              PredectionStatus.loaded
          ? FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultScreen(
                              id: context.watch<PredectionBloc>().state.label,
                            )));
              },
              label: const Text('View Description'),
              icon: const Icon(Icons.send),
              backgroundColor: Colors.green,
            )
          : null,
      appBar: AppBar(
        leading: Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.24),
              borderRadius: BorderRadius.circular(30)),
          child: InkWell(
            child: Icon(
              CupertinoIcons.back,
              color: Colors.black,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(
          "Predicted Image",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(),
              height: MediaQuery.of(context).size.height * 0.65,
              width: MediaQuery.of(context).size.width,
              child: Image.file(
                File(widget.imagePath),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            BlocBuilder<PredectionBloc, PredectionState>(
              builder: (context, state) {
                if (state.predectionStatus == PredectionStatus.loading) {
                  return CircularProgressIndicator();
                }
                if (state.predectionStatus == PredectionStatus.loaded) {
                  return Center(
                    child: Text('${Categories[int.parse(state.label)]}'),
                  );
                }
                return CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}
