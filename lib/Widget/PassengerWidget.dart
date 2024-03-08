import 'package:final_mae_3rd_wh/Design/RoundContainerWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../Pages/CommentPage.dart';
import '../Pages/DocumentPage.dart';

class PassengerWidget extends StatefulWidget {

  final role;
  final name;
  final gender;
  final profilePic;
  final rating;
  final tripHistory;
  final documentsnapshot;


  const PassengerWidget(this.role,this.name,this.gender,this.profilePic,this.rating,this.tripHistory,this.documentsnapshot,{super.key});

  @override
  State<PassengerWidget> createState() => _PassengerWidgetState();
}

class _PassengerWidgetState extends State<PassengerWidget> {
  void changepage(document) {
    Navigator.push(context,MaterialPageRoute(builder: (context) => DocumentPage(document)));
  }

  void ToCommentPage() {
    Navigator.push(context,MaterialPageRoute(builder: (context) => CommentPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0,bottom: 8.0),
      child: Column(
            children: [
              GestureDetector(
                onTap: (){changepage(widget.documentsnapshot);},
                child: RoundContainer(
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 30,bottom: 30),
                        child: Column(
                          children: [
                            ProfilePic(context,imageLink: widget.profilePic),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                '${widget.role}', style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                                textScaleFactor: 0.3,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 93.0, top: 30),
                        child: Column(
                          children: [
                            SizedBox(
                              width:120,
                              child: Text(
                                "${widget.name}", textAlign: TextAlign.left,style: const TextStyle(fontSize: 50,fontWeight: FontWeight.bold, ),
                                textScaleFactor: 0.3,
                              ),
                            ),
                            SizedBox(
                              width: 120,
                              child: Text(
                                "${widget.gender}",style: const TextStyle(fontSize: 50,fontWeight: FontWeight.bold),
                                textScaleFactor: 0.3,
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: SizedBox(
                                width:120,
                                child: Text(
                                  "Trip History: ${widget.tripHistory}",textAlign: TextAlign.left, style: const TextStyle(fontSize: 50),
                                  textScaleFactor: 0.3,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 200.0, top: 30),
                        child: Column(
                          children: [
                             SizedBox(
                              width: 120,
                              child: Text(
                                "${widget.rating}/5", textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 12),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: SizedBox(
                                width: 120,
                                child: Container(alignment: Alignment.center,
                                  child: Row(children: [

                                    widget.rating>=1 ? Icon(Icons.star_rate, size: 16.0):Icon(Icons.star_outline_rounded, size: 16.0), //rated
                                    widget.rating>=2 ? Icon(Icons.star_rate, size: 16.0):Icon(Icons.star_outline_rounded, size: 16.0), //rated
                                    widget.rating>=3 ? Icon(Icons.star_rate, size: 16.0):Icon(Icons.star_outline_rounded, size: 16.0), //rated
                                    widget.rating>=4 ? Icon(Icons.star_rate, size: 16.0):Icon(Icons.star_outline_rounded, size: 16.0), //rated
                                    widget.rating>=5 ? Icon(Icons.star_rate, size: 16.0):Icon(Icons.star_outline_rounded, size: 16.0), //rated

                                  ]),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                ToCommentPage();
                              },
                              child: Container(
                                padding: EdgeInsets.only(top: 16),
                                child: Text("commend",style: TextStyle(fontSize: 13, decoration: TextDecoration.underline),),
                              ),
                            )
                            ,
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ),

            ],
          ),
    );
  }
}

Widget ProfilePic(BuildContext context,
    {var imageLink =
    "https://t1.gstatic.com/licensed-image?q=tbn:ANd9GcRM0OQsITDDUQ-PCjobiXAyUfEQn1sOAkjorPKB2miR-sYx_aCjqMSevH2Y4WjIvPoA"}) {
  //Default White background
  return Container(
    width: MediaQuery.sizeOf(context).width * 0.13,
    height: MediaQuery.sizeOf(context).width * 0.13,
    clipBehavior: Clip.antiAlias,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
    ),
    child: Image.network(imageLink),

  );
}