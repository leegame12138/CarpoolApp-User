import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  TextEditingController _title =new TextEditingController();
  TextEditingController _Feedback =new TextEditingController();


  @override
  Widget build(BuildContext context) {
    String message;
    Feedbacks fb;
    return Scaffold(
          appBar: AppBar(
            leading: const BackButton(),
            automaticallyImplyLeading: true,
            backgroundColor: const Color(0xffB0A695),
            scrolledUnderElevation: 3,
            elevation: 10,
            title: const Text(
              "Feedback",
              style: TextStyle(color: Colors.black),
            ),
            shadowColor: Colors.black,
          )
        ,backgroundColor: const Color(0xFFEBE3D5),
        body: SizedBox(height: MediaQuery.sizeOf(context).height * 0.9,
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0,right: 20,top: 40),
            child: ListView(
              children:  [
                TextField(
                  controller: _title,
                  decoration: const InputDecoration(
                    labelText: 'Title',
                    prefixIcon: Icon(Icons.layers_clear_rounded),
                    border: OutlineInputBorder(),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 20)),
                TextField(
                  controller: _Feedback,
                  decoration: const InputDecoration(
                      labelText: 'Content',
                      prefixIcon: Icon(Icons.message_outlined),
                      border: OutlineInputBorder()
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 40)),


                GestureDetector(
                  onTap: () => {
                    message = _Feedback.text,
                    fb = Feedbacks(message: message),
                    addFeedback(fb),

                  },

                  child: Center(
                    child: SizedBox(
                        width: 100,height: 30,
                        child: Container(
                            width: 100,height: 30,
                        color: const Color(0xffB0A695),alignment: Alignment.center,
                        child: const Text("SAVE"),)),
                  ),
                )
              ],
            ),
          ),
        ),
      );

  }
}

class Feedbacks {
  // Define your feedback properties here (e.g., String message, String rating)
  Feedbacks({
    required this.message,
  });

  final String message;

  Map<String, dynamic> toMap() => {
    'Feedback': message,
  };
}

Future<void> addFeedback(Feedbacks feedback) async {
  final db = FirebaseFirestore.instance;
  final collectionRef = db.collection("Feedback");

  await collectionRef.add(feedback.toMap()); // Preferred

  print('Feedback added successfully!');
}
