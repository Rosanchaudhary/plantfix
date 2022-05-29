import 'package:flutter/material.dart';
import 'package:Plantfix/constants.dart';

class SearchAndNotification extends StatelessWidget {
  const SearchAndNotification({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(kPadding),
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.1,
          child: TextField(
              decoration: kTextFieldDecoration.copyWith(
                  hintText: "Search",
                  prefixIcon: Icon(
                    Icons.search_sharp,
                    color: kPrimaryColor,
                  ))),
        ),
        Expanded(
          child: Icon(Icons.notifications_none_outlined,
              color: kPrimaryColor, size: 38),
        ),
      ],
    );
  }
}
