import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DisplayJoinedPassengerProfilePic extends StatelessWidget {
  final List<dynamic> passengerProfilePic;
  final carPic;

  const DisplayJoinedPassengerProfilePic(this.passengerProfilePic, this.carPic,
      {super.key});

  @override
  Widget build(BuildContext context) {

    for(var i =0; i + passengerProfilePic.length <= 4 && i <=4; i++){
      passengerProfilePic.add(null);
    }

    return Column(
      children: [
        Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(top: 20, bottom: 30),
            decoration: const BoxDecoration(
              color: Color(0x88FFFFFF),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0),
                bottomLeft: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(
                  width:250,
                  child: Text("Vehicle information:",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 13, fontWeight: FontWeight.bold)),
                ),
                CarPic(context, carPic),
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 30.0),
                      child: Text(
                        "CarModel:Myvi",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(width: 80,),
                    Text(
                      "Color:Silver",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 30,),
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 30.0),
                      child: Text(
                        "Plate Number: VAR1234",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(width: 30,),
                    Text(
                      "Capacity:",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            )),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(top: 1, bottom: 20),
                decoration: const BoxDecoration(
                  color: Color(0x88FFFFFF),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                        padding: const EdgeInsets.only(top: 6, bottom: 20),
                        child: SizedBox(
                            width: 300,
                            child: Text(
                              "Passenger ${passengerProfilePic.nonNulls.length}/4",
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold),
                            ))),

                    Row(
                      children: [
                        SizedBox(width: 20,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Peoplepic(context,passengerProfilePic[0]),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Peoplepic(context,passengerProfilePic[1]),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Peoplepic(context,passengerProfilePic[2]),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Peoplepic(context,passengerProfilePic[3]),
                        ),
                      ],
                    ),


                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 8),
                      child: GestureDetector(
                        onTap: () {
                          print("Spzai");
                        },
                        child: Container(
                          width: 300,
                          padding: const EdgeInsets.only(
                              top: 2, bottom: 6, left: 5, right: 5),
                          decoration: const BoxDecoration(
                            color: Color(0x88FFFFFF),

                          ),
                          child: const Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: Text(
                              "I Would like to join ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

Widget CarPic(BuildContext context, String imageLink) {
  return Column(
    children: [
      Container(
        width: MediaQuery.sizeOf(context).width * 0.01,
        height: MediaQuery.sizeOf(context).width * 0.05,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
          shape: BoxShape.rectangle,
        ),
      ),
      SizedBox(
        width: 250,
        child: Image.network(
          imageLink,
          fit: BoxFit.cover,
        ),
      ),
    ],
  );
}

Widget Peoplepic(context, String? imageLink) {
  if (imageLink == null)
    {imageLink ="https://firebasestorage.googleapis.com/v0/b/draft-b73b0.appspot.com/o/DriverProfilePic%2F31dve9WZH2S._AC_UF894%2C1000_QL80_.jpg?alt=media&token=dbf7dba2-ed74-4944-ac7c-8713b9eed0dd"; };//If null then default pic
  return Container(
    width: MediaQuery.sizeOf(context).width  *0.15,
    height: MediaQuery.sizeOf(context).height  *0.15,
    clipBehavior: Clip.antiAlias,
    decoration: const BoxDecoration(
      shape: BoxShape.circle,
    ),
    child: Image.network(
      imageLink,
      fit: BoxFit.cover,
    ),
  );
}
