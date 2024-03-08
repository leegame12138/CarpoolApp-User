import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_mae_3rd_wh/Design/RoundContainerWidget.dart';
import 'package:final_mae_3rd_wh/Widget/PassengerWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Data/CRUD.dart';
import '../Data/PushData.dart';
import '../Widget/CustomAppBar.dart';
import '../Widget/TopUpWidget.dart';
import 'LoginPage.dart';
import 'FeedbackPage.dart';

class UserProfilePage extends StatelessWidget {
  UserProfilePage({super.key});

  var walletBalance;

  @override
  Widget build(BuildContext context) {
    String? currentUserEmail = FirebaseAuth.instance.currentUser?.email.toString();

    DocumentSnapshot? TripHistoryDoc;
    DocumentSnapshot? PersonalInfoDoc;

    return Column(
      children: [
        const CustomAppBar("Current Active Carpool"),

        FutureBuilder(
            future: getNestedDocumentSnapshot(
              // GET User Trip Data From Database
              'User', currentUserEmail!, 'TripHistory',
            ).then((snapshot) {
              if (snapshot!.exists) {
                TripHistoryDoc = snapshot;
              } else
                TripHistoryDoc = null;
            }),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return FutureBuilder(
                  future: getNestedDocumentSnapshot(
                    // GET User Trip Data From Database
                    'User', currentUserEmail!, 'PersonalInformation',
                  ).then((snapshot) {
                    if (snapshot!.exists) {
                      PersonalInfoDoc = snapshot;
                    }
                  }),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    walletBalance = PersonalInfoDoc?["WalletBalance"];

                     return Column(
                          children: [
                            PassengerWidget(
                                "User",
                                PersonalInfoDoc?["Name"],
                                PersonalInfoDoc?["Gender"],
                                PersonalInfoDoc?["ProfilePicURL"],
                                PersonalInfoDoc?["AverageRating"],
                                "2",PersonalInfoDoc),


                            Padding(
                              padding: const EdgeInsets.only(top: 20, left: 20.0,right: 20,bottom: 20),
                              child: StatefulBuilder(builder:
                                  (BuildContext context, StateSetter setState){
                                return
                                  RoundContainer( Row(
                                    children: [
                                      TopUpWidget(walletBalance),
                                      GestureDetector(
                                        onTap: () {
                                          walletBalance++;
                                          PushData pushdata = PushData();
                                          pushdata.UpdateWalletBalance(walletBalance);
                                          setState(() {});
                                        },
                                        child: const RoundContainer(
                                          Padding(
                                            padding: EdgeInsets.only(left: 5.0, right: 20.0,top: 5, bottom: 5),
                                            child: Text(
                                              "Topup",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  );

                              },),
                            )

                          ],);
                      }
    );
            }),

        Padding(
          padding: const EdgeInsets.only(left: 20.0,right: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: RoundContainer(
                  ListTile(
                    leading: Icon(Icons.phone),
                    onTap: () {
                      null; //TO BE IMPLEMENT

                    },
                    title: Text("Set ermengency contect number"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Container(
                  padding: EdgeInsets.only(top: 0, bottom: 8, left: 5, right: 5),
                  decoration: BoxDecoration(
                    color: Color(0x88FFFFFF),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0),
                    ),
                  ),
                  child: ListTile(
                    leading: Icon(Icons.feedback),
                    onTap: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context) => FeedbackPage()));

                    },
                    title: Text("Feedback"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Container(
                  padding: const EdgeInsets.only(top: 0, bottom: 8, left: 5, right: 5),
                  decoration: const BoxDecoration(
                    color: Color(0x88FFFFFF),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0),
                    ),
                  ),
                  child: ListTile(
                    leading: Icon(Icons.logout),
                    onTap: () {
                      signOut(context);
                    },
                    title: Text("Logout"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}


Future<void> signOut(BuildContext context) async {
  await FirebaseAuth.instance.signOut();
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (context) => LoginPage()),
  );

}
FeedbackPage GoToFeebackPage (){
  return FeedbackPage();

}