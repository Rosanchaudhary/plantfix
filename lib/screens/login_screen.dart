import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Plantfix/blocs/login/login_bloc.dart';
import 'package:Plantfix/constants.dart';
import 'package:Plantfix/utils/error_dialog.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void progressDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        body: BlocConsumer<LoginBloc, SigninState>(
          listener: (context, state) {
            if (state.signinStatus == SigninStatus.error) {
              errorDialog(context, state.error);
            }
            if (state.signinStatus == SigninStatus.success) {
              Navigator.pushNamed(context, '/');
            }
            if (state.signinStatus == SigninStatus.submitting) {
              progressDialog(context);
            }
          },
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.only(left: kPadding, right: kPadding),
              child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: _formKey,
                  child: ListView(
                    children: <Widget>[
                      Align(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(30)),
                            child: InkWell(
                              child: Icon(
                                CupertinoIcons.multiply,
                                size: 30,
                              ),
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                          alignment: Alignment.topLeft),
                      Container(
                          height: MediaQuery.of(context).size.height / 4,
                          width: MediaQuery.of(context).size.width / 4,
                          child: Image.asset(
                            'assets/images/splash.png',
                          )),
                      Container(
                        child: Text(
                          "SIGN IN",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.green,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      TextFormField(
                        controller: _username,
                        validator: (value) {
                          if (value!.isEmpty) return "Cannot be empty";
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        textAlign: TextAlign.left,
                        decoration: kTextFieldDecoration.copyWith(
                            labelText: "Username*"),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        textAlign: TextAlign.left,
                        obscureText: true,
                        controller: _password,
                        validator: (value) {
                          if (value!.isEmpty) return "Cannot be empty";
                          return null;
                        },
                        decoration: kTextFieldDecoration.copyWith(
                            labelText: "Password*"),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Center(
                        child: InkWell(
                          onTap: () {
                            if (_username.text.isEmpty ||
                                _password.text.isEmpty) {
                              null;
                            } else {
                              context.read<LoginBloc>().add(SignIn(
                                  username: _username.text,
                                  password: _password.text));
                            }
                          },
                          child: Container(
                            height: 40,
                            width: 160,
                            decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    width: 2.0, color: Colors.greenAccent)),
                            child: Center(child: Text("Sign Up")),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Center(
                        child: TextButton(
                          onPressed: () {
                            Navigator.popAndPushNamed(context, '/register');
                          },
                          child: Text(
                            "Sign up instead",
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                      ),
                    ],
                  )),
            );
          },
        ),
      ),
    );
  }
}
