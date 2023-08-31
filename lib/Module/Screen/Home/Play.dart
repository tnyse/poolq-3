// import '/backend/api_requests/api_calls.dart';
// import '/flutter_flow/flutter_flow_icon_button.dart';
// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import '/flutter_flow/flutter_flow_widgets.dart';
// import '/player_picks/player_picks_widget.dart';
// import '/custom_code/actions/index.dart' as actions;
import 'dart:convert';
import 'package:admob_flutter/admob_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:poolq/Module/Screen/Home/rule.dart';
import 'package:provider/provider.dart';

import '../../../Constants/value.dart';
import '../../../Provider/homeProvider.dart';
import '../../../Widget/reuse.dart';
import 'PlayerPickWidget.dart';

// import 'play_model.dart';
// export 'play_model.dart';

class PlayWidget extends StatefulWidget {
  const PlayWidget({Key? key}) : super(key: key);

  @override
  _PlayWidgetState createState() => _PlayWidgetState();
}

class _PlayWidgetState extends State<PlayWidget> {
  // late PlayModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  List? data;

  TextEditingController tieBreakerController = TextEditingController();
  User? user = FirebaseAuth.instance.currentUser;
  Future getGame(context) async {
    DataProvider dataProvider =
    Provider.of<DataProvider>(context, listen: false);
    var response =
        await http.get(Uri.parse('https://poolq.app/getnlf/${dataProvider.game!["name"]}'), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    }).timeout(const Duration(seconds: 20));
    var body = json.decode(response.body);
    // print(body);
    // print(body);
    List body1 = body;
    setState(() {
      data = body1;
    });
    return body;
  }
  Stream<QuerySnapshot> ?_pickrecord;
  @override
  void initState() {
    super.initState();
    DataProvider dataProvider =
    Provider.of<DataProvider>(context, listen: false);
    _pickrecord =
        FirebaseFirestore.instance.collection('pickrecord').where("uid", isEqualTo: user!.uid).where("week", isEqualTo: dataProvider.game!["name"]).snapshots();
    getGame(context);
    // _model = createModel(context, () => PlayModel());

    // _model.tieBreakerController ??= TextEditingController();
  }



  @override
  void dispose() {
    // _model.dispose();

    super.dispose();
  }





  @override
  Widget build(BuildContext context) {
    // context.watch<FFAppState>();
    DataProvider dataProvider =
        Provider.of<DataProvider>(context, listen: true);


    return Scaffold(
        bottomNavigationBar: Container(
            color: Colors.white,
            child: AdmobBanner(
              adUnitId: Provider.of<DataProvider>(context, listen: false)
                  .getBannerAdUnitId().toString(),
              adSize: AdmobBannerSize.BANNER,
              listener: (AdmobAdEvent event, Map<String, dynamic> ?args) {},
            )),
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Image.asset(
                  'assets/images/assets.aboutamazon.jpg',
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 1,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 150,
                decoration: const BoxDecoration(
                  color: Color(0x43EEEEEE),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  20, 20, 120, 0),
                              child: Image.asset(
                                'assets/images/poolq12.png',
                                width: 67,
                                height: 90,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  20, 20, 0, 0),
                              child: Text(
                                'Welcome \nto week '.toUpperCase(),
                                textAlign: TextAlign.end,
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 20,
                                  height: 0.9,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  5, 20, 0, 0),
                              child: Text(
                                dataProvider.game!["name"].toString().replaceAll("REG", "").replaceAll("PRE", ""),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 30,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 120, 0, 0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Color(0x85C5C5C5),
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(1, 20, 1, 1),
                    child: Builder(
                      // future: getGame(),
                      builder: (context) {
                        // Customize what your widget looks like when it's loading.
                        if (data == null) {
                          return Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator(
                                color: primary,
                              ),
                            ),
                          );
                        }
                        final listViewGetScheduleResponse = data;
                        // print(data);
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 100.0),
                          child: Builder(
                            builder: (context) {
                              final game = listViewGetScheduleResponse;
                              return GroupedListView<dynamic, String>(
                                elements: game!,
                                groupBy: (element) => dataProvider.formatStringDate(element["date"]).toString(),
                                groupSeparatorBuilder: (String value) =>
                                    ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(20),
                                          topLeft: Radius.circular(20)),
                                      child: Container(
                                        width: 200,
                                        color: Colors.white,
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text(
                                            formateDate(value),
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                physics: const BouncingScrollPhysics(),
                                indexedItemBuilder: (context, dynamic gameItem, index) {
                                  // final gameItem = game[gameIndex];
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0, 0, 0, 20),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: const Color(0x0096e87d)
                                                .withOpacity(0.8),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0, 5, 0, 5),
                                            child: Row(
                                              mainAxisSize:
                                              MainAxisSize.max,
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                    MainAxisSize.max,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .center,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                        MainAxisSize
                                                            .max,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        children: [
                                                          const Text(
                                                            'GAME: ',
                                                            textAlign:
                                                            TextAlign
                                                                .center,
                                                            style:
                                                            TextStyle(
                                                              fontFamily:
                                                              'Poppins',
                                                              color: Color(
                                                                  0xFF27512F),
                                                              fontSize:
                                                              10,
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold,
                                                            ),
                                                          ),
                                                          Text(
                                                            (index + 1)
                                                                .toString(),
                                                            style:
                                                            const TextStyle(
                                                              fontFamily:
                                                              'Poppins',
                                                              fontSize:
                                                              10,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                        MainAxisSize
                                                            .max,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                        children: [
                                                          SvgPicture.network(
                                                              gameItem[
                                                              "picture"],
                                                              width: 40,
                                                              height: 40,
                                                              placeholderBuilder:
                                                                  (BuildContext
                                                              context) =>
                                                                  Container()),
                                                          TextButton(
                                                            onPressed:
                                                                () async {
                                                              if (dataProvider
                                                                  .playerPicks!
                                                                  .contains(
                                                                  gameItem["abbreviation"])) {
                                                                await showDialog(
                                                                  context:
                                                                  context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return AlertDialog(
                                                                      title:
                                                                      const Text('already picked!'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () => Navigator.pop(alertDialogContext),
                                                                          child: const Text('Ok'),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                );
                                                                return;
                                                              } else {
                                                                ScaffoldMessenger.of(
                                                                    context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                    Text(
                                                                      gameItem["abbreviation"],
                                                                      style:
                                                                      const TextStyle(
                                                                        color: Colors.white,
                                                                        fontSize: 24,
                                                                      ),
                                                                    ),
                                                                    duration:
                                                                    const Duration(milliseconds: 500),
                                                                    backgroundColor:
                                                                    const Color(0x85114802),
                                                                  ),
                                                                );
                                                              }
                                                              //
                                                              // FFAppState()
                                                              //     .update(() {
                                                              dataProvider
                                                                  .removeFromPlayerPicks(
                                                                  gameItem["abbreviation2"]);
                                                              dataProvider
                                                                  .addToPlayerPicks(
                                                                  gameItem["abbreviation"]);
                                                              // });
                                                            },
                                                            style:
                                                            ButtonStyle(
                                                              padding: MaterialStateProperty.all(
                                                                  const EdgeInsetsDirectional.fromSTEB(
                                                                      35,
                                                                      5,
                                                                      35,
                                                                      5)),
                                                              backgroundColor:
                                                              MaterialStateProperty.all(
                                                                  const Color(0x733474E0)),
                                                              foregroundColor:
                                                              MaterialStateProperty.all(
                                                                  const Color(0x733474E0)),
                                                              textStyle:
                                                              MaterialStateProperty.all(
                                                                  const TextStyle(
                                                                    fontFamily:
                                                                    'Poppins',
                                                                    color: Colors
                                                                        .white,
                                                                  )),
                                                              elevation:
                                                              MaterialStateProperty
                                                                  .all(2),
                                                              shape: MaterialStateProperty
                                                                  .all(
                                                                  RoundedRectangleBorder(
                                                                    side:
                                                                    const BorderSide(
                                                                      color: Colors
                                                                          .transparent,
                                                                      width:
                                                                      1,
                                                                    ),
                                                                    borderRadius:
                                                                    BorderRadius.circular(
                                                                        30),
                                                                  )),
                                                            ),
                                                            child: Row(
                                                              children: [
                                                                Text(
                                                                  gameItem[
                                                                  "abbreviation"],
                                                                  style: const TextStyle(
                                                                      fontWeight:
                                                                      FontWeight.bold,
                                                                      color: Colors.white),
                                                                ),
                                                                dataProvider.playerPicks!.contains(gameItem[
                                                                "abbreviation"])
                                                                    ? const Icon(
                                                                    Icons.check,
                                                                    color: Colors.white)
                                                                    : Container()
                                                              ],
                                                            ),
                                                          ),
                                                          Column(
                                                            children: [
                                                              const Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    5,
                                                                    0,
                                                                    5,
                                                                    0),
                                                                child: Text(
                                                                  'AT',
                                                                  // style: FlutterFlowTheme
                                                                  //     .of(context)
                                                                  //     .bodyMedium,
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    5,
                                                                    0,
                                                                    5,
                                                                    0),
                                                                child: Text(
                                                                  '${gameItem[
                                                                  "time"]}',
                                                                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                                                                ),
                                                              ),
                                                            ],
                                                          ),


                                                          TextButton(
                                                              style:
                                                              ButtonStyle(
                                                                padding: MaterialStateProperty.all(
                                                                    const EdgeInsetsDirectional.fromSTEB(
                                                                        35,
                                                                        5,
                                                                        35,
                                                                        5)),
                                                                backgroundColor:
                                                                MaterialStateProperty.all(
                                                                    const Color(0x733474E0)),
                                                                foregroundColor:
                                                                MaterialStateProperty.all(
                                                                    const Color(0x733474E0)),
                                                                textStyle:
                                                                MaterialStateProperty.all(
                                                                    const TextStyle(
                                                                      fontFamily:
                                                                      'Poppins',
                                                                      color: Colors
                                                                          .white,
                                                                    )),
                                                                elevation:
                                                                MaterialStateProperty.all(
                                                                    2),
                                                                shape: MaterialStateProperty
                                                                    .all(
                                                                    RoundedRectangleBorder(
                                                                      side:
                                                                      const BorderSide(
                                                                        color:
                                                                        Colors.transparent,
                                                                        width:
                                                                        1,
                                                                      ),
                                                                      borderRadius:
                                                                      BorderRadius.circular(30),
                                                                    )),
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                if (dataProvider
                                                                    .playerPicks!
                                                                    .contains(
                                                                    gameItem["abbreviation2"])) {
                                                                  await showDialog(
                                                                    context:
                                                                    context,
                                                                    builder:
                                                                        (alertDialogContext) {
                                                                      return AlertDialog(
                                                                        title: const Text('already picked!'),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed: () => Navigator.pop(alertDialogContext),
                                                                            child: const Text('Ok'),
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  );
                                                                  return;
                                                                } else {
                                                                  ScaffoldMessenger.of(context)
                                                                      .showSnackBar(
                                                                    SnackBar(
                                                                      content:
                                                                      Text(
                                                                        // getJsonField(
                                                                        gameItem["abbreviation2"],
                                                                        //   r'''$.home''',
                                                                        // ).toString(),,
                                                                        style: const TextStyle(
                                                                          color: Colors.white,
                                                                          fontSize: 24,
                                                                        ),
                                                                      ),
                                                                      duration:
                                                                      const Duration(milliseconds: 500),
                                                                      backgroundColor:
                                                                      const Color(0x85114802),
                                                                    ),
                                                                  );
                                                                  // FFAppState()
                                                                  //     .update(() {
                                                                  dataProvider.picked =
                                                                  true;
                                                                  // });
                                                                }

                                                                // FFAppState()
                                                                //     .update(() {
                                                                dataProvider
                                                                    .removeFromPlayerPicks(
                                                                    gameItem["abbreviation"]);
                                                                dataProvider
                                                                    .addToPlayerPicks(
                                                                    gameItem["abbreviation2"]);
                                                                // });
                                                              },
                                                              child:
                                                              Center(
                                                                child:
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                      gameItem["abbreviation2"],
                                                                      style:
                                                                      const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                                                                    ),
                                                                    dataProvider.playerPicks!.contains(gameItem["abbreviation2"])
                                                                        ? const Icon(Icons.check, color: Colors.white)
                                                                        : Container()
                                                                  ],
                                                                ),
                                                              )
                                                            // getJsonField(
                                                            //   gameItem,
                                                            //   r'''$.home''',
                                                            // ).toString(),
                                                            // options:

                                                          ),
                                                          SvgPicture.network(
                                                              gameItem[
                                                              "picture2"],
                                                              width: 40,
                                                              height: 40,
                                                              placeholderBuilder:
                                                                  (BuildContext
                                                              context) =>
                                                                  Container()),
                                                        ],
                                                      ),
                                                      // if (FFAppState().picked !=
                                                      //     null)
                                                      const Text(
                                                        'MAKE THE PICK!',
                                                        // style:
                                                        // FlutterFlowTheme.of(
                                                        //     context)
                                                        //     .bodyMedium
                                                        //     .override(
                                                        //   fontFamily:
                                                        //   'Poppins',
                                                        //   fontSize: 12,
                                                        // ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                                itemComparator: (item1, item2) =>
                                    item1['date']
                                        .compareTo(item2['date']),
                                // optional
                                useStickyGroupSeparators: true,
                                // optional
                                floatingHeader: true,
                                // optional
                                order: GroupedListOrder.ASC, // optional
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, 0.9),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 75,
                  decoration: const BoxDecoration(
                    color: Color(0xDD92EF7B),
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: (){


                                // scaffoldKey.currentState!
                                //     .showBottomSheet((context) {
                                //   return  RulesWidget();
                                // });
                                 Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const RulesWidget(),
                                  ),
                                );

                              },
                              child: SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: Image.asset("assets/images/rulebook.png")),
                            ),
                            Container(
                              width: 110,
                              decoration: const BoxDecoration(),
                              child: TextFormField(
                                controller: tieBreakerController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: 'Tie Breaker',
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.white,
                                      width: 0.5,
                                    ),
                                    borderRadius:
                                    BorderRadius.circular(5),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.white,
                                      width: 0.5,
                                    ),
                                    borderRadius:
                                    BorderRadius.circular(5),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.white,
                                      width: 0.5,
                                    ),
                                    borderRadius:
                                    BorderRadius.circular(5),
                                  ),
                                  focusedErrorBorder:
                                  OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.white,
                                      width: 0.5,
                                    ),
                                    borderRadius:
                                    BorderRadius.circular(5),
                                  ),
                                  filled: true,
                                  fillColor: const Color(0xC8DADADA),
                                  contentPadding:
                                  const EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 0, 0),
                                ),
                                // style: FlutterFlowTheme.of(context)
                                //     .bodyMedium
                                //     .override(
                                //   fontFamily: 'Poppins',
                                //   fontSize: 11,
                                // ),
                                keyboardType: TextInputType.number,
                                // validator: _model.tieBreakerControllerValidator
                                //     .asValidator(context),
                              ),
                            ),
                            TextButton(
                              // borderColor: Colors.transparent,
                              // borderRadius: 30,
                              // borderWidth: 1,
                              // buttonSize: 60,
                              // fillColor: Color(0xFF02B902),
                              child:  SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: Image.asset("assets/images/checked.png")),
                              onPressed: () async {
                                var shouldSetState = false;
                                if (tieBreakerController.text == '') {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        content: const Text(
                                            'enter tie breaker score'),
                                        actions: [
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            child: const Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                  // if (_shouldSetState) setState(() {});
                                  // return;
                                } else if (dataProvider.playerPicks!.length != data!.length ){
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        content: const Text(
                                            'some games have not been picked'),
                                        actions: [
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            child: const Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }else {
                                  // FFAppState().update(() {
                                  dataProvider.tiebreaker = int.parse(
                                      tieBreakerController.text);
                                  // });
                                  dataProvider.amount =
                                  dataProvider.countGames(
                                    dataProvider.playerPicks!.toList(),
                                  );
                                  shouldSetState = true;

                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const PlayerPicksWidget(),
                                    ),
                                  );
                                  if (shouldSetState) setState(() {});
                                }


                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
