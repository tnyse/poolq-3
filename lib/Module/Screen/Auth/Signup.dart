// import '/auth/firebase_auth/auth_util.dart';
// import '/flutter_flow/flutter_flow_animations.dart';
// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import '/flutter_flow/flutter_flow_widgets.dart';
// import '/forget/forget_widget.dart';
// import '/home_page/home_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:poolq/Provider/AuthProvider.dart';
import 'package:provider/provider.dart';

import '../../../Constants/value.dart';
import '../../../Widget/reuse.dart';
import 'Forget.dart';

// import 'register_model.dart';
// export 'register_model.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({Key? key}) : super(key: key);

  @override
  _RegisterWidgetState createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget>
    with TickerProviderStateMixin {
  // late RegisterModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  TextEditingController? emailAddressController1;
  TextEditingController? displayNameController;
  TextEditingController? passwordController1;
  TextEditingController? passwordConfirmController;
  TextEditingController? emailAddressController2;
  TextEditingController? passwordController2;

  @override
  void initState() {
    super.initState();
    // _model = createModel(context, () => RegisterModel());

    emailAddressController1 ??= TextEditingController();
    passwordController1 ??= TextEditingController();
    displayNameController ??= TextEditingController();
    passwordConfirmController ??= TextEditingController();
    emailAddressController2 ??= TextEditingController();
    passwordController2 ??= TextEditingController();
  }

  @override
  void dispose() {
    // _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // context.watch<FFAppState>();
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: secondaryBackground,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.asset("assets/images/gb.jpeg", fit: BoxFit.cover),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(color: Colors.white38),
                child: const Text(""),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(32, 32, 32, 32),
                child: Container(
                  width: double.infinity,
                  height: 230,
                  decoration: BoxDecoration(
                    color: boxColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  alignment: const AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 90),
                    child: Image.asset(
                      'assets/images/poolq12.png',
                      width: 60,
                      height: 100,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, -1),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 150, 0, 0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                            padding:
                                const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                            child: Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.width >= 668.0
                                  ? 560.0
                                  : 560.0,
                              constraints: const BoxConstraints(
                                maxWidth: 570,
                              ),
                              decoration: BoxDecoration(
                                color: secondaryBackground,
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: Color(0x33000000),
                                    offset: Offset(0, 2),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: boxColor,
                                  width: 2,
                                ),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                                child: DefaultTabController(
                                  length: 2,
                                  initialIndex: 0,
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: const Alignment(0, 0),
                                        child: TabBar(
                                          isScrollable: true,
                                          // labelColor: FlutterFlowTheme.of(context)
                                          //     .primaryText,
                                          // unselectedLabelColor:
                                          // FlutterFlowTheme.of(context)
                                          //     .secondaryText,
                                          labelPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  32, 0, 32, 0),
                                          // labelStyle: FlutterFlowTheme.of(context)
                                          //     .titleMedium,
                                          indicatorColor: primary,
                                          indicatorWeight: 3,
                                          tabs: const [
                                            Tab(
                                              child: Text('Create Account',
                                                  style: TextStyle(
                                                      color: Colors.black)),
                                            ),
                                            Tab(
                                              child: Text('Log In',
                                                  style: TextStyle(
                                                      color: Colors.black)),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: TabBarView(
                                          children: [
                                            Align(
                                              alignment:
                                                  const AlignmentDirectional(0, -1),
                                              child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(24, 16, 24, 0),
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        // if (responsiveVisibility(
                                                        //   context: context,
                                                        //   phone: false,
                                                        //   tablet: false,
                                                        // ))
                                                        //   Container(
                                                        //     width: 230,
                                                        //     height: 40,
                                                        //     decoration:
                                                        //     BoxDecoration(
                                                        //       color: FlutterFlowTheme
                                                        //           .of(context)
                                                        //           .secondaryBackground,
                                                        //     ),
                                                        //   ),
                                                        const Text(
                                                          'Create Account',
                                                          textAlign:
                                                              TextAlign.start,
                                                          // style:
                                                          // FlutterFlowTheme.of(
                                                          //     context)
                                                          //     .headlineMedium,
                                                        ),
                                                        const Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      4, 0, 24),
                                                          child: Text(
                                                            'Let\'s get started by filling out the form below.',
                                                            textAlign:
                                                                TextAlign.start,
                                                            // style:
                                                            // FlutterFlowTheme.of(
                                                            //     context)
                                                            //     .labelMedium,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 0, 16),
                                                          child: SizedBox(
                                                            width:
                                                                double.infinity,
                                                            child:
                                                                TextFormField(
                                                              controller:
                                                                  emailAddressController1,
                                                              autofocus: true,
                                                              autofillHints: const [
                                                                AutofillHints
                                                                    .email
                                                              ],
                                                              obscureText:
                                                                  false,
                                                              decoration:
                                                                  InputDecoration(
                                                                labelText:
                                                                    'Email',
                                                                // labelStyle:
                                                                // FlutterFlowTheme.of(
                                                                //     context)
                                                                //     .titleMedium
                                                                //     .override(
                                                                //   fontFamily:
                                                                //   'Poppins',
                                                                //   color: FlutterFlowTheme.of(
                                                                //       context)
                                                                //       .secondaryText,
                                                                // ),
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                      borderSide:
                                                                      const BorderSide(
                                                                        color: Colors.black26,
                                                                      ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                ),
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                      borderSide:
                                                                      const BorderSide(
                                                                        color: Colors.black26,
                                                                      ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                ),
                                                                errorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                  const BorderSide(
                                                                    color: Colors.black26,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              40),
                                                                ),
                                                                focusedErrorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                  const BorderSide(
                                                                    color: Colors.black26,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                ),
                                                                filled: true,
                                                                    fillColor: Colors.white,
                                                                // contentPadding:
                                                                // EdgeInsetsDirectional
                                                                //     .fromSTEB(
                                                                //     24,
                                                                //     24,
                                                                //     24,
                                                                //     24),
                                                              ),
                                                              // style: FlutterFlowTheme
                                                              //     .of(context)
                                                              //     .titleMedium,
                                                              keyboardType:
                                                                  TextInputType
                                                                      .emailAddress,
                                                              // validator: _model
                                                              //     .emailAddressController1Validator
                                                              //     .asValidator(
                                                              //     context),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(0,
                                                              0, 0, 16),
                                                          child: SizedBox(
                                                            width:
                                                            double.infinity,
                                                            child:
                                                            TextFormField(
                                                              controller:
                                                              displayNameController,
                                                              autofocus: true,
                                                              autofillHints: const [
                                                                AutofillHints
                                                                    .name
                                                              ],
                                                              obscureText:
                                                              false,
                                                              decoration:
                                                              InputDecoration(
                                                                labelText:
                                                                'Fullname',
                                                                // labelStyle:
                                                                // FlutterFlowTheme.of(
                                                                //     context)
                                                                //     .titleMedium
                                                                //     .override(
                                                                //   fontFamily:
                                                                //   'Poppins',
                                                                //   color: FlutterFlowTheme.of(
                                                                //       context)
                                                                //       .secondaryText,
                                                                // ),
                                                                enabledBorder:
                                                                OutlineInputBorder(
                                                                  borderSide:
                                                                  const BorderSide(
                                                                    color: Colors.black26,
                                                                  ),
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      5),
                                                                ),
                                                                focusedBorder:
                                                                OutlineInputBorder(
                                                                  borderSide:
                                                                  const BorderSide(
                                                                    color: Colors.black26,
                                                                  ),
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      5),
                                                                ),
                                                                errorBorder:
                                                                OutlineInputBorder(
                                                                  borderSide:
                                                                  const BorderSide(
                                                                    color: Colors.black26,
                                                                  ),
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      5),
                                                                ),
                                                                focusedErrorBorder:
                                                                OutlineInputBorder(
                                                                  borderSide:
                                                                  const BorderSide(
                                                                    color: Colors.black26,
                                                                  ),
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      5),
                                                                ),
                                                                filled: true,
                                                                fillColor: Colors.white,
                                                                // contentPadding:
                                                                // EdgeInsetsDirectional
                                                                //     .fromSTEB(
                                                                //     24,
                                                                //     24,
                                                                //     24,
                                                                //     24),
                                                              ),
                                                              // style: FlutterFlowTheme
                                                              //     .of(context)
                                                              //     .titleMedium,
                                                              keyboardType:
                                                              TextInputType
                                                                  .text,
                                                              // validator: _model
                                                              //     .emailAddressController1Validator
                                                              //     .asValidator(
                                                              //     context),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 0, 16),
                                                          child: SizedBox(
                                                            width:
                                                                double.infinity,
                                                            child:
                                                                TextFormField(
                                                              controller:
                                                                  passwordController1,
                                                              autofocus: true,
                                                              autofillHints: const [
                                                                AutofillHints
                                                                    .password
                                                              ],
                                                              // obscureText: passwordVisibility1,
                                                              decoration:
                                                                  InputDecoration(
                                                                labelText:
                                                                    'Password',
                                                                // labelStyle:
                                                                // FlutterFlowTheme.of(
                                                                //     context)
                                                                //     .titleMedium
                                                                //     .override(
                                                                //   fontFamily:
                                                                //   'Poppins',
                                                                //   color: FlutterFlowTheme.of(
                                                                //       context)
                                                                //       .secondaryText,
                                                                // ),
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                      borderSide:
                                                                      const BorderSide(
                                                                        color: Colors.black26,
                                                                      ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                ),
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                      borderSide:
                                                                      const BorderSide(
                                                                        color: Colors.black26,
                                                                      ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                ),
                                                                errorBorder:
                                                                    OutlineInputBorder(
                                                                      borderSide:
                                                                      const BorderSide(
                                                                        color: Colors.black26,
                                                                      ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                ),
                                                                focusedErrorBorder:
                                                                    OutlineInputBorder(
                                                                      borderSide:
                                                                      const BorderSide(
                                                                        color: Colors.black26,
                                                                      ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                ),
                                                                filled: true,
                                                                    fillColor: Colors.white,
                                                                // contentPadding:
                                                                // EdgeInsetsDirectional
                                                                //     .fromSTEB(
                                                                //     24,
                                                                //     24,
                                                                //     24,
                                                                //     24),
                                                                suffixIcon:
                                                                    InkWell(
                                                                  // onTap: () =>
                                                                  //     setState(
                                                                  //           () => _model
                                                                  //           .passwordVisibility1 =
                                                                  //       !_model
                                                                  //           .passwordVisibility1,
                                                                  //     ),
                                                                  focusNode: FocusNode(
                                                                      skipTraversal:
                                                                          true),
                                                                  child: const Icon(
                                                                    Icons
                                                                        .visibility_off_outlined,
                                                                    // color: FlutterFlowTheme.of(
                                                                    //     context)
                                                                    //     .secondaryText,
                                                                    size: 24,
                                                                  ),
                                                                ),
                                                              ),
                                                              // style: FlutterFlowTheme
                                                              //     .of(context)
                                                              //     .titleMedium,
                                                              // validator: _model
                                                              //     .passwordController1Validator
                                                              //     .asValidator(
                                                              //     context),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 0, 16),
                                                          child: SizedBox(
                                                            width:
                                                                double.infinity,
                                                            child:
                                                                TextFormField(
                                                              controller:
                                                                  passwordConfirmController,
                                                              autofocus: true,
                                                              autofillHints: const [
                                                                AutofillHints
                                                                    .password
                                                              ],
                                                              // obscureText: !_model
                                                              //     .passwordConfirmVisibility,
                                                              decoration:
                                                                  InputDecoration(
                                                                labelText:
                                                                    'Confirm Password',
                                                                // labelStyle:
                                                                // FlutterFlowTheme.of(
                                                                //     context)
                                                                //     .titleMedium
                                                                //     .override(
                                                                //   fontFamily:
                                                                //   'Poppins',
                                                                //   color: FlutterFlowTheme.of(
                                                                //       context)
                                                                //       .secondaryText,
                                                                // ),
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                      borderSide:
                                                                      const BorderSide(
                                                                        color: Colors.black26,
                                                                      ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                ),
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                      borderSide:
                                                                      const BorderSide(
                                                                        color: Colors.black26,
                                                                      ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                ),
                                                                errorBorder:
                                                                    OutlineInputBorder(
                                                                      borderSide:
                                                                      const BorderSide(
                                                                        color: Colors.black26,
                                                                      ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                ),
                                                                focusedErrorBorder:
                                                                    OutlineInputBorder(
                                                                      borderSide:
                                                                      const BorderSide(
                                                                        color: Colors.black26,
                                                                      ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                ),
                                                                filled: true,
                                                                fillColor: Colors.white,
                                                                // contentPadding:
                                                                // EdgeInsetsDirectional
                                                                //     .fromSTEB(
                                                                //     24,
                                                                //     24,
                                                                //     24,
                                                                //     24),
                                                                suffixIcon:
                                                                    InkWell(
                                                                  // onTap: () =>
                                                                  //     setState(
                                                                  //           () => _model
                                                                  //           .passwordConfirmVisibility =
                                                                  //       !_model
                                                                  //           .passwordConfirmVisibility,
                                                                  //     ),
                                                                  focusNode: FocusNode(
                                                                      skipTraversal:
                                                                          true),
                                                                  child: const Icon(
                                                                    Icons
                                                                        .visibility_off_outlined,
                                                                    // color: FlutterFlowTheme.of(
                                                                    //     context)
                                                                    //     .secondaryText,
                                                                    size: 24,
                                                                  ),
                                                                ),
                                                              ),
                                                              // style: FlutterFlowTheme
                                                              //     .of(context)
                                                              //     .titleMedium,
                                                              // validator: _model
                                                              //     .passwordConfirmControllerValidator
                                                              //     .asValidator(
                                                              //     context),
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  0, 0),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        16),
                                                            child: SizedBox(
                                                              width: 230,
                                                              height: 52,
                                                              child: TextButton(
                                                                onPressed:
                                                                    () async {
                                                                  if (passwordController1!
                                                                          .text !=
                                                                      passwordConfirmController!
                                                                          .text) {
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                      const SnackBar(
                                                                        content:
                                                                            Text(
                                                                          'Passwords don\'t match!',
                                                                        ),
                                                                      ),
                                                                    );
                                                                    return;
                                                                  }

                                                                  circularCustom(
                                                                      context);

                                                                       authProvider
                                                                          .register(
                                                                    context,
                                                                    emailAddressController1!
                                                                        .text,
                                                                    passwordController1!
                                                                        .text,
                                                                           displayNameController!.text,
                                                                  );
                                                                },
                                                                style:
                                                                    ButtonStyle(
                                                                  padding:
                                                                      MaterialStateProperty
                                                                          .all(
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                  ),
                                                                  backgroundColor:
                                                                      MaterialStateProperty
                                                                          .all(
                                                                              primary),
                                                                  foregroundColor:
                                                                      MaterialStateProperty
                                                                          .all(
                                                                              primary),
                                                                  textStyle:
                                                                      MaterialStateProperty
                                                                          .all(
                                                                              const TextStyle(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: Colors
                                                                        .white,
                                                                  )),
                                                                  shape: MaterialStateProperty
                                                                      .all(
                                                                          RoundedRectangleBorder(
                                                                    side:
                                                                        const BorderSide(
                                                                      color: Colors
                                                                          .transparent,
                                                                      width: 1,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            40),
                                                                  )),
                                                                  elevation:
                                                                      MaterialStateProperty
                                                                          .all(
                                                                              3),
                                                                ),
                                                                child: const Text(
                                                                    'Get Started',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white)),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                  //     .animateOnPageLoad(animationsMap[
                                                  // 'columnOnPageLoadAnimation1']!),
                                                  ),
                                            ),
                                            Align(
                                              alignment:
                                                  const AlignmentDirectional(0, -1),
                                              child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(24, 16, 24, 0),
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        // if (responsiveVisibility(
                                                        //   context: context,
                                                        //   phone: false,
                                                        //   tablet: false,
                                                        // ))
                                                        //   Container(
                                                        //     width: 230,
                                                        //     height: 40,
                                                        //     decoration:
                                                        //     BoxDecoration(
                                                        //       color: FlutterFlowTheme
                                                        //           .of(context)
                                                        //           .secondaryBackground,
                                                        //     ),
                                                        //   ),
                                                        const Text(
                                                          'Welcome Back',
                                                          textAlign:
                                                              TextAlign.start,
                                                          // style:
                                                          // FlutterFlowTheme.of(
                                                          //     context)
                                                          //     .headlineMedium,
                                                        ),
                                                        const Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      4, 0, 24),
                                                          child: Text(
                                                            'Fill out the information below in order to access your account.',
                                                            textAlign:
                                                                TextAlign.start,
                                                            // style:
                                                            // FlutterFlowTheme.of(
                                                            //     context)
                                                            //     .labelMedium,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 0, 16),
                                                          child: SizedBox(
                                                            width:
                                                                double.infinity,
                                                            child:
                                                                TextFormField(
                                                              controller:
                                                                  emailAddressController2,
                                                              autofocus: true,
                                                              autofillHints: const [
                                                                AutofillHints
                                                                    .email
                                                              ],
                                                              obscureText:
                                                                  false,
                                                              decoration:
                                                                  InputDecoration(
                                                                labelText:
                                                                    'Email',
                                                                // labelStyle:
                                                                // FlutterFlowTheme.of(
                                                                //     context)
                                                                //     .labelLarge,
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                      borderSide:
                                                                      const BorderSide(
                                                                        color: Colors.black26,
                                                                      ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                ),
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color:
                                                                        primary,
                                                                    width: 2,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                ),
                                                                errorBorder:
                                                                    OutlineInputBorder(
                                                                      borderSide:
                                                                      const BorderSide(
                                                                        color: Colors.black26,
                                                                      ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                ),
                                                                focusedErrorBorder:
                                                                    OutlineInputBorder(
                                                                      borderSide:
                                                                      const BorderSide(
                                                                        color: Colors.black26,
                                                                      ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                ),
                                                                // filled: true,
                                                                // fillColor: FlutterFlowTheme
                                                                //     .of(context)
                                                                //     .secondaryBackground,
                                                                contentPadding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            24,
                                                                            24,
                                                                            0,
                                                                            24),
                                                              ),
                                                              // style: FlutterFlowTheme
                                                              //     .of(context)
                                                              //     .bodyLarge,
                                                              keyboardType:
                                                                  TextInputType
                                                                      .emailAddress,
                                                              // validator: _model
                                                              //     .emailAddressController2Validator
                                                              //     .asValidator(
                                                              //     context),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 0, 16),
                                                          child: SizedBox(
                                                            width:
                                                                double.infinity,
                                                            child:
                                                                TextFormField(
                                                              controller:
                                                                  passwordController2,
                                                              autofocus: true,
                                                              autofillHints: const [
                                                                AutofillHints
                                                                    .password
                                                              ],
                                                              // obscureText: !_model
                                                              //     .passwordVisibility2,
                                                              decoration:
                                                                  InputDecoration(
                                                                labelText:
                                                                    'Password',
                                                                // labelStyle:
                                                                // FlutterFlowTheme.of(
                                                                //     context)
                                                                //     .labelLarge,
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                      borderSide:
                                                                      const BorderSide(
                                                                        color: Colors.black26,
                                                                      ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                ),
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                      borderSide:
                                                                      const BorderSide(
                                                                        color: Colors.black26,
                                                                      ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                ),
                                                                errorBorder:
                                                                OutlineInputBorder(
                                                                  borderSide:
                                                                  const BorderSide(
                                                                    color: Colors.black26,
                                                                  ),
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      5),
                                                                ),
                                                                focusedErrorBorder:
                                                                OutlineInputBorder(
                                                                  borderSide:
                                                                  const BorderSide(
                                                                    color: Colors.black26,
                                                                  ),
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      5),
                                                                ),
                                                                filled: true,
                                                                fillColor:
                                                                    secondaryBackground,
                                                                contentPadding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            24,
                                                                            24,
                                                                            0,
                                                                            24),
                                                                suffixIcon:
                                                                    InkWell(
                                                                  // onTap: () =>
                                                                  //     setState(
                                                                  //           () => _model
                                                                  //           .passwordVisibility2 =
                                                                  //       !_model
                                                                  //           .passwordVisibility2,
                                                                  //     ),
                                                                  focusNode: FocusNode(
                                                                      skipTraversal:
                                                                          true),
                                                                  child: const Icon(
                                                                    Icons
                                                                        .visibility_off_outlined,
                                                                    // color: FlutterFlowTheme.of(
                                                                    //     context)
                                                                    //     .secondaryText,
                                                                    size: 24,
                                                                  ),
                                                                ),
                                                              ),
                                                              // style: FlutterFlowTheme
                                                              //     .of(context)
                                                              //     .bodyLarge,
                                                              // validator: _model
                                                              //     .passwordController2Validator
                                                              //     .asValidator(
                                                              //     context),
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  0, 0),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        16),
                                                            child: SizedBox(
                                                              width: 230,
                                                              height: 52,
                                                              child: TextButton(
                                                                onPressed:
                                                                    () async {
                                                                      circularCustom(
                                                                          context);

                                                                   authProvider
                                                                      .login(
                                                                    context,
                                                                    emailAddressController2!
                                                                        .text,
                                                                     passwordController2!
                                                                        .text,
                                                                  );
                                                                      // .then((value) {
                                                                    // if (value) {
                                                                    //   print(true);
                                                                    //
                                                                    //   Navigator.pushAndRemoveUntil(
                                                                    //     context,
                                                                    //     MaterialPageRoute(
                                                                    //       builder: (context) => HomePageWidget(),
                                                                    //     ),
                                                                    //     (r) => false,
                                                                    //   );
                                                                    //
                                                                    // }{
                                                                    //   print(false);
                                                                    //   Navigator.pop(
                                                                    //       context);
                                                                    // }
                                                                  // });
                                                                },
                                                                style:
                                                                    ButtonStyle(
                                                                  padding:
                                                                      MaterialStateProperty
                                                                          .all(
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                  ),
                                                                  backgroundColor:
                                                                      MaterialStateProperty
                                                                          .all(
                                                                              primary),
                                                                  foregroundColor:
                                                                      MaterialStateProperty
                                                                          .all(
                                                                              primary),
                                                                  textStyle:
                                                                      MaterialStateProperty
                                                                          .all(
                                                                              const TextStyle(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: Colors
                                                                        .white,
                                                                  )),
                                                                  shape: MaterialStateProperty
                                                                      .all(
                                                                          RoundedRectangleBorder(
                                                                    side:
                                                                        const BorderSide(
                                                                      color: Colors
                                                                          .transparent,
                                                                      width: 1,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            40),
                                                                  )),
                                                                  elevation:
                                                                      MaterialStateProperty
                                                                          .all(
                                                                              3),
                                                                ),
                                                                child: const Text(
                                                                    'Sign In',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white)),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  0, 0),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        16),
                                                            child: TextButton(
                                                              onPressed:
                                                                  () async {
                                                                 Navigator
                                                                    .push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                        const ForgetWidget(),
                                                                  ),
                                                                );
                                                              },
                                                              style:
                                                                  ButtonStyle(
                                                                padding:
                                                                    MaterialStateProperty
                                                                        .all(
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                ),
                                                                backgroundColor:
                                                                    MaterialStateProperty
                                                                        .all(Colors
                                                                            .white),
                                                                foregroundColor:
                                                                    MaterialStateProperty
                                                                        .all(Colors
                                                                            .white),
                                                                textStyle:
                                                                    MaterialStateProperty
                                                                        .all(
                                                                            const TextStyle(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: Colors
                                                                      .black,
                                                                )),
                                                                shape: MaterialStateProperty
                                                                    .all(
                                                                        RoundedRectangleBorder(
                                                                  side:
                                                                      const BorderSide(
                                                                    color: Colors
                                                                        .transparent,
                                                                    width: 1,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              40),
                                                                )),
                                                                // elevation: MaterialStateProperty.all(3),
                                                              ),
                                                              child: const Text(
                                                                  'Forgot Password?',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black)),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )

                                                  //     .animateOnPageLoad(animationsMap[
                                                  // 'columnOnPageLoadAnimation2']!),
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )

                            // .animateOnPageLoad(
                            // animationsMap['containerOnPageLoadAnimation']!),
                            ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
