import 'package:flutter/material.dart';
import 'package:Plantfix/constants.dart';

class QuestionDetails extends StatefulWidget {
  @override
  _QuestionDetailsState createState() => _QuestionDetailsState();
}

class _QuestionDetailsState extends State<QuestionDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // SliverAppBar(
          //   leading: InkWell(
          //     child: Icon(CupertinoIcons.multiply),
          //   ),
          //   expandedHeight: MediaQuery.of(context).size.height / 3.5,
          //   flexibleSpace: FlexibleSpaceBar(
          //     background: Image.network(
          //       'https://krishimala.com/sites/default/files/styles/catalogu/public/2018-07/rice%20blastaa.jpg?itok=QPeUU_rX',
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          // ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                // Container(
                //   decoration: BoxDecoration(
                //     color: Colors.white.withOpacity(0.2),
                //     boxShadow: [
                //       BoxShadow(
                //         color: Colors.white,
                //         blurRadius: 3.50,
                //         spreadRadius: 3,
                //         offset: Offset(0, 3),
                //       ),
                //     ],
                //   ),
                //   child: Padding(
                //     padding: const EdgeInsets.all(kPadding),
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.start,
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: <Widget>[
                //         Row(
                //           children: [
                //             CircleAvatar(
                //              backgroundColor: Colors.purple,
                //               radius: 39,
                //             ),
                //             Text(
                //               "Pukar Baral",
                //               style: TextStyle(
                //                 fontWeight: FontWeight.bold,
                //                 fontSize: 20,
                //               ),
                //             ),
                //           ],
                //         ),
                //         SizedBox(
                //           height: 8,
                //         ),
                //         UnorderedList(
                //           texts: [
                //             'The fungus attacks all aboveground parts of the rice plant.',
                //             'The lesions on leaf blade are elliptical or spindle shaped with brown borders and gray centers',
                //             'Depending on the site of symptom rice blast is referred as leaf blast, collar blast, node blast and neck blast.'
                //           ],
                //           fontSize: 15,
                //         ),
                //         Text(
                //             'The fungus attacks all aboveground parts of the rice plant. Depending on the site of symptom rice blast is referred as leaf blast, collar blast, node blast and neck blast. Inleaf blast, the lesions on leaf blade are elliptical or spindle shaped with brownborders and gray centers . Under favorable conditions, lesions enlarge andcoalesce eventually killing the leaves. Collar blast occurs when the pathogen infectsthe collar that can kill the entire leaf blade. The pathogen also infects the node of thestem that turns blackish and breaks easily; this condition is called node blast. Neckof the panicle can also be infected. Infected neck is girdled by a grayish brown lesionthat makes panicle fall over when infection is severe. The pathogen also causesbrown lesions on the branches of panicles and on the spikelets.',
                //             textAlign: TextAlign.justify),
                //         SizedBox(
                //           height: 20,
                //         ),
                //         Row(
                //           children: [
                //             Icon(FontAwesomeIcons.bookMedical),
                //             SizedBox(
                //               width: 10,
                //             ),
                //             Text(
                //               "Type:Fungus",
                //               style: TextStyle(
                //                 fontWeight: FontWeight.bold,
                //                 fontSize: 20,
                //               ),
                //             ),
                //           ],
                //         ),
                //         SizedBox(
                //           height: 8,
                //         ),
                //         UnorderedList(
                //           texts: ['Scientific Name:ABRA CADABRA'],
                //           fontSize: 15,
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                Column(
                  children: <Widget>[
                    Stack(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height / 3.5,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
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
                          child: FadeInImage.assetNetwork(
                            fit: BoxFit.cover,
                            placeholder: 'assets/images/placeholders.gif',
                            image:
                                'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.VcY4QvTViLYuHctF8hu0zQHaEK%26pid%3DApi&f=1',
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
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
                      child: Padding(
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
                                  padding:
                                      const EdgeInsets.only(top: 5, left: 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Pukar Baral . Pokhara",
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
                                  "What is wrong with my tomato plant? It has the black spot.",
                                  overflow: TextOverflow.visible,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(
                                          color: Colors.black, fontSize: 18.0),
                                )),
                              ],
                            ),
                            SizedBox(height: 5.0),
                            Wrap(
                              children: <Widget>[
                                Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, mauris sit amet massa.  facilisis volutpat est velit.",
                                  overflow: TextOverflow.visible,
                                  textAlign: TextAlign.justify,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2!
                                      .copyWith(
                                          color: Colors.black.withOpacity(0.7),
                                          fontSize: 15.0),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.pink,
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(kPadding / 3),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                        padding: const EdgeInsets.only(
                                            top: 5, left: 5),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Pukar Baral . Pokhara",
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
                                    height: 8.0,
                                  ),
                                  Text('THIS IS GOIN G TO BE COMMENT'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
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
