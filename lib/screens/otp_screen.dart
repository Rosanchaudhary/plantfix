import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Plantfix/blocs/signup/signup_bloc.dart';
import 'package:Plantfix/constants.dart';
import 'package:Plantfix/utils/error_dialog.dart';

class OTPScreen extends StatefulWidget {
  static const routName = '/otp';
  const OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _otp = TextEditingController();

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
        if (state.signupStatus == SignupStatus.verified) {
          Navigator.pushNamed(context, '/');
        }
        if (state.signupStatus == SignupStatus.verifying) {
          progressDialog(context);
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Container(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 200,
                  ),
                  Text(
                    "Check Your Email For OTP",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 200,
                  ),
                  TextFormField(
                    controller: _otp,
                    validator: (value) {
                      if (value!.isEmpty) return "Cannot be empty";
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.left,
                    decoration:
                        kTextFieldDecoration.copyWith(labelText: "OTP*"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_otp.text.isEmpty) {
                        null;
                      } else {
                        context.read<SignupBloc>().add(VerifyUser(
                              otp: _otp.text,
                            ));
                      }
                    },
                    child: Container(
                      width: 350,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.greenAccent,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Center(
                          child: Text(
                        "SUBMIT",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      )),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    ));
  }
}
