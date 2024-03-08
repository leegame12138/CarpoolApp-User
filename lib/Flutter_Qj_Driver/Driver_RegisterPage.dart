import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Driver_EmptyHome.dart';

class DriverRegisterPage extends StatefulWidget {
  const DriverRegisterPage({super.key});

  @override
  State<DriverRegisterPage> createState() => _DriverRegisterPageState();
}

class _DriverRegisterPageState extends State<DriverRegisterPage> {
  TextEditingController _carband =new TextEditingController();
  TextEditingController _Nseat =new TextEditingController();
  TextEditingController _Nplate =new TextEditingController();
  TextEditingController _Ccolor =new TextEditingController();
  TextEditingController _DEyear =new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffB0A695),
          title: const Text("RegisterP Page",textAlign: TextAlign.center,),
        ),backgroundColor: const Color(0xFFEBE3D5),
        body: SizedBox(height: MediaQuery.sizeOf(context).height * 0.9,
          child: Padding(
            padding: const EdgeInsets.only(left: 40.0,right: 40,top: 40),
            child: ListView(
              children:  [
                TextField(
                  controller: _carband,
                  decoration: const InputDecoration(
                    labelText: 'Car brand',
                    prefixIcon: Icon(Icons.car_crash_outlined),
                    border: OutlineInputBorder(),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 20)),
                TextField(
                  controller: _Nseat,
                  decoration: const InputDecoration(
                      labelText: 'Number of Seat',
                      prefixIcon: Icon(Icons.event_seat),
                      border: OutlineInputBorder()
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 20)),
                TextField(
                  controller: _Nplate,
                  decoration: const InputDecoration(
                      labelText: 'Car number Plate',
                      prefixIcon: Icon(Icons.format_list_numbered),
                      border: OutlineInputBorder()
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 20)),
                TextField(
                  controller: _Ccolor,
                  decoration: const InputDecoration(
                      labelText: 'Car color',
                      prefixIcon: Icon(Icons.color_lens),
                      border: OutlineInputBorder()
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 20)),
                TextField(
                  controller: _DEyear,
                  decoration: const InputDecoration(
                      labelText: 'Driver Experience year',
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder()
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (context) => const DriverHome()));
print("carB: ${_carband.text} Seat: ${_Nseat.text} Nplate: ${_Nplate.text} Ccolor: _Ccolor.text DEy: _DEyear)");

                  },
                  child: Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Container(
                        padding: const EdgeInsets.only(top: 15.0,bottom: 15),
                      decoration: BoxDecoration(
                        color: Color(0x88FFFFFF),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0),
                          bottomLeft: Radius.circular(20.0),
                        ),
                      ),
                        alignment: Alignment.center,
                        child: SizedBox(child: const Text("SAVE"))),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
