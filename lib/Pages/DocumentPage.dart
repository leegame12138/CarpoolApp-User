import 'package:final_mae_3rd_wh/Design/RoundContainerWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../GoogleMap/GoogleMap.dart';
import '../Widget/CancelRideWidget.dart';
import '../Widget/DisplayJoinedPassengerProfilePicWidget.dart';
import '../Widget/PassengerWidget.dart';

class DocumentPage extends StatelessWidget {
  final document;

  const DocumentPage(this.document, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xFFEBE3D5) ,
      appBar: AppBar(
        leading: BackButton(),
        automaticallyImplyLeading: true,
        backgroundColor: const Color(0xFFB0A695),
        scrolledUnderElevation: 3,
        elevation: 10,
        title: const Text(
          "Current Active Carpool",
          style: TextStyle(color: Colors.black),
        ),
        shadowColor: Colors.black,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 50.0, left: 20, right: 20, bottom: 20),
            child: Column(
              children: [
                RoundContainer(
                  StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                    return Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 16.0, bottom: 10),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 9),
                            child: Container(
                                alignment: FractionalOffset.centerLeft,
                                child: Row(
                                  children: [
                                    const SizedBox(
                                        child: Text(
                                      "Real-Time Map Tracking",
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    )),
                                    GestureDetector(child: const Icon(Icons.refresh),onTap: (){setState((){print("Google Map - set state successful");});},)
                                  ],
                                )),
                          ),
                        ),
                        Padding(
                          //GOOGLE MAP
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: SizedBox(
                                width: 300, child: OrderTrackingPage() //Do Not Const This as The Google Map need reload
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                ),
                const SizedBox(
                  height: 20,
                ),
                CancelRide(document["PricePerPax"],document["NumberOfPassenger"],document["DepartureTime"],document["PickUpPoint"],document["UserProfilePicURL"]),
                const SizedBox(
                  height: 10,
                ),
                PassengerWidget("Driver",document["DriverName"],document["DriverGender"],document["DriverProfilePicURL"],document["DriverAverageRating"],document["DriverNumOfTripHistory"],document),
                DisplayJoinedPassengerProfilePic(document["UserProfilePicURL"],document["CarPicURL"])
                // PassengerWidget(),
                // PassengerWidget(),
                // PassengerWidget(),
              ],
            ),
          ),
        ],
      ),
    );
    // bottomNavigationBar: BottomNavigationBarExample(),);
  }
}
