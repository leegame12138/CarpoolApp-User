import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_mae_3rd_wh/Design/RoundContainerWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Widget/NUmberOfStarRatingIcon.dart';

class ReputationListTile extends StatelessWidget {
  final String comment;
  final double rating;
  final String raterTPNumber;

  const ReputationListTile({
    Key? key,
    required this.comment,
    required this.rating,
    required this.raterTPNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(comment),
      subtitle: Row(
        children: [
          Text('Rating: $rating'),
          Spacer(),
          Text('By: $raterTPNumber'),
        ],
      ),
    );
  }
}

class CommentPage extends StatefulWidget {
  final String? currentUserEmail =
      FirebaseAuth.instance.currentUser?.email.toString();

  CommentPage({Key? key}) : super(key: key);

  int numberofItem = 0;

  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  Stream<QuerySnapshot>? _reputationStream;
  late List<QueryDocumentSnapshot<Object?>> Lists = [];

  @override
  void initState() {
    super.initState();
    // Get a reference to the user's document based on provided email
    DocumentReference userRef = FirebaseFirestore.instance
        .collection('User')
        .doc(widget.currentUserEmail);

    // Get a stream of data from the "Reputation" collection within the user's document
    _reputationStream = userRef.collection('Reputation').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    var numberofItem = 0;

    return Scaffold(
        appBar: AppBar(
          leading: BackButton(),
          automaticallyImplyLeading: true,
          backgroundColor: const Color(0xffB0A695),
          scrolledUnderElevation: 3,
          elevation: 10,
          title: const Text(
            "Current Active Carpool",
            style: TextStyle(color: Colors.black),
          ),
          shadowColor: Colors.black,
        ),
        body: StreamBuilder(
            stream: _reputationStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                for (var i in snapshot.data!.docs) {
                  Lists.add(i);
                  numberofItem++;
                }
              }
              return Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.1,
                    ),
                    Text("Comment: "),
                    SizedBox(
                        height: 300,
                        child: ListView.builder(
                            itemCount: numberofItem,
                            itemBuilder: (BuildContext, int) {
                              return Column(
                                children: [
                                  SizedBox(width:300,
                                    child: RoundContainer(ListTile(
                                        title: RatingIconReturn(Lists[int]["Rating"]),
                                        subtitle: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(top: 2.0,bottom: 4),
                                              child: SizedBox(width: 300,child: Text(Lists[int]["Comment"],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)),
                                            ),
                                            SizedBox(width: 300,child: Text(Lists[int]["RaterTPNumber"],style: TextStyle(fontWeight: FontWeight.w300,fontSize: 14),)),

                                          ],
                                        ))),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  )
                                ],
                              );
                            })),
                  ],
                ),
              );
            }));
  }
}
