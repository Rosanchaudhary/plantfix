import 'package:flutter/material.dart';
import 'package:Plantfix/constants.dart';

class TitleText extends StatelessWidget {
  final String title;
  const TitleText({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kPadding),
      child: Stack(
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
        ],
      ),
    );
  }
}
