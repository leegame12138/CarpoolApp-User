import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

const String carpoolCollectionId = 'Carpool';
const String passengersCollectionId = 'Passengers';

Future<void> createAndPushCarpoolData({
  required String status,
  required String title,
  required String CarPicURL,
  required double pricePerPax,
  required String departureDate,
  required TimeOfDay departureTime,
  required String pickUpPoint,
  required String destination,
  required int numberOfPassengers,
  required String driverName,
  required String driverGender,
  required String driverEmail,
  required String driverProfilePicURL,
  required double driverAverageRating,
  required int driverNumOfTripHistory,
  required List<String>? userProfilePicURL,
  required double? DriverLatitude,
  required double? DriverLongitude,
  required double? PickUpPointLatitude,
  required double? PickUpPointLongitude,
  required double? DestinationLatitude,
  required double? DestinationLongitude,

}) async {
  // Use try-catch to handle potential exceptions
  try {
    // FirebaseFirestore initialization (use the appropriate method for your setup)
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Create a new carpool document
    DocumentReference carpoolRef = await firestore.collection(carpoolCollectionId).add({
      'Status': status,
      'Title': title,
      'CarPicURL': CarPicURL,
      'PricePerPax': pricePerPax,
      'DepartureDate': departureDate,
      'DepartureTime': "${departureTime.hour}:${departureTime.minute}",
      'PickUpPoint': pickUpPoint,
      'Destination': destination,
      'NumberOfPassenger': numberOfPassengers,
      'DriverName': driverName,
      'DriverEmail': driverEmail,
      'DriverGender': driverGender,
      'DriverProfilePicURL': driverProfilePicURL,
      'DriverAverageRating': driverAverageRating,
      'DriverNumOfTripHistory': driverNumOfTripHistory,
      "UserProfilePicURL": userProfilePicURL,
      "DriverLatitude" : DriverLatitude,
      "DriverLongitude" :DriverLatitude,
      "PickUpPointLatitude": PickUpPointLatitude,
      "PickUpPointLongitude": PickUpPointLongitude,
      "DestinationLatitude" : DestinationLatitude,
      "DestinationLongitude" : DestinationLongitude,
    });

    print('Data successfully pushed to Firestore!');
  } on Exception catch (e) {
    print('Error: $e');
    // Handle errors appropriately (e.g., display an error message to the user)
  }
}


Future<void> createAndPushCarpoolPassengerData({

  required String userProfilePicURLs,
  required String userEmail,
  required String status,
  required TimeOfDay joinTime,

}) async {
  // Use try-catch to handle potential exceptions
  try {
    // FirebaseFirestore initialization (use the appropriate method for your setup)
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    var documentID = firestore.collection(carpoolCollectionId).doc().snapshots().first;

    // Create a new carpool document
    DocumentReference carpoolRef = await firestore.collection(carpoolCollectionId).doc(documentID as String?).collection(passengersCollectionId).add({
      'Status': status,
      'DepartureTime': joinTime.hour.toString(),
      'UserEmail': userEmail,
      'UserProfilePicURL': userProfilePicURLs,
    },);


    print('Data successfully pushed to Firestore!');
  } on Exception catch (e) {
    print('Error: $e');
    // Handle errors appropriately (e.g., display an error message to the user)
  }
}



