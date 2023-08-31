

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:poolq/Module/Screen/Home/landingPage.dart';
import 'package:poolq/Module/Screen/Profile/UserProfile.dart';
import 'package:provider/provider.dart';

import '../../../Provider/AuthProvider.dart';
import '../../../Provider/homeProvider.dart';
import 'LeaderbpardWidget.dart';

class HomePage extends StatefulWidget {
  final initial;
  const HomePage({super.key, this.initial});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  PageController ?controller;
  User? user = FirebaseAuth.instance.currentUser;
  Stream<QuerySnapshot> ?_pickrecord;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var authProvider = Provider.of<AuthProvider>(context, listen: false);
    DataProvider dataProvider =
    Provider.of<DataProvider>(context, listen: false);
    controller = PageController(viewportFraction: 1, initialPage: widget.initial ?? 0);
    dataProvider.pageIndex = widget.initial ?? 0;
    _pickrecord =
        FirebaseFirestore.instance.collection('pickrecord').where("uid", isEqualTo: user!.uid).where("week", isEqualTo: dataProvider.game!["name"]).snapshots();
    authProvider.getUserInfo();
  }


  @override
  Widget build(BuildContext context) {
    DataProvider dataProvider =
    Provider.of<DataProvider>(context, listen: true);
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: _pickrecord,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Center(child: Text('Something went wrong'));
            }

            if (snapshot.connectionState == ConnectionState.waiting || snapshot.data==null) {
              return Center(child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: const Color(0xFF063a73)),),
                      child: const CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF063a73)),
                        strokeWidth: 2,
                        backgroundColor: Colors.white,
                        //  valueColor: new AlwaysStoppedAnimation<Color>(color: Color(0xFF9B049B)),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('Loading',
                      style: TextStyle(
                          color: Color(0xFF333333),
                          fontSize: 18,
                          fontWeight: FontWeight.w600)),
                ],
              ));
            }

            return PageView(
            controller: controller,
            children: [
              HomePageWidget(controller: controller, isEmpty:snapshot.data!.docs.isEmpty),
              const LeaderboardWidget(),
              const UserProfile()
            ],
          );
        }
      ),
      bottomNavigationBar: buildMyNavBar(context,  dataProvider),
    );
  }

  Container buildMyNavBar(BuildContext context, DataProvider dataProvider) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        color: Color(0xFF063A73),
        borderRadius: BorderRadius.only(
          // topLeft: Radius.circular(20),
          // topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                dataProvider.setValue(0);
                // print(pageIndex);
              });
              controller!.jumpToPage(0);
            },
            icon: dataProvider.pageIndex != 0
                ?  Icon(
              PhosphorIcons.thin.house,
              color: Colors.white,
              size: 40,
            )
                :  Icon(
              PhosphorIcons.fill.house,
              color: Colors.white,
              size: 40,
            ),
          ),

          InkWell(
            // enableFeedback: false,
            onTap: () {
              setState(() {
                dataProvider.setValue(1);
              });
              controller!.jumpToPage(1);
            },
            child: dataProvider.pageIndex == 1
                ?  Image.asset(
               "assets/images/lb-full.png",
                width: 45,
                height: 45,
            )
                :   Image.asset(
                "assets/images/lb-outline.png",
              width: 45,
              height: 45,
              // color: Colors.white,
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                dataProvider.setValue(2);
              });
              controller!.jumpToPage(2);
            },
            icon: dataProvider.pageIndex == 2
                ?  Icon(
              PhosphorIcons.fill.user,
              color: Colors.white,
              size: 40,
            )
                :  Icon(
              PhosphorIcons.thin.user,
              color: Colors.white70,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }
}
