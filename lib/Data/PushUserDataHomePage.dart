import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_mae_3rd_wh/Data/PushUserData.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';


class PushUserData extends StatelessWidget {
  PushUserData({super.key});

  @override

  final StadiumBukitJalil = [3.054945620889882, 101.69145086304114];
  final EndahArea = [3.063740188093849, 101.69947595249387];
  final PavilianBukitJalil = [3.0513665346683614, 101.67357550680264];
  final APU = [3.0554391941016887, 101.70056182949484];
  final VistaComanwel = [3.0582619305815935, 101.68672201335195];


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('"This is for initial dummy User data"'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // Button 1
            ElevatedButton(
              onPressed: () async {
                String? tPNumberEmail = FirebaseAuth.instance.currentUser?.email;
                FirebaseFirestore firestore = FirebaseFirestore.instance;
                CollectionReference userRef = firestore.collection('User');
                DocumentReference newUserRef = userRef.doc(tPNumberEmail);

                //Get Current Date and Time
                int timestamp = DateTime.now().millisecondsSinceEpoch; // Your timestamp
                DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
                String date = "${dateTime.year}-${dateTime.month}-${dateTime.day}";
                String time = "${DateTime.now().hour} : ${DateTime.now().minute}";    //dateTime = dateTime.add(Duration(days: 1));
                String NotificationTime = '$date - $time';


                Users user = Users(tPNumberEmail: tPNumberEmail, eligibleStatus: "Active", walletBalance: 30, name: "Lee Wen Han", age: 22, gender: "Male", contactNumber: "0123456789", profilePicURL: "https://firebasestorage.googleapis.com/v0/b/draft-b73b0.appspot.com/o/author%2Fwenhan.jpg?alt=media&token=c0e5fec2-eb2e-4c01-b0d4-7e136a2112ff", averageRating: 5.0);
                Reputation repu = Reputation("This is so Nice", 5, "tp000004@mail.apu.edu.my");
                Location location = Location();
                Emergency emergency = Emergency("0183209434", ["0183209434"]);
                Notifications notifications= Notifications("Approved",NotificationTime, date, "8:00", "Parkhill Residence", "APU");
                TripHistory tripHistory = TripHistory(["MtCpGLHj7EqJIGmq2IlK"]);


                print("Getting Location Data");
                location.enableBackgroundMode(enable: true);

                bool _serviceEnabled;
                PermissionStatus _permissionGranted;
                LocationData _locationData;

                _serviceEnabled = await location.serviceEnabled();
                if (!_serviceEnabled) {
                  // StreamBuilder(stream: stream, builder: builder)
                  _serviceEnabled = await location.requestService();
                  if (!_serviceEnabled) {
                    return;
                  }
                }

                _permissionGranted = await location.hasPermission();
                if (_permissionGranted == PermissionStatus.denied) {
                  _permissionGranted = await location.requestPermission();
                  if (_permissionGranted != PermissionStatus.granted) {
                    return;
                  }
                }
                  _locationData = await location.getLocation();
                  SensitiveInfo sensitiveInfo = SensitiveInfo("1234567", _locationData.latitude as double, _locationData.longitude as double);
                  newUserRef.collection("SensitiveInfo").doc().set(sensitiveInfo.toMap());
                  print("Sensitive Info: la: ${_locationData.latitude} lo: ${_locationData.longitude}");
                // LocationData _locationData = await location.getLocation();

                newUserRef.set(<String,dynamic>{'EligibleStatus': user.eligibleStatus},);
                newUserRef.collection("Emergency").doc().set(emergency.toMap());
                newUserRef.collection("Reputation").doc().set(repu.toMap());
                newUserRef.collection("PersonalInformation").doc().set(user.toMap());
                newUserRef.collection("Notifications").doc().set(notifications.toMap());
                newUserRef.collection('TripHistory').doc().set(<String,dynamic>{"TripHistorys":["MtCpGLHj7EqJIGmq2IlK","VqRKD3Tyi9N830cF3dHA"]});
                print("Push End");
              },
              child: const Text('Add User 1'),
            ),
            const SizedBox(height: 20),


            // Button 2
            ElevatedButton(
              onPressed: () async {
                var tPNumberEmail = "tp0000099@mail.apu.edu.my";
                FirebaseFirestore firestore = FirebaseFirestore.instance;
                CollectionReference userRef = firestore.collection('User');
                DocumentReference newUserRef = userRef.doc(tPNumberEmail);

                //Get Current Date and Time
                int timestamp = DateTime.now().millisecondsSinceEpoch; // Your timestamp
                DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
                String date = "${dateTime.year}-${dateTime.month}-${dateTime.day}";
                String time = "${DateTime.now().hour} : ${DateTime.now().minute}";    //dateTime = dateTime.add(Duration(days: 1));
                String NotificationTime = '$date - $time';


                Users user = Users(tPNumberEmail: tPNumberEmail, eligibleStatus: "Active", walletBalance: 76, name: "Tan Xiao Ming", age: 20, gender: "Female", contactNumber: "0123456789", profilePicURL: "https://firebasestorage.googleapis.com/v0/b/draft-b73b0.appspot.com/o/UserProfilePic%2Fdownload%20(1).jpeg?alt=media&token=f1bedfac-68fe-4940-9d7e-1b884f0e8f6b", averageRating: 5.0);
                Reputation repu = Reputation("Good", 4, "tp000001@mail.apu.edu.my");
                Location location = Location();
                Emergency emergency = Emergency("",[""]);
                Notifications notifications= Notifications("Cancle",NotificationTime, date, "11:00", "APU", "Parkhill Residence");


                print("Getting Location Data 2");

                SensitiveInfo sensitiveInfo = SensitiveInfo("1234567", 3.054945620889882, 101.69145086304114);
                newUserRef.collection("SensitiveInfo").doc().set(sensitiveInfo.toMap());
                // LocationData _locationData = await location.getLocation();


                newUserRef.collection("Emergency").doc().set(emergency.toMap());
                newUserRef.collection("Reputation").doc().set(repu.toMap());
                newUserRef.collection("PersonalInformation").doc().set(user.toMap());
                newUserRef.collection("Notifications").doc().set(notifications.toMap());


                print("Push End 2");
              },
              child: const Text('Add User 2'),
            ),
            const SizedBox(height: 20),



            // Button 3
            ElevatedButton(
              onPressed: () async {
                String tPNumberEmail = "tp000005@mail.apu.edu.my";
                FirebaseFirestore firestore = FirebaseFirestore.instance;
                CollectionReference userRef = firestore.collection('User');
                DocumentReference newUserRef = userRef.doc(tPNumberEmail);

                //Get Current Date and Time
                int timestamp = DateTime.now().millisecondsSinceEpoch; // Your timestamp
                DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
                String date = "${dateTime.year}-${dateTime.month}-${dateTime.day}";
                String time = "${DateTime.now().hour} : ${DateTime.now().minute}";    //dateTime = dateTime.add(Duration(days: 1));
                String NotificationTime = '$date - $time';


                Users user = Users(tPNumberEmail: tPNumberEmail, eligibleStatus: "Active", walletBalance: 16, name: "Susan Tan", age: 20, gender: "Female", contactNumber: "0123456789", profilePicURL: "https://firebasestorage.googleapis.com/v0/b/draft-b73b0.appspot.com/o/UserProfilePic%2Fimages%20(2).jpeg?alt=media&token=23091f70-6259-4f7e-849a-3630f277aa41", averageRating: 1.0);
                Reputation repu = Reputation("Noisy", 1, "tp000003@mail.apu.edu.my");
                Location location = Location();
                Emergency emergency = Emergency("012567892",[""]);
                Notifications notifications= Notifications("Approved",NotificationTime, date, "11:00", "APU", "Parkhill Residence");


                SensitiveInfo sensitiveInfo = SensitiveInfo("1234567", 3.054973544919175, 101.69580671467615);
                newUserRef.collection("SensitiveInfo").doc().set(sensitiveInfo.toMap());
                // LocationData _locationData = await location.getLocation();


                newUserRef.collection("Emergency").doc().set(emergency.toMap());
                newUserRef.collection("Reputation").doc().set(repu.toMap());
                newUserRef.collection("PersonalInformation").doc().set(user.toMap());
                newUserRef.collection("Notifications").doc().set(notifications.toMap());


                print("Push End 3");
              },
              child: const Text('Add User 3'),
            ),
            const SizedBox(height: 20),

            // Button 4
            ElevatedButton(
              onPressed: () async {
                String tPNumberEmail = "tp000006@mail.apu.edu.my";
                FirebaseFirestore firestore = FirebaseFirestore.instance;
                CollectionReference userRef = firestore.collection('User');
                DocumentReference newUserRef = userRef.doc(tPNumberEmail);

                //Get Current Date and Time
                int timestamp = DateTime.now().millisecondsSinceEpoch; // Your timestamp
                DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
                String date = "${dateTime.year}-${dateTime.month}-${dateTime.day}";
                String time = "${DateTime.now().hour} : ${DateTime.now().minute}";    //dateTime = dateTime.add(Duration(days: 1));
                String NotificationTime = '$date - $time';


                Users user = Users(tPNumberEmail: tPNumberEmail, eligibleStatus: "Active", walletBalance: 16, name: "Han XIao Ai", age: 20, gender: "Female", contactNumber: "0123456789", profilePicURL: "https://firebasestorage.googleapis.com/v0/b/draft-b73b0.appspot.com/o/UserProfilePic%2Fdownload.jpeg?alt=media&token=674d3fba-203f-4dfa-a9ea-0e448272580e", averageRating: 5.0);
                Reputation repu = Reputation("Goodsss", 5, "tp000004@mail.apu.edu.my");
                Reputation repu2 = Reputation("NICEEEE", 5, "tp000003@mail.apu.edu.my");
                Location location = Location();
                Emergency emergency = Emergency("012567892",["0193456789"]);
                Notifications notifications= Notifications("Approved",NotificationTime, date, "11:00", "APU", "Parkhill Residence");


                SensitiveInfo sensitiveInfo = SensitiveInfo("1234567", 3.03197, 101.42020);
                newUserRef.collection("SensitiveInfo").doc().set(sensitiveInfo.toMap());
                // LocationData _locationData = await location.getLocation();


                newUserRef.collection("Emergency").doc().set(emergency.toMap());
                newUserRef.collection("Reputation").doc().set(repu.toMap());
                newUserRef.collection("PersonalInformation").doc().set(user.toMap());
                newUserRef.collection("Notifications").doc().set(notifications.toMap());


                print("Push End4");
              },
              child: const Text('Add User 4'),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}




