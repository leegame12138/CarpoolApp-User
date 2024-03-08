import 'package:flutter/material.dart';

import 'DriverHomePageWidget.dart';

class PageWithPost extends StatelessWidget {
  const PageWithPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      SingleChildScrollView(
        child: Column(
          children: [
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

            SizedBox(height: 20,),
            DriverHomePageWidget(),
            DriverHomePageWidget(),
            DriverHomePageWidget(),
            DriverHomePageWidget(),



          ],
        ),
      ),
    );
  }
}
