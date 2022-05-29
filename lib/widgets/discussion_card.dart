import 'package:flutter/material.dart';
import 'package:Plantfix/constants.dart';

class DiscussionCard extends StatelessWidget {
  const DiscussionCard(
      {Key? key,
      required this.id,
      required this.name,
      required this.about,
      required this.image,
      required this.username})
      : super(key: key);
  final int id;
  final String name;
  final String about;
  final String image;
  final String username;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.45,
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: kPrimaryColor.withOpacity(0.1),
            blurRadius: 3.50,
            spreadRadius: 3,
            offset: Offset(0, 3),
          )
        ],
      ),
      margin: EdgeInsets.all(kPadding / 2),
      child: Column(
        children: <Widget>[
          Flexible(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/images/placeholders.gif',
                    image: "https://res.cloudinary.com/deydgwesp/${image}",
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(kPadding / 3),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                            'https://cdn1.vectorstock.com/i/1000x1000/31/95/user-sign-icon-person-symbol-human-avatar-vector-12693195.jpg',
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, left: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${username} . Pokhara",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontSize: 15.0,
                                    color: Colors.black,
                                  )),
                          SizedBox(
                            height: 2,
                          ),
                          Text("2020.11.2",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(
                                    fontSize: 12.0,
                                    color: Colors.black,
                                  )),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: <Widget>[
                    Flexible(
                        child: Text(
                      name,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: Colors.black, fontSize: 18.0),
                    )),
                  ],
                ),
                SizedBox(height: 5.0),
                Wrap(
                  children: <Widget>[
                    Text(
                      about,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                      textAlign: TextAlign.justify,
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          color: Colors.black.withOpacity(0.5), fontSize: 15.0),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
