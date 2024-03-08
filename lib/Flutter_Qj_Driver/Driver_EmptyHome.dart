import 'package:flutter/material.dart';

import 'Driver_AddPost.dart';

class DriverHome extends StatefulWidget {
  const DriverHome({super.key});

  @override
  State<DriverHome> createState() => _DriverHomeState();
}

class _DriverHomeState extends State<DriverHome> {
  changepage(){Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (context) => DriverAddPost()));}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: const Color(0xffB0A695),
          scrolledUnderElevation: 3,
          elevation: 10,
          title: const Text(
            "Current Active Carpool",
            style: TextStyle(color: Colors.black),
          ),
        ),

        const Center(child: Column(
          children: [
            SizedBox(height: 300,),
            Text("You have  available Carpool Post Yet, \nadd one to show here"),
            Icon(Icons.add_circle_outline_rounded ,size: 100,),
            Icon(Icons.arrow_downward_rounded),
          ],
        )),
      ],),
      floatingActionButton:Padding(
        padding: const EdgeInsets.only(right: 20.0,bottom: 20),
        child: FloatingActionButton(onPressed: changepage,child: Icon(Icons.add),hoverColor: Colors.amber,),
      ),
    );
  }
}
