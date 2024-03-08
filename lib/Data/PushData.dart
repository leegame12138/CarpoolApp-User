import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PushData {
  final db = FirebaseFirestore.instance;
  String? tPNumberEmail = FirebaseAuth.instance.currentUser?.email;


  void PushUserProfilePicToCarpool(docID,UserProfileURL){
      DocumentReference doc = db.collection("Carpool").doc(docID);

      doc.update({"UserProfilePicURL": FieldValue.arrayUnion([UserProfileURL])});
    }

  void RemoveUserProfilePicToCarpool(docID,UserProfileURL) {
    DocumentReference doc = db.collection("Carpool").doc(docID);

    doc.update({"regions": FieldValue.arrayRemove([UserProfileURL]),});
  }

  Future<void> UpdateWalletBalance(newBalance) async {
    final doc = db.collection("User").doc(tPNumberEmail).collection("PersonalInformation").get().then((value) {
    db.collection('User')
        .doc(tPNumberEmail)
        .collection("PersonalInformation")
        .doc(value.docs.first.id).update({'WalletBalance': newBalance});
    });
  }

  Future<void> AddFeedBack(Feedback) async {
    final doc = db.collection("FeedBack").doc().update({'Feedback': Feedback});
    }
  }

