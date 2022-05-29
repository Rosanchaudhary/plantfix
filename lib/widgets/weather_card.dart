import 'dart:convert';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:Plantfix/constants.dart';

class WeatherCard extends StatefulWidget {
  // final double lat;
  // final double lon;
  const WeatherCard({
    Key? key,
  }) : super(key: key);

  @override
  _WeatherCardState createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kPadding * 0.9),
      child: Container(
        padding:
            EdgeInsets.fromLTRB(kPadding, kPadding / 2, kPadding, kPadding / 2),
        height: MediaQuery.of(context).size.height * 0.25,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: kPrimaryColor.withOpacity(0.5),
                blurRadius: 3.50,
                spreadRadius: 3,
                offset: Offset(0, 3),
              )
            ]),
        child: FutureBuilder(
            future: _getWeather(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Center(
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          'assets/logos/sad.svg',
                          height: 100,
                          width: 100,
                        ),
                        Text(
                          "Cannot fetch the weather.Enable location services",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(fontSize: 15.0),
                        )
                      ],
                    ),
                  );
                } else if (snapshot.hasData) {
                  var response = snapshot.data.toString();
                  Map<String, dynamic> data = jsonDecode(response);
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Today, ${data['date']}",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(fontSize: 15.0),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "${data['temperature']}°C",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2!
                                    .copyWith(fontSize: 50.0),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Sunset ${data['sunset']}PM",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(fontSize: 15.0),
                              )
                            ],
                          ),
                          Container(
                            height: 100.0,
                            width: 100.0,
                            child: Image.network(
                              'http://openweathermap.org/img/w/${data['icon']}.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 2.0,
                        color: Colors.black,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("${data['description']}".toUpperCase()),
                          FaIcon(FontAwesomeIcons.cloudRain),
                        ],
                      )
                    ],
                  );
                }
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
    );
  }
}

Future<dynamic> _getWeather() async {
  Position _position = await getCurrentLocation();
  double lat = _position.latitude;
  double lon = _position.longitude;
  final URL =
      Uri.parse("http://plantfix.pythonanywhere.com/getWeather/$lat/$lon");

  var response = await http.get(URL);

  return response.body;
}

// Future<Position> _getLocation() async {
//   bool serviceEnabled;
//   LocationPermission permission;
//   Position _position;
//   serviceEnabled = await Geolocator.isLocationServiceEnabled();
//   if (!serviceEnabled) {
//     print("Location not enabled ");
//   }
//   permission = await Geolocator.checkPermission();
//   if (permission == LocationPermission.denied) {
//     permission = await Geolocator.requestPermission();
//   }
//   if (permission == LocationPermission.deniedForever ||
//       permission == LocationPermission.denied) {
//     _position = (await Geolocator.getLastKnownPosition())!;
//     return _position;
//   } else {
//     _position = await Geolocator.getCurrentPosition();
//     return _position;
//   }
// }

Future<Position> getCurrentLocation() async {
  Position position = await Geolocator.getCurrentPosition(
      forceAndroidLocationManager: true,
      desiredAccuracy: LocationAccuracy.lowest);

  return position;
}
