import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'PushCarPoolData.dart';

class PushDriverData extends StatelessWidget {
  const PushDriverData({super.key});

  @override

  // final StadiumBukitJalil = [3.054945620889882, 101.69145086304114];
  // final EndahArea = [3.063740188093849, 101.69947595249387];
  // final Pavilian BukitJalil = [3.0513665346683614, 101.67357550680264];
  // final APU = [3.0554391941016887, 101.70056182949484];
  // final VistaComanwel = [3.0582619305815935, 101.68672201335195];
  // final Parkhill = [3.0550636192253666, 101.69585121036633]

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('"This is for initial dummy driver data"'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // Button 1
            ElevatedButton(
              onPressed: () {

                createAndPushCarpoolData(
                  status: "Pending",
                  title: 'This is customize Carpool',
                  CarPicURL: 'https://firebasestorage.googleapis.com/v0/b/draft-b73b0.appspot.com/o/Car%2Fcar3.jpeg?alt=media&token=b0989448-c52d-470a-84eb-32dfad8f7189',
                  pricePerPax: 5.00,
                  departureDate: DateFormat.E().format(DateTime.now()),
                  departureTime: TimeOfDay(hour: 11,minute: 00), // 12:00 PM
                  pickUpPoint: 'Parkhill',
                  destination: 'APU',
                  numberOfPassengers: 4,
                  driverName: 'Lee Qin Jun',
                  driverGender: 'Male',
                  driverProfilePicURL: 'https://firebasestorage.googleapis.com/v0/b/draft-b73b0.appspot.com/o/author%2Fqinjun.jpg?alt=media&token=a1941192-f479-43d3-a548-61777859026c',
                  driverAverageRating:4.5,
                  driverNumOfTripHistory: 30,
                  driverEmail: "tp000001@mail.apu.edu.my",
                  userProfilePicURL: [
                    "https://firebasestorage.googleapis.com/v0/b/draft-b73b0.appspot.com/o/UserProfilePic%2F6fe402e36388f80cb789248439862fe24a936e84.jpg?alt=media&token=6fcb42da-a368-4f28-a0ba-7f0ef1505a22"
                  ,"https://firebasestorage.googleapis.com/v0/b/draft-b73b0.appspot.com/o/UserProfilePic%2F825e326cbba2496ca198a275f9ec1a02.webp?alt=media&token=0d8cace9-9588-44d1-88c9-e97f6afa920b",
                  ],
                  DriverLatitude:3.054945620889882,
                  DriverLongitude: 101.69145086304114,
                  PickUpPointLatitude: 3.0550636192253666,
                  PickUpPointLongitude: 101.69585121036633,
                  DestinationLatitude: 3.0554391941016887,
                  DestinationLongitude: 101.70056182949484
                );

              },
              child: Text('Add Driver 1'),
            ),
            SizedBox(height: 20),



            // Button 2
            ElevatedButton(
              onPressed: () {
                createAndPushCarpoolData(
                  status: "Pending",
                  title: 'Example Carpool',
                  CarPicURL: 'https://firebasestorage.googleapis.com/v0/b/draft-b73b0.appspot.com/o/Car%2Fcar2.jpeg?alt=media&token=c1d73d61-ad91-42f5-b83a-81980c05f42c',
                  pricePerPax: 7.00,
                  departureDate: DateFormat.E().format(DateTime.now()),
                  departureTime: TimeOfDay(hour: 8,minute: 30), // 12:00 PM
                  pickUpPoint: 'APU',
                  destination: 'Parkhill',
                  numberOfPassengers: 3,
                  driverName: 'Brenda Lee',
                  driverGender: 'Male',
                  driverProfilePicURL: 'https://firebasestorage.googleapis.com/v0/b/draft-b73b0.appspot.com/o/DriverProfilePic%2FD2.webp?alt=media&token=a15de06e-6eea-42cb-a1d7-1035e4c3a12b',
                  driverAverageRating:5,
                  driverNumOfTripHistory: 2,
                  driverEmail: "tp000002@mail.apu.edu.my",
                  userProfilePicURL: ["https://firebasestorage.googleapis.com/v0/b/draft-b73b0.appspot.com/o/UserProfilePic%2Fafricanamerican-man-face-260nw-506914330.jpg?alt=media&token=da114b48-aac3-4d32-b23e-cab98f682cc9",
                    "https://firebasestorage.googleapis.com/v0/b/draft-b73b0.appspot.com/o/UserProfilePic%2Fpexels-photo-614810.jpeg?alt=media&token=d294311a-17a7-4007-9b7c-647c29c07c79",
                  ],
                    DriverLatitude:3.054945620889882,
                    DriverLongitude: 101.69145086304114,
                    DestinationLatitude: 3.0550636192253666,
                    DestinationLongitude: 101.69585121036633,
                    PickUpPointLatitude: 3.0554391941016887,
                    PickUpPointLongitude: 101.70056182949484
                );
              },
              child: Text('Add Driver 2'),
            ),
            SizedBox(height: 20),

            // Button 3
            ElevatedButton(
              onPressed: () {
                createAndPushCarpoolData(
                  status: "Pending",
                  title: 'Example Carpool',
                  CarPicURL: 'https://firebasestorage.googleapis.com/v0/b/draft-b73b0.appspot.com/o/Car%2Fcar1.jpeg?alt=media&token=598dccf1-1e47-47eb-b9a6-df78e13aed3b',
                  pricePerPax: 10.00,
                  departureDate: DateFormat.E().format(DateTime.now()),
                  departureTime: TimeOfDay(hour: 8,minute: 0),
                  pickUpPoint: 'Vista',
                  destination: 'APU',
                  numberOfPassengers: 4,
                  driverName: 'Ashley Wong',
                  driverGender: 'Male',
                  driverProfilePicURL: 'https://firebasestorage.googleapis.com/v0/b/draft-b73b0.appspot.com/o/DriverProfilePic%2FD3.jpg?alt=media&token=d8bd18bd-b861-40b3-a63b-dda75ed30a81',
                  driverAverageRating:3,
                  driverNumOfTripHistory: 0,
                  driverEmail: "tp000003@mail.apu.edu.my",
                  userProfilePicURL: [],
                    DriverLatitude:3.054945620889882,
                    DriverLongitude: 101.69145086304114,
                    PickUpPointLatitude: 3.0582619305815935,
                    PickUpPointLongitude:  101.68672201335195,
                    DestinationLatitude: 3.0554391941016887,
                    DestinationLongitude: 101.70056182949484


                );
              },
              child: Text('Add Driver 3'),
            ),
            SizedBox(height: 20), // Add spacing between buttons



          ],
        ),
      ),
    );
  }
}




