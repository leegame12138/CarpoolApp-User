import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_mae_3rd_wh/Widget/PassengerWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestingHistory extends StatefulWidget {
  const TestingHistory({super.key});

  @override
  State<TestingHistory> createState() => _TestingHistoryState();
}

class _TestingHistoryState extends State<TestingHistory> {

  Stream<QuerySnapshot>? _userDataStream; 
  Stream<QuerySnapshot>? _carpoolDataStream; 
  String? currentUserEmail = FirebaseAuth.instance.currentUser?.email.toString();
  late List TripHistoryList;

  late DocumentSnapshot userdoc;
  late DocumentSnapshot carpooldoc;


  @override
  void initState() {

    super.initState();
    FirebaseFirestore fire =  FirebaseFirestore.instance;
    _userDataStream = fire.collection(
        'User').doc(currentUserEmail)
        .collection("TripHistory")
        .snapshots();

   _carpoolDataStream = fire.collection('Carpool').snapshots();
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Column(
        children: [AppBar(
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
          Container(
              alignment: FractionalOffset.centerLeft,
              child: SizedBox(height: MediaQuery.sizeOf(context).height * 0.1,width: MediaQuery.sizeOf(context).width * 0.8,)),
          Text("Historical Carpool:\n ——————————————————"),
          StreamBuilder<QuerySnapshot>(
              stream: _userDataStream,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError)
                  return Text('Something went wrong');
                if (snapshot.connectionState == ConnectionState.waiting)
                  return Text("Loading");
                List<DocumentSnapshot> tripdocuments = snapshot.data!.docs;
                userdoc = tripdocuments.first;
                TripHistoryList = userdoc.get("TripHistorys");
                print(userdoc.data());
                return StreamBuilder<QuerySnapshot>(
                      stream: _carpoolDataStream,
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError)
                          return Text('Something went wrong');
                        if (snapshot.connectionState == ConnectionState.waiting)
                          return Text("Loading");
                        List<DocumentSnapshot> carpooldocuments = snapshot.data!.docs;

                        return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: TripHistoryList.length,
                            itemBuilder: (BuildContext, int){

                              for (carpooldoc in carpooldocuments) {
                                if(carpooldoc.id == TripHistoryList[int]){
                                  return PassengerWidget("Driver", carpooldoc["DriverName"], carpooldoc["DriverGender"], carpooldoc["DriverProfilePicURL"], carpooldoc["DriverAverageRating"], carpooldoc["DriverNumOfTripHistory"],carpooldoc);
                                }
                              }
                            });

                      });
              }),
        ],
      ),
    );
  }
}
