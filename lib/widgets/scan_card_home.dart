// import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:Plantfix/constants.dart';

class ScanCardHome extends StatelessWidget {
  const ScanCardHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kPadding * 0.9),
      child: Container(
          padding: EdgeInsets.fromLTRB(
              kPadding, kPadding / 2, kPadding, kPadding / 2),
          height: MediaQuery.of(context).size.height * 0.35,
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
          child: Padding(
            padding: const EdgeInsets.all(kPadding / 2),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Flexible(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SvgPicture.asset(
                            'assets/logos/scan.svg',
                            height: 60.0,
                            width: 60.0,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Take a picture",
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: Colors.black, fontSize: 15.0),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Column(
                        children: [
                          Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: 50,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SvgPicture.asset(
                            'assets/logos/report.svg',
                            height: 60.0,
                            width: 60.0,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "See Diagnosis",
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: Colors.black, fontSize: 15.0),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Column(
                        children: [
                          Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: 50,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SvgPicture.asset(
                            'assets/logos/medicine.svg',
                            height: 60.0,
                            width: 60.0,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Get Medicine",
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: Colors.black, fontSize: 15.0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Flexible(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/camera');
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.camera_alt_outlined,
                          size: 30.0,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Take a Picture",
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ],
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(kPrimaryColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35),
                          // side: BorderSide(color: Colors.green)
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
