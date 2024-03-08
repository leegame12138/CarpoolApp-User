import 'package:final_mae_3rd_wh/Pages/DocumentPage.dart';
import 'package:flutter/material.dart';

class HomePageWidget_Parameter extends StatefulWidget {
  final title;
  final driverProfilePicURL;
  final pricePerPax;
  final userProfilePicURLs;
  final numberOfJoinedPassenger;
  final departureTime;
  final document;

  const HomePageWidget_Parameter(
      this.document,
      this.title,
      this.driverProfilePicURL,
      this.pricePerPax,
      this.departureTime,
      this.userProfilePicURLs,
      this.numberOfJoinedPassenger,
      {super.key});

  @override
  State<HomePageWidget_Parameter> createState() =>
      _HomePageWidget_ParameterState();
}

class _HomePageWidget_ParameterState extends State<HomePageWidget_Parameter> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void changepage(document) {
    Navigator.push(context,MaterialPageRoute(builder: (context) => DocumentPage(document)));
  }

  Widget build(BuildContext context) {
    var numberOfJoinedPassenger = widget.numberOfJoinedPassenger;
    const EmptyProfileImageLink =
        "https://t1.gstatic.com/licensed-image?q=tbn:ANd9GcRM0OQsITDDUQ-PCjobiXAyUfEQn1sOAkjorPKB2miR-sYx_aCjqMSevH2Y4WjIvPoA";
    print("numberOfJoinedPassenger$numberOfJoinedPassenger");
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 16, right: 16),
      child: SizedBox(
          child: GestureDetector(
        onTap: () {changepage(widget.document);},
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          height: 176,
          decoration: BoxDecoration(
            color: const Color(0x77ffffff),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 8.0, top: 8.0),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    widget.title,
                  ),
                ),


                const Row(
                  children: [
                    Text('Driver',),
                    Padding(
                      padding: EdgeInsets.all(12),
                      child: Text('|',)),
                    Text('Passanger',),],
                ),

                Row(
                  // mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ProfilePic(context, imageLink: widget.driverProfilePicURL),

                    const Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        '|',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: ProfilePic(
                        context,
                        imageLink: widget.numberOfJoinedPassenger >= 1
                            ? widget
                                .userProfilePicURLs[numberOfJoinedPassenger - 1]
                            : EmptyProfileImageLink,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: ProfilePic(context,
                          imageLink: widget.numberOfJoinedPassenger >= 2
                              ? widget.userProfilePicURLs[
                                  numberOfJoinedPassenger - 2]
                              : EmptyProfileImageLink),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: ProfilePic(
                        context,
                        imageLink: widget.numberOfJoinedPassenger >= 3
                            ? widget
                                .userProfilePicURLs[numberOfJoinedPassenger - 3]
                            : EmptyProfileImageLink,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: ProfilePic(
                        context,
                        imageLink: widget.numberOfJoinedPassenger >= 4
                            ? widget
                                .userProfilePicURLs[numberOfJoinedPassenger - 4]
                            : EmptyProfileImageLink,
                      ),
                    ),

                    // If no that much seat, change the profile pic to background color
                  ],
                ),


                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "RM${widget.pricePerPax} per pax",
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '$numberOfJoinedPassenger/4 Going - Depart at ${widget.departureTime}',
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}

Widget ProfilePic(BuildContext context,
    {var imageLink =
        "https://t1.gstatic.com/licensed-image?q=tbn:ANd9GcRM0OQsITDDUQ-PCjobiXAyUfEQn1sOAkjorPKB2miR-sYx_aCjqMSevH2Y4WjIvPoA"}) {
  //Default White background
  return Container(
    width: MediaQuery.sizeOf(context).width * 0.1,
    height: MediaQuery.sizeOf(context).width * 0.1,
    clipBehavior: Clip.antiAlias,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
    ),
    child: Image.network(
      imageLink,
      fit: BoxFit.cover,
    ),
  );
}
