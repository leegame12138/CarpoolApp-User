import 'package:flutter/material.dart';
import 'package:final_mae_3rd_wh/Pages/LoginPage.dart';

class DriverHomePageWidget extends StatefulWidget {
  const DriverHomePageWidget({super.key});

  @override
  State<DriverHomePageWidget> createState() => _DriverHomePageWidgetState();

}


class _DriverHomePageWidgetState extends State<DriverHomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final title = "";


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }



  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, bottom: 16, right: 30,top: 20),
      child: SizedBox(
          child: GestureDetector(
        onTap: null,
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          height: 173,
          decoration: BoxDecoration(
            color: const Color(0x55B0A695),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 8.0, top: 8.0),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    '$title',
                  ),
                ),

                const Row(
                  children: [
                    Text(
                      'Driver',
                    ),
                    Padding(
                      padding: EdgeInsets.all(12),
                      child: Text(
                        '|',
                      ),
                    ),
                    Text(
                      'Passanger',
                    ),
                  ],
                ),

                Row(
                  // mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ProfilePic(context,imageLink: "https://firebasestorage.googleapis.com/v0/b/draft-b73b0.appspot.com/o/author%2Fqinjun.jpg?alt=media&token=a1941192-f479-43d3-a548-61777859026c"),

                    const Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        '|',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: ProfilePic(context),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: ProfilePic(context),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: ProfilePic(context),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: ProfilePic(context),
                    ),


                    // If no that much seat, change the profile pic to background color
                  ],
                ),

                // ListView.builder(
                //     scrollDirection: Axis.horizontal,
                //     shrinkWrap: true,
                //     itemCount: 1,
                //     itemBuilder: (BuildContext context, int index) {
                //       return ProfilePic(context);
                //     }),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'RM 2 per pax',
                  ),
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '4/4 Going - Depart at 8am',
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
