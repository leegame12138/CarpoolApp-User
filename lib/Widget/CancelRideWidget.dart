import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CancelRide extends StatelessWidget {

  final price;
  final seatAvailable;
  final departTime;
  final pickUpPoint;
  final List<dynamic>? passengerArray;

  const CancelRide(this.price,this.seatAvailable,this.departTime,this.pickUpPoint,this.passengerArray,{super.key});

  @override
  Widget build(BuildContext context) {
    // String price = this.price.toString();
    final numberOfJoinedPassenger = passengerArray?.length;

    return Column(
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top:20,bottom: 30),
              decoration: const BoxDecoration(
                color: Color(0x88FFFFFF),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                  bottomLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0),
                ),
              ),
              child: Stack(
                children: [
                  Padding(padding: const EdgeInsets.only(left: 18),
                    child: Column(
                      children: [
                        SizedBox(
                          width: 300,
                          child: Text(
                              "RM$price/pax", textAlign: TextAlign.left,style: const TextStyle(fontSize: 13,fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(
                          width: 300,
                          child: Text(
                              "$numberOfJoinedPassenger/$seatAvailable Going-Depart at $departTime",textAlign: TextAlign.left,style: const TextStyle(fontSize: 13,fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(
                          width: 300,
                          child: Text(
                              "$pickUpPoint",textAlign: TextAlign.left,style: const TextStyle(fontSize: 13,fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:200 ,top: 20),
                    child: SizedBox(width: 100,
                      child: GestureDetector(
                        onTap: (){
                          print("Stupid");
                        },
                        child: Container(
                          padding: const EdgeInsets.only(top:2,bottom: 8),
                          decoration: const BoxDecoration(
                            color: Color(0x88FFFFFF),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15.0),
                              topRight: Radius.circular(15.0),
                              bottomLeft: Radius.circular(15.0),
                              bottomRight: Radius.circular(15.0),

                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.only(top:5),
                            child: Text(
                              "Cancel Ride",textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )

                ],
              ),
            ),

          ],);
  }
}