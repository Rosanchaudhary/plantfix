// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xff5B8A72);
const kGrey = Color(0xff464F41);
const kBluishGrey = Color(0xff56776C);
const kWhiteGrey = Color(0xffBFCBA8);
const kPadding  = 15.0;



///THIS IS FOR INPUT FIELDS IN REGSTRATION AND SIGNUP SCREEN
const kTextFieldDecoration = InputDecoration(

  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kPrimaryColor, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.greenAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);








