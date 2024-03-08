import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

  Future<DocumentSnapshot?> getNestedDocumentSnapshot(
      String collection1Name, // Name of the first collection
      String document1Id, // ID of the document within the first collection
      String collection2Name, // Name of the nested collection
        ) async {
    try {
      CollectionReference collection1Ref =
      FirebaseFirestore.instance.collection(collection1Name);

      DocumentReference document1Ref = collection1Ref.doc(document1Id);

      CollectionReference collection2Ref = document1Ref.collection(collection2Name);

      QuerySnapshot snapshot = await collection2Ref.limit(1).get();

      if (snapshot.docs.isEmpty) {
        return null; // No documents found
      }

      return snapshot.docs.first;
    } on FirebaseException catch (e) {
      print('Error getting document: ${e.message}');
      return null; // Or handle the error differently
    }
  }




