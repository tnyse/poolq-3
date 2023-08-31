
import 'dart:io';

// import 'package:dash/Screen/SignUp/verifyPhone.dart';
// import 'package:dash/Widget/customCircle.dart';
import 'package:admob_flutter/admob_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';

import '../../../Provider/AuthProvider.dart';
import '../../../Provider/homeProvider.dart';
import '../../../Widget/reuse.dart';

// import '../../../../Provider/Auth.dart';
// import '../../../../Widget/CheckRequestWidget.dart';
// import '../../../SignUp/SignIn.dart';


class EditProfile extends StatefulWidget {
  const EditProfile({super.key});



  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  String name = "";
  String email = "";

  List<String> ?items = ["Bike", "Car", "Truck"];
  String ?values = "Bike";
  File? image;
  final picker = ImagePicker();

  Future getImage() async {
    AuthProvider network = Provider.of<AuthProvider>(context, listen: false);
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      image = File(pickedFile!.path);
    });

    network.uploadImage(imagePath: image!.path, context: context);
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider =
    Provider.of<AuthProvider>(context, listen: true);




    Widget scaffold = Scaffold(
      bottomNavigationBar: Container(
          color: Colors.white,
          child: AdmobBanner(
            adUnitId: Provider.of<DataProvider>(context, listen: false)
                .getBannerAdUnitId().toString(),
            adSize: AdmobBannerSize.BANNER,
            listener: (AdmobAdEvent event, Map<String, dynamic> ?args) {},
          )),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20, top:40),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
            icon:const Icon(Icons.arrow_back, size: 26,
                        color: Color(0xFF063a73)),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
                   
                   const Spacer(),
                    const Text("")
                  ],
                ),
              ),
            ),


            Center(
              child: Stack(
                children: [
                  image!=null? Center(
                    child: CircleAvatar(
                        radius: 47,
                        backgroundColor: const Color(0xFFE5E7EB),
                        foregroundColor:  const Color(0xFFE5E7EB),
                        backgroundImage: FileImage(File(image!.path),
                        )),
                  ):Center(
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
                  Positioned(
                      left: MediaQuery.of(context).size.width*0.55,
                      top: 60,
                      child: InkWell(
                        onTap: (){
                          getImage();
                        },
                        child: Container(
                    height: 27,
                        width: 27,
                        decoration: const BoxDecoration(
                          color: Colors.black38,
                          shape: BoxShape.circle,
                        ),
                        child: const Center(child: Icon(Icons.camera_alt_outlined, size: 20, color: Colors.white,))),
                      ))
                ],
              ),
            ),


            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 2,
                        ),
                        height: 55,
                        child: TextFormField(
                          // controller: surname,
                          onChanged: (value) {

                          },
                          style: const TextStyle(color: Colors.black),
                          cursorColor: Colors.black,
                          enabled: false,
                          decoration: InputDecoration(
                            fillColor: const Color(0xFFF3F4F6),
                            filled: true,
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(left: 8.0, right: 8),
                              child: Icon(PhosphorIcons.regular.user,color: const Color(0xFF063a73)),
                            ),
                            labelStyle: const TextStyle(color: Colors.black38),
                            labelText: authProvider.username,
                            disabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xFFF3F4F6), width: 1.1),
                                borderRadius: BorderRadius.all(Radius.circular(10))),
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xFFF3F4F6), width: 1.1),
                                borderRadius: BorderRadius.all(Radius.circular(10))),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xFFF3F4F6), width: 1.1),
                                borderRadius: BorderRadius.all(Radius.circular(10))),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right:20.0),
                        child: IconButton(
                          icon: const Icon(Icons.edit_outlined, color: Color(0xFF063a73),),
                          onPressed: (){
                            _editDetails();
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            // Center(
            //   child: Padding(
            //     padding: const EdgeInsets.only(top: 25.0),
            //     child: Stack(
            //       children: [
            //          Center(
            //           child: Container(
            //             width: MediaQuery.of(context).size.width * 0.9,
            //             margin: EdgeInsets.symmetric(
            //               horizontal: 2,
            //             ),
            //             height: 55,
            //             child: TextFormField(
            //               // controller: email,
            //               onChanged: (value) {
            //
            //
            //               },
            //               style: TextStyle(color: Colors.black),
            //               cursorColor: Colors.black,
            //               enabled: false,
            //               decoration: InputDecoration(
            //                 fillColor: Color(0xFFF3F4F6),
            //                 filled: true,
            //                 prefixIcon: Padding(
            //                   padding: const EdgeInsets.only(left: 8.0, right: 8),
            //                   child: Icon(PhosphorIcons.regular.envelopeSimple, color: Color(0xFF1B9AAF)),
            //                 ),
            //                 labelStyle: TextStyle(color: Colors.black38),
            //                 labelText: authProvider.email,
            //                 disabledBorder: OutlineInputBorder(
            //                     borderSide: const BorderSide(
            //                         color: Color(0xFFF3F4F6), width: 1.1),
            //                     borderRadius: BorderRadius.all(Radius.circular(10))),
            //                 focusedBorder: OutlineInputBorder(
            //                     borderSide: const BorderSide(
            //                         color: Color(0xFFF3F4F6), width: 1.1),
            //                     borderRadius: BorderRadius.all(Radius.circular(10))),
            //                 border: OutlineInputBorder(
            //                     borderSide: const BorderSide(
            //                         color: Color(0xFFF3F4F6), width: 1.1),
            //                     borderRadius: BorderRadius.all(Radius.circular(10))),
            //               ),
            //             ),
            //           ),
            //         ),
            //         Align(
            //           alignment: Alignment.centerRight,
            //           child: Padding(
            //             padding: const EdgeInsets.only(right:20.0),
            //             child: IconButton(
            //               icon: Icon(Icons.edit_outlined, color: Color(0xFF1B9AAF),),
            //               onPressed: (){
            //                 _editDetails();
            //               },
            //             ),
            //           ),
            //         )
            //       ],
            //     ),
            //   ),
            // ),
            // Center(
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: [
            //       Padding(
            //         padding: const EdgeInsets.only(top: 25.0, right: 15),
            //         child: Container(
            //           width: MediaQuery.of(context).size.width * 0.2,
            //           margin: EdgeInsets.symmetric(
            //             horizontal: 2,
            //           ),
            //           height: 55,
            //           child: TextFormField(
            //             enabled: false,
            //             onChanged: (value) {
            //               // email = value;
            //             },
            //             style: TextStyle(color: Colors.white),
            //             cursorColor: Colors.white,
            //             decoration: InputDecoration(
            //               fillColor: Color(0xFF1B9AAF),
            //               filled: true,
            //               labelStyle: TextStyle(color: Colors.white),
            //               labelText: ' +234',
            //               enabledBorder: OutlineInputBorder(
            //                   borderSide: const BorderSide(
            //                       color: Color(0xFF1B9AAF), width: 1.1),
            //                   borderRadius: BorderRadius.all(Radius.circular(10))),
            //               focusedBorder: OutlineInputBorder(
            //                   borderSide: const BorderSide(
            //                       color: Color(0xFF1B9AAF), width: 1.1),
            //                   borderRadius: BorderRadius.all(Radius.circular(10))),
            //               border: OutlineInputBorder(
            //                   borderSide: const BorderSide(
            //                       color: Color(0xFF1B9AAF), width: 1.1),
            //                   borderRadius: BorderRadius.all(Radius.circular(10))),
            //             ),
            //           ),
            //         ),
            //       ),
            //       Padding(
            //         padding: const EdgeInsets.only(top: 25.0),
            //         child: Container(
            //           width: MediaQuery.of(context).size.width * 0.65,
            //           margin: EdgeInsets.symmetric(
            //             horizontal: 2,
            //           ),
            //           height: 55,
            //           child: TextFormField(
            //             // controller: phone,
            //             onChanged: (value) {
            //
            //             },
            //             enabled: false,
            //             style: TextStyle(color: Colors.black),
            //             cursorColor: Colors.black,
            //             decoration: InputDecoration(
            //               fillColor: Color(0xFFF3F4F6),
            //               filled: true,
            //               labelStyle: TextStyle(color: Colors.black38),
            //               labelText: authProvider.phone,
            //               disabledBorder: OutlineInputBorder(
            //                   borderSide: const BorderSide(
            //                       color: Color(0xFFF3F4F6), width: 1.1),
            //                   borderRadius: BorderRadius.all(Radius.circular(10))),
            //               focusedBorder: OutlineInputBorder(
            //                   borderSide: const BorderSide(
            //                       color: Color(0xFFF3F4F6), width: 1.1),
            //                   borderRadius: BorderRadius.all(Radius.circular(10))),
            //               border: OutlineInputBorder(
            //                   borderSide: const BorderSide(
            //                       color: Color(0xFFF3F4F6), width: 1.1),
            //                   borderRadius: BorderRadius.all(Radius.circular(10))),
            //             ),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );

    return scaffold;
  }



  _editDetails() {
    var authProvider = Provider.of<AuthProvider>(context, listen: false);
    final controller = TextEditingController();
    final controller2 = TextEditingController();
    controller.text = authProvider.username;
    controller2.text = authProvider.email;

    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(14),
            topLeft: Radius.circular(14),
          ),
        ),
        context: context,
        isScrollControlled: true,
        builder: (builder) {
          return ClipRRect(
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(14), topLeft: Radius.circular(14)),
            child: AnimatedPadding(
              padding: MediaQuery.of(context).viewInsets,
              duration: const Duration(milliseconds: 100),
              curve: Curves.decelerate,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(14),
                    topLeft: Radius.circular(14)),
                child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(14),
                          topLeft: Radius.circular(14)),
                    ),
                    height: 240.0,
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: ListView(
                      children: [
                        const Text(
                          "Edit",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18),
                        ),
                        const SizedBox(
                          height: 10,
                        ),

                        Container(
                          height: 50,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.only(left: 12),
                          decoration: BoxDecoration(
                              color: const Color(0xFFFFFFFF),
                              border: Border.all(color: const Color(0xFFF1F1FD)),
                              borderRadius:
                              const BorderRadius.all(Radius.circular(7))),
                          child: TextField(
                            // keyboardType: TextInputType.phone,
                            controller: controller,

                            decoration: const InputDecoration.collapsed(
                              hintText: 'Name',
                              hintStyle: TextStyle(
                                  fontSize: 16, color: Colors.black38),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),

                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                height: 34,
                                margin: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color(0xFFE9E9E9), width: 1),
                                    borderRadius: BorderRadius.circular(5)),
                                child: TextButton(
                                  // disabledColor: Color(0x909B049B),
                                  onPressed: () => Navigator.pop(context),
                                  style: TextButton.styleFrom(
                                    backgroundColor : Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    padding: const EdgeInsets.all(0.0),
                                  ),
                                  child: Ink(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Container(
                                      constraints: const BoxConstraints(
                                          maxWidth: 100, minHeight: 34.0),
                                      alignment: Alignment.center,
                                      child: const Text(
                                        "Cancel",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 34,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color(0xFFE9E9E9), width: 1),
                                    borderRadius: BorderRadius.circular(5)),
                                child: TextButton(
                                  // disabledColor: Color(0x909B049B),
                                  onPressed: () async {
                                    Navigator.pop(context);
                                    circularCustom(context);
                                    User? user =  FirebaseAuth.instance.currentUser;
                                   await user!.updateDisplayName(controller.text);
                                   authProvider.username = controller.text;
                                    Navigator.pop(context);
                                  },
                                  style: TextButton.styleFrom(
                                    backgroundColor : Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    padding: const EdgeInsets.all(0.0),
                                  ),
                                  child: Ink(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Container(
                                      constraints: const BoxConstraints(
                                          maxWidth: 100, minHeight: 34.0),
                                      alignment: Alignment.center,
                                      child: const Text(
                                        "Save",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                            ])
                      ],
                    )),
              ),
            ),
          );
        });
  }


}



