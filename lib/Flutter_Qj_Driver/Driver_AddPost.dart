import 'package:flutter/material.dart';

import 'DropdownButtonWidget.dart';
import 'PageWithPost.dart';



  class DriverAddPost extends StatefulWidget {
  const DriverAddPost({super.key});

  @override
  State<DriverAddPost> createState() => _DriverAddPostState();
  }
const List<String> pickuppoint = <String>['Apu', 'Vista', 'LRT Bukit Jalil', 'Parkhill', 'Pavilion Bukit jalil'];
const List<String> dropoffpoint = <String>['Apu', 'Vista', 'LRT Bukit Jalil', 'Parkhill', 'Pavilion Bukit jalil'];
const List<String> date = <String>['Today', 'Tomorrow', 'Overmorrow'];
const List<String> time = <String>['10:00', '10:15', '10:30', '10:45',"11:00"];
const List<String> numberofseat = <String>['1', '2', '3', '4','5', '6',];
const List<String> priceperpax = <String>['3', '4', '5', '6','7', '8', '9', '10'];

  class _DriverAddPostState extends State<DriverAddPost> {

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Color(0xffB0A695),
      title: const Text("RegisterP Page",textAlign: TextAlign.center,),
    ),
    body: Center(
      child: Column(
        children: [
          SizedBox(height: 60,),

          SizedBox(width:200, child:Text("Date: ",style: TextStyle(fontWeight: FontWeight.bold),)),
          Padding(
            padding: const EdgeInsets.only(top: 8.0,bottom: 10),
            child: DropdownMenuExample(date),
          ),
          SizedBox(width:200, child:Text("Time: ",style: TextStyle(fontWeight: FontWeight.bold),)),
          Padding(
            padding: const EdgeInsets.only(top: 8.0,bottom: 10),
            child: DropdownMenuExample(time),
          ),
          SizedBox(width:200, child:Text("Pick up point: ",style: TextStyle(fontWeight: FontWeight.bold),)),
          Padding(
            padding: const EdgeInsets.only(top: 8.0,bottom: 10),
            child: DropdownMenuExample(pickuppoint),
          ),
          SizedBox(width:200, child:Text("Drop off point: ",style: TextStyle(fontWeight: FontWeight.bold),)),
          Padding(
            padding: const EdgeInsets.only(top: 8.0,bottom: 10),
            child: DropdownMenuExample(dropoffpoint),
          ),
          SizedBox(width:200, child:Text("Number of seat: ",style: TextStyle(fontWeight: FontWeight.bold),)),
          Padding(
            padding: const EdgeInsets.only(top: 8.0,bottom: 10),
            child: DropdownMenuExample(numberofseat),
          ),
          SizedBox(width:200, child:Text("Price per pax: ",style: TextStyle(fontWeight: FontWeight.bold),)),
          Padding(
            padding: const EdgeInsets.only(top: 8.0,bottom: 10),
            child: DropdownMenuExample(priceperpax),
          ),

          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (context) => const PageWithPost()));
            },
            child: Padding(
              padding: const EdgeInsets.all(17.0),
              child: Container(child: const Text("SAVE"),
                padding: EdgeInsets.only(top: 10.0,bottom: 10,left: 20,right: 20),decoration: BoxDecoration(
                  color: Color(0x77B0A695),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                  ),
                ),
                  )),

            ),





        ],
      ),
    ),
  );
  }
  }
