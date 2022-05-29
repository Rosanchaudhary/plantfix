import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Plantfix/blocs/signup/signup_bloc.dart';

import 'package:Plantfix/constants.dart';
import 'package:Plantfix/utils/error_dialog.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool checkedStatus = false;
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  late Future<String> statusCode;

  void progressDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SignupBloc, SignupState>(
        listener: (context, state) {
          if (state.signupStatus == SignupStatus.error) {
            errorDialog(context, state.error);
          }
          if (state.signupStatus == SignupStatus.success) {
            //Navigator.pushNamed(context, '/');
            Navigator.pushNamed(context, '/otp');
          }
          if (state.signupStatus == SignupStatus.submitting) {
            progressDialog(context);
          }
        },
        builder: (context, state) {
          return Padding(
              padding: const EdgeInsets.all(16.0),
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
                        "SIGN UP",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.green,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 45.0,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) return "Enter a valid text";
                        return null;
                      },
                      controller: _email,
                      keyboardType: TextInputType.emailAddress,
                      decoration:
                          kTextFieldDecoration.copyWith(labelText: "Email*"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      readOnly: false,
                      validator: (value) {
                        if (value!.isEmpty) return "Enter a valid value";
                        return null;
                      },
                      controller: _username,
                      textAlign: TextAlign.left,
                      decoration:
                          kTextFieldDecoration.copyWith(labelText: "Username*"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _password,
                      validator: (value) {
                        if (value!.isEmpty) return "Enter a valid value";
                        return null;
                      },
                      textAlign: TextAlign.left,
                      obscureText: true,
                      decoration:
                          kTextFieldDecoration.copyWith(labelText: "Password*"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _confirmPassword,
                      validator: (value) {
                        if (value!.isEmpty) return "Enter a valid value";
                        if (value != _password.text)
                          return 'Passwords doesn\'t match';
                        return null;
                      },
                      textAlign: TextAlign.left,
                      obscureText: true,
                      decoration: kTextFieldDecoration.copyWith(
                          labelText: " Conform Password*"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: CheckboxListTile(
                        title: Text(
                          "I agree to terms and condition ",
                        ),
                        value: checkedStatus,
                        controlAffinity: ListTileControlAffinity.leading,
                        subtitle: !checkedStatus
                            ? Text(
                                'Required.',
                                style: TextStyle(color: Colors.red),
                              )
                            : null,
                        activeColor: Colors.lightGreen,
                        onChanged: (value) {
                          setState(() {
                            checkedStatus = value!;
                          });
                        },
                      ),
                    ),
                    Center(
                      child: InkWell(
                        onTap: checkedStatus
                            ? () {
                                // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                //   content: Text('Please fix the errors in red before submitting.'),
                                // ));
                                if (_formKey.currentState!.validate()) {
                                  context.read<SignupBloc>().add(RegisterEvent(
                                      email: _email.text,
                                      username: _username.text,
                                      password1: _password.text,
                                      password2: _confirmPassword.text));
                                }

                                // if (_formKey.currentState!.validate()) {
                                //   context.read<SignupBloc>().add(SignUp(
                                //       email: _email.text,
                                //       username: _username.text,
                                //       password1: _password.text,
                                //       password2: _confirmPassword.text));
                                // }
                              }
                            : null,
                        child: Container(
                          height: 40,
                          width: 160,
                          decoration: BoxDecoration(
                            color: checkedStatus ? kPrimaryColor : null,
                            borderRadius: BorderRadius.circular(20),
                          ),
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
                          Navigator.popAndPushNamed(context, '/login');
                        },
                        child: Text(
                          "Sign in instead",
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                    ),
                  ],
                ),
              ));
        },
      ),
    );
  }
}
