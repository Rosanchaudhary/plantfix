import 'package:flutter/material.dart';
import 'package:Plantfix/constants.dart';
import 'package:Plantfix/modals/creator_model.dart';

class MessageCard extends StatelessWidget {
  const MessageCard(
      {Key? key,
      required this.id,
      required this.message,
      required this.created,
      required this.sender})
      : super(key: key);
  final String id;
  final String message;
  final Creator created;
  final int sender;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3))
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: EdgeInsets.all(kPadding / 3),
      child: Column(
        children: <Widget>[
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
                          Text(created.username,
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
                      message,
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
                      created.username,
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
