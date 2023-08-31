
import 'package:admob_flutter/admob_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:poolq/Provider/homeProvider.dart';
import 'package:provider/provider.dart';

import '../../../Constants/value.dart';
import '../../../Provider/AuthProvider.dart';
import 'LeaderbpardWidget.dart';



class Picks extends StatefulWidget {
  const Picks({super.key, 
    this.userId,
    this.selectedValue
  }) ;

  final String? userId;
  final String? selectedValue;

  @override
  _PickstState createState() => _PickstState();
}

class _PickstState extends State<Picks> {
  // late PlayerPicksModel _model;
  User? user = FirebaseAuth.instance.currentUser;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  late final Stream<QuerySnapshot> ?_pickrecordStream;


  @override
  void initState() {
    super.initState();
    DataProvider dataProvider =
    Provider.of<DataProvider>(context, listen: false);
    _pickrecordStream = FirebaseFirestore.instance.collection('pickrecord').where("week", isEqualTo: "${dataProvider.game!["mode"]}${widget.selectedValue}").where("uid", isEqualTo:"${widget.userId}").snapshots();
    // _model = createModel(context, () => PlayerPicksModel());
  }

  @override
  void dispose() {
    // _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DataProvider dataProvider = Provider.of<DataProvider>(context);
    AuthProvider authProvider = Provider.of<AuthProvider>(context, listen: true);
    // context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        bottomNavigationBar: Container(
            color: Colors.white,
            child: AdmobBanner(
              adUnitId: Provider.of<DataProvider>(context, listen: false)
                  .getBannerAdUnitId().toString(),
              adSize: AdmobBannerSize.BANNER,
              listener: (AdmobAdEvent event, Map<String, dynamic> ?args) {},
            )),
        key: scaffoldKey,
        backgroundColor: const Color(0xFFF5F5F5),
        appBar: AppBar(
          backgroundColor: primary,
          automaticallyImplyLeading: true,
          actions: const [],
          centerTitle: true,
          elevation: 4,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: Image.asset(
                          'assets/images/poolq12.png',
                          width: 67,
                          height: 90,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
                        child: Text(
                          'Leaderboard week ',
                          textAlign: TextAlign.center,
                          style:
                          TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(5, 20, 0, 0),
                        child: Text(
                          '${widget.selectedValue}',
                          textAlign: TextAlign.center,
                          style:
                          const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 20),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Hello, ${user!.displayName}',
                        style:
                        const TextStyle(
                          fontFamily: 'Lexend Deca',
                          color: Color(0xFF090F13),
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          scaffoldKey.currentState!.openDrawer();
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.black45
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: CircleAvatar(
                              foregroundColor:
                              Colors
                                  .white,
                              backgroundColor:
                              Colors
                                  .white,
                              radius: 47,
                              backgroundImage: authProvider.image
                                  .toString() ==
                                  ""
                                  ? const AssetImage(
                                  "assets/images/user.png")
                                  : NetworkImage(authProvider.image
                                  .toString())
                              as ImageProvider,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        // borderWidth: 1,
                        // buttonSize: 60,
                        child: TextButton(
                          style: const ButtonStyle(
                            // borderColor: Colors.transparent,
                            // borderRadius: 30,
                          ),

                          child: const Icon(
                            Icons.check,
                            color: Color(0xFF049304),
                            size: 30,
                          ),
                          onPressed: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LeaderboardWidget(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
                        child: Text(
                          'user',
                          style: TextStyle(
                            fontFamily: 'Lexend Deca',
                            color: Color(0xFF4B39EF),
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Padding(
                //   padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                //   child: Text(
                //     'some games have not been picked',
                //     style: TextStyle(
                //       fontFamily: 'Poppins',
                //       color: Color(0xFFD30909),
                //     ),
                //   ),
                // ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Color(0xFFEEEEEE),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  StreamBuilder<QuerySnapshot>(
                    stream: _pickrecordStream,
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return const Text('Something went wrong');
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
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

                      return SizedBox(
                        height: 140,
                        width: MediaQuery.of(context).size.width,
                        child: ListView(
                          children:
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                            Map<String, dynamic> data =
                            document.data()! as Map<String, dynamic>;
                            return  Column(
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                    // color: FlutterFlowTheme.of(context)
                                    //     .secondaryBackground,
                                  ),
                                  child: Text(
                                    data["picks"].toString().replaceAll("[", "").replaceAll("]", ""),
                                    textAlign: TextAlign.center,
                                    style:const TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Poppins',
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Tie Breaker total - ',
                                        // style: FlutterFlowTheme.of(context).bodyMedium,
                                      ),
                                      Text(
                                        "${data["tiebreaker"]}",
                                        style:
                                        const TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          }).toList(),
                        ),
                      );
                    },
                  ),


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
