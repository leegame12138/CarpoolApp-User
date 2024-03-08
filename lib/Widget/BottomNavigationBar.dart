import 'package:final_mae_3rd_wh/Pages/DocumentPage.dart';
import 'package:final_mae_3rd_wh/Pages/HomePage.dart';
import 'package:flutter/material.dart';
import '../Data/PushCarpoolDataHomePage.dart';
import '../Pages/FeedbackPage.dart';
import '../Pages/UserProfilePage.dart';
import '../Pages/LoginPage.dart';

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {

  int _selectedIndex = 0;
  final ScrollController _homeController = ScrollController();

  // Widget _listViewBody() {
  //   return ListView.separated(
  //       controller: _homeController,
  //       itemBuilder: (BuildContext context, int index) {
  //         return Center(
  //           child: Text(
  //             'Item $index',
  //           ),
  //         );
  //       },
  //       separatorBuilder: (BuildContext context, int index) => const Divider(
  //             thickness: 1,
  //           ),
  //       itemCount: 50);
  // }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.edit_document),
          label: 'Document',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_off),
          label: 'Profile',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: (int index) {
        switch (index) {
          case 0:
            goToHomePage();
            // only scroll to top when current index is selected.
            if (_selectedIndex == index) {
              _homeController.animateTo(
                0.0,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOut,
              );
            }
          case 1:
            const FeedbackPage();
          // Navigator.of(context).pushReplacement(
          //   MaterialPageRoute(builder: (context) => LoginPage()),
          // );
          case 2:
            goToUserProfilePage();
        }
        setState(
          () {
            _selectedIndex = index;
          },
        );
      },
    );

  }

  void showCarpool(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: const Text('Carpool Main Page'),
        actions: <TextButton>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Close'),
          )
        ],
      ),
    );
  }

  void showDocument(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: const Text('Document Page'),
        actions: <TextButton>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Close'),
          )
        ],
      ),
    );
  }

  void goToHomePage() {
    // Close the drawer
    Navigator.pop(context);

    // Go to the Profile Page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );
  }

  //User Profile Page
  // void goToDocumentPage() {
  //   // Close the drawer
  //   Navigator.pop(context);
  //
  //   // Go to the Profile Page
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => const DocumentPage(),
  //     ),
  //   );
  // }



  //User Profile Page
  void goToUserProfilePage() {
    // Close the drawer
    Navigator.pop(context);

    // Go to the Profile Page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PushDriverData(),
      ),
    );
  }

}
