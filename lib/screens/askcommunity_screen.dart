import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:Plantfix/blocs/community/community_bloc.dart';
import 'package:Plantfix/constants.dart';
import 'package:Plantfix/utils/error_dialog.dart';

class AskCommunity extends StatefulWidget {
  const AskCommunity({Key? key}) : super(key: key);

  @override
  _AskCommunityState createState() => _AskCommunityState();
}

class _AskCommunityState extends State<AskCommunity> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _title = TextEditingController();
  final TextEditingController _description = TextEditingController();
  bool _imagePresent = false;
  late String _imagePath;

  late String statusCode;
  void _handleSubmitted() async {
    final FormState? form = _formKey.currentState;
    if (!form!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Please fix the errors before submitting.'),
      ));
    } else {
      form.save();
      context.read<CommunityBloc>().add(AskToCommunity(
          image: _imagePath, title: _title.text, about: _description.text));
      // statusCode = await askCommunity(_title.text, _description.text);
      // if (statusCode == '200' || statusCode == "201") {
      //   Navigator.pop(context);
      // } else {
      //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //     content: Text('Please fix the errors in red before submitting.'),
      //   ));
      // }
    }
  }

  final picker = ImagePicker();
  Future<void> _openImagePicker(ImageSource source) async {
    HapticFeedback.heavyImpact();
    final pickedImage = await picker.pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        _imagePath = pickedImage.path;
        _imagePresent = true;
      });
    }
  }

  void progressDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CommunityBloc, CommunityState>(
      listener: (context, state) {
        if (state.communityStatus == CommunityStatus.error) {
          errorDialog(context, state.error);
        }
        if (state.communityStatus == CommunityStatus.success) {
          Navigator.pushNamed(context, '/');
        }
        if (state.communityStatus == CommunityStatus.submitting) {
          progressDialog(context);
        }
      },
      builder: (context, state) {
        return Scaffold(
            key: _scaffoldKey,
            resizeToAvoidBottomInset: true,
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
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              title:
                  Text("Ask Community", style: TextStyle(color: Colors.black)),
            ),
            body: ListView(
              padding: const EdgeInsets.only(top: kPadding, bottom: kPadding),
              children: [
                // !_imagePresent
                //     ? Text(
                //         "Add an image to your post",
                //         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                //       )
                //     : SizedBox(
                //         height: 0,
                //         width: 0,
                //       ),
                _imagePresent
                    ? Stack(
                        alignment: AlignmentDirectional.topEnd,
                        children: [
                          Image.file(
                            File(_imagePath),
                            height: MediaQuery.of(context).size.height / 3,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          Container(
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.24),
                                borderRadius: BorderRadius.circular(40)),
                            child: InkWell(
                              child: Icon(
                                CupertinoIcons.trash,
                                color: Colors.white,
                                size: 25,
                              ),
                              onTap: () {
                                HapticFeedback.heavyImpact();
                                setState(() {
                                  _imagePresent = false;
                                });
                              },
                            ),
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              _openImagePicker(ImageSource.gallery);
                            },
                            child: Container(
                              height: 80,
                              width: 100,
                              color: kPrimaryColor,
                              child: Center(
                                child: Text(
                                  'Gallery',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              _openImagePicker(ImageSource.camera);
                            },
                            child: Container(
                              height: 80,
                              width: 100,
                              color: kPrimaryColor,
                              child: Center(
                                child: Text(
                                  'Camera',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                SizedBox(
                  height: 10,
                ),
                Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: _formKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        TextFormField(
                          controller: _title,
                          validator: (value) {
                            if (value!.isEmpty) return "Cannot be empty";
                            return null;
                          },
                          maxLines: 3,
                          maxLength: 200,
                          keyboardType: TextInputType.text,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            hintText: "Enter the title of your problem",
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.zero),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: kPrimaryColor, width: 1.0),
                              borderRadius: BorderRadius.all(Radius.zero),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.greenAccent, width: 2.0),
                              borderRadius: BorderRadius.all(Radius.zero),
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: _description,
                          validator: (value) {
                            if (value!.isEmpty) return "Cannot be empty";
                            return null;
                          },
                          maxLines: 10,
                          maxLength: 3000,
                          keyboardType: TextInputType.text,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            hintText:
                                "Add a more detailed description of your problem.",
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.zero),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: kPrimaryColor, width: 1.0),
                              borderRadius: BorderRadius.all(Radius.zero),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.greenAccent, width: 2.0),
                              borderRadius: BorderRadius.all(Radius.zero),
                            ),
                          ),
                        ),
                      ]),
                ),
              ],
            ),
            persistentFooterButtons: [
              FloatingActionButton.extended(
                backgroundColor: kPrimaryColor,
                onPressed: () {
                  _handleSubmitted();
                },
                label: Text("Submit"),
              ),
            ]);
      },
    );
  }
}



  // Future<String> askCommunity(String name, String about) async {
  //   final storage = new FlutterSecureStorage();
  //   String? value = await storage.read(key: "x-auth-token");
  //   String token = "Bearer " + value!;

  //   final respnse = await http.post(
  //       Uri.parse('https://plantfixapp.herokuapp.com/discussion/list/'),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //         HttpHeaders.authorizationHeader: token
  //       },
  //       body: jsonEncode(<String, String>{"name": name, "about": about}));

  //   return respnse.statusCode.toString();
  // }