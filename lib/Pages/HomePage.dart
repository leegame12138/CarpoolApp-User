import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_mae_3rd_wh/Widget/HomePageWidget_Parameter.dart';
import 'package:final_mae_3rd_wh/Pages/UserProfilePage.dart';
import 'package:flutter/material.dart';
import 'HistoryPage2.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;
  List<String> userProfilePicURLs = [];
  String? userProfilePicURL;
  int numberOfJoinedPassenger = 0;

  final ScrollController _homeController = ScrollController();
  late final String fieldName;

  String genderFilter_dropdownValue = "Value";
  String dateFilter_dropdownValue = "Value";
  List<String> genderFilterList = <String>['No Preference', 'Male', 'Female'];
  List<String> dateFilterList = <String>['Today', 'Tomorrow', 'Overmorrow'];

  @override
  void initState() {
    super.initState();
    genderFilter_dropdownValue = genderFilterList.first;
    dateFilter_dropdownValue = dateFilterList.first;
  }


  refresh() {
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEBE3D5),
      body: SingleChildScrollView(
        child:

        Builder(builder: (context){

          if(_selectedIndex ==0){ //HomePage -> DocumentPage
            return Column(
              children: [
                AppBar(
                  automaticallyImplyLeading: true,
                  backgroundColor: const Color(0xffB0A695),
                  scrolledUnderElevation: 3,
                  elevation: 10,
                  title: const Text(
                    "Current Carpool",
                    style: TextStyle(color: Colors.black),
                  ),
                  shadowColor: Colors.black,
                  actions: <Widget>[

                    Padding(
                        padding: EdgeInsets.only(right: 20.0),
                        child: GestureDetector(
                          onTap: () {refresh();},
                          child: Icon(Icons.refresh),
                        )),
                  ],
                ),

                // Filter
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.115,
                    ),

                    DropdownButton<String>(
                      value: dateFilter_dropdownValue,
                      icon: Container(child: const Icon(Icons.arrow_downward)),
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          dateFilter_dropdownValue = value!;
                        });
                      },
                      items: dateFilterList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    SizedBox(width: 16,),
                    DropdownButton<String>(
                      value: genderFilter_dropdownValue,
                      icon: Container(child: const Icon(Icons.arrow_downward)),
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          genderFilter_dropdownValue = value!;
                        });
                      },
                      items: genderFilterList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Icon(
                        Icons.search,
                      ),
                    ),
                  ],
                ),

                Builder(builder: (context) {
                  if (genderFilter_dropdownValue == "Male"){
                    return StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection("Carpool")
                            .where('Status', isEqualTo: 'Pending').where('DriverGender',isEqualTo: 'Male')
                            .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError)
                            return Text('Something went wrong');
                          if (snapshot.connectionState == ConnectionState.waiting)
                            return Text("Loading");
                          List<DocumentSnapshot> documents = snapshot.data!.docs;
                          return ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: documents.length,
                              itemBuilder: (BuildContext context, int index) {
                                DocumentSnapshot document = documents[index];
                                userProfilePicURLs.clear();
                                numberOfJoinedPassenger = 0;

                                for (userProfilePicURL
                                in List.from(document?['UserProfilePicURL'])) {
                                  userProfilePicURLs.add(userProfilePicURL!);
                                  numberOfJoinedPassenger += 1;
                                }

                                return HomePageWidget_Parameter(document,document['Title'],document['DriverProfilePicURL'],document['PricePerPax'],document['DepartureTime'],userProfilePicURLs,numberOfJoinedPassenger,);
                              });});
                  }
                  else if (genderFilter_dropdownValue == "Female"){
                    return StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection("Carpool")
                            .where('Status', isEqualTo: 'Pending').where('DriverGender',isEqualTo: 'Female')
                            .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError)
                            return const Text('Something went wrong');
                          if (snapshot.connectionState == ConnectionState.waiting)
                            return const Text("Loading");
                          List<DocumentSnapshot> documents = snapshot.data!.docs;
                          return ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: documents.length,
                              itemBuilder: (BuildContext context, int index) {
                                DocumentSnapshot document = documents[index];
                                userProfilePicURLs.clear();
                                numberOfJoinedPassenger = 0;
                                print("Document Printing within itembuilder");
                                print(document);
                                // return ListTile(
                                //   title: Text(document['Title']),
                                //   subtitle: Text(document['PricePerPax'].toString()),
                                for (userProfilePicURL
                                in List.from(document?['UserProfilePicURL'])) {
                                  userProfilePicURLs.add(userProfilePicURL!);
                                  numberOfJoinedPassenger += 1;
                                }

                                return HomePageWidget_Parameter(
                                  document,
                                  document['Title'],
                                  document['DriverProfilePicURL'],
                                  document['PricePerPax'],
                                  document['DepartureTime'],

                                  userProfilePicURLs,
                                  numberOfJoinedPassenger,
                                  //document['UserProfilePicURL'] is Iterable ? List.from(document?['UserProfilePicURL']). : null
                                );
                              });
                        });
                  }else{ return StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection("Carpool")
                          .where('Status', isEqualTo: 'Pending')
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError)
                          return Text('Something went wrong');
                        if (snapshot.connectionState == ConnectionState.waiting)
                          return Text("Loading");
                        List<DocumentSnapshot> documents = snapshot.data!.docs;
                        return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: documents.length,
                            itemBuilder: (BuildContext context, int index) {
                              DocumentSnapshot document = documents[index];
                              userProfilePicURLs.clear();
                              numberOfJoinedPassenger = 0;
                              print("Document Printing within itembuilder");
                              print(document);
                              // return ListTile(
                              //   title: Text(document['Title']),
                              //   subtitle: Text(document['PricePerPax'].toString()),
                              for (userProfilePicURL
                              in List.from(document?['UserProfilePicURL'])) {
                                userProfilePicURLs.add(userProfilePicURL!);
                                numberOfJoinedPassenger += 1;
                              }

                              return HomePageWidget_Parameter(
                                document,
                                document['Title'],
                                document['DriverProfilePicURL'],
                                document['PricePerPax'],
                                document['DepartureTime'],

                                userProfilePicURLs,
                                numberOfJoinedPassenger,
                                //document['UserProfilePicURL'] is Iterable ? List.from(document?['UserProfilePicURL']). : null
                              );
                            });
                      });}
                }
                ),
                const SizedBox(
                  height: 12,
                )
              ],
            );
          }
          else if (_selectedIndex == 1){ //HomePage -> HistoryPage
            return TestingHistory();
          }
          else{ //HomePage -> UserProfilePage
            return UserProfilePage();
          }
        })
      ),
      bottomNavigationBar: BottomNavigationBar(
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
              // goToHomePage();
              // only scroll to top when current index is selected.
              if (_selectedIndex == index) {
                _homeController.animateTo(
                  0.0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOut,
                );
              }
          }
          setState(
                () {
              _selectedIndex = index;
            },
          );
        },
      ),
    );
  }
}
