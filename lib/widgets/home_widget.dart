import 'package:Plantfix/constants.dart';
import 'package:Plantfix/widgets/weather_card.dart';

import '../widgets/scan_card_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/title_text.dart';
import '../widgets/search_and_notification.dart';
// import '../widgets/weather_card.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.all(kPadding / 10),
              child: SearchAndNotification(),
            ),
            TitleText(
              title: "Find the diseases",
            ),
            ScanCardHome(),
            TitleText(title: "Weather"),
            WeatherCard(),
          ]),
        )
      ],
    );
  }
}
