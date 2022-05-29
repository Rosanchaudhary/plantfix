import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UnorderedList extends StatelessWidget {
  UnorderedList({required this.texts,required this.fontSize});
  final List<String> texts;
  double fontSize=10;
  @override

  Widget build(BuildContext context) {
    var widgetList = <Widget>[];
    for (var text in texts) {
      widgetList.add(UnorderedListItem(fontSize: fontSize,text: text,));
      widgetList.add(SizedBox(
        height: 5,
      ));
    }
    return Column(
      children: widgetList,
    );
  }
}

// ignore: must_be_immutable
class UnorderedListItem extends StatelessWidget {
  UnorderedListItem({required this.text,required  this.fontSize});
  final String text;
  double fontSize=10;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("• "),
        Expanded(
          child: Text(text,style: TextStyle(fontSize: fontSize),textAlign: TextAlign.justify,),
        ),
      ],
    );
  }
}
