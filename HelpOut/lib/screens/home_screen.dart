import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:help_out/main.dart';
import 'package:help_out/screens/first_screen.dart';
import 'package:help_out/screens/language_constants.dart';
import 'package:help_out/screens/others.dart';
import 'package:help_out/screens/others1.dart';
import 'package:help_out/screens/profile.dart';
import 'package:help_out/screens/first_screen.dart';
import 'package:help_out/screens/sign_up_screen.dart';
import 'package:help_out/screens/aboutus.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:help_out/screens/contactus.dart';
import 'package:help_out/screens/userlist.dart';
import 'package:help_out/screens/infopage1.dart';
import 'package:help_out/screens/infopage2.dart';
import 'package:help_out/screens/userlist.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:help_out/screens/contactus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:help_out/screens/profile.dart' show ProfilePage;
import 'package:help_out/screens/userlist2.dart';
import 'package:help_out/screens/language.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          // Do not allow user to go back to login page
          Navigator.of(context).popUntil((route) => route.isFirst);
          return false;
        },
        child: Scaffold(
          appBar: _buildappbar(context),
          drawer: _drawer(context),
          body: _bodyofscreen(context),
        ));
  }
}

Drawer _drawer(context) {
  return Drawer(
    child: ListView(padding: EdgeInsets.only(top: 30), children: [
      Container(
          height: 70,
          padding: EdgeInsets.only(top: 20, left: 10),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 194, 43, 86),
          ),
          child: Text(translation(context).menu,
              style: TextStyle(fontSize: 30, color: Colors.white))),
      // ListTile(
      //     title: Text("Profile", style: TextStyle(fontSize: 20)),
      //     onTap: () async {
      //       await _auth.signOut();
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(builder: (context) => profilepage2()),
      //       );
      //     }),
      ListTile(
          title: Text(translation(context).register,
              style: TextStyle(fontSize: 20)),
          onTap: () async {
            var url = Uri.parse(
                'https://docs.google.com/forms/d/e/1FAIpQLScwZwh_YzxMAZnFLefMoVRR40e2mjS29ulCiqKVV0-PnhkGEQ/viewform?usp=sf_link');
            // ignore: deprecated_member_use
            if (await canLaunchUrl(url)) {
              // ignore: deprecated_member_use
              await launchUrl(url);
            } else {
              throw 'Could not launch $url';
            }
          }),
      ListTile(
          title: Text(translation(context).contact,
              style: TextStyle(fontSize: 20)),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ContactPage()),
            );
          }),
      ListTile(
          title: Text(translation(context).aboutUs,
              style: TextStyle(fontSize: 20)),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AboutUsPage()),
            );
          }),
      ListTile(
          title: Text(translation(context).signout,
              style: TextStyle(fontSize: 20)),
          onTap: () async {
            await _auth.signOut();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SplashScreen()),
            );
          }),
    ]),
  );
}

Widget _bodyofscreen(BuildContext context) {
  return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 80),
      child: Column(children: [
        _row1(context),
        _row2(context),
        _row3(context),
      ]));
}

Row _row2(BuildContext context) {
  return Row(children: [
    Expanded(
        child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OrphanageListScreen2()));
              // first_screen();
              //print("button clicked");
            },
            child: Container(
              decoration: BoxDecoration(
                //foodlogo("assets/images/food.jpeg"),

                color: Color.fromARGB(255, 194, 43, 86),
                borderRadius: BorderRadius.circular(20.0),
              ),
              margin: EdgeInsets.only(right: 20, left: 40, top: 40),
              height: 150,
              width: 100,
              padding: EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Image.asset("assets/images/book2.png",
                      height: 80, width: 80, fit: BoxFit.contain),
                  Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Text(translation(context).books,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                          )))
                ],
              ),
            ))),
    // Icon(Icons.book_online_outlined , color : Colors.black, ),
    Expanded(
        child: GestureDetector(
            onTap: () async {
              var url = Uri.parse(
                  'https://docs.google.com/forms/d/e/1FAIpQLSdXPCwIt-OsdGh140x97q9UbO6Oqss_0MKJ16js3ENm2Gbkkg/viewform');
              // ignore: deprecated_member_use
              if (await canLaunchUrl(url)) {
                // ignore: deprecated_member_use
                await launchUrl(url);
              } else {
                throw 'Could not launch $url';
              }
            },
            child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 194, 43, 86),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                margin: EdgeInsets.only(right: 30, left: 30, top: 40),
                height: 150,
                width: 100,
                //padding: EdgeInsets.only(top:20 ),
                child: Column(
                  children: [
                    Image.asset("assets/images/teaching.png",
                        height: 105, width: 100, fit: BoxFit.fitHeight),
                    Container(
                        //margin: EdgeInsets.only(bottom:5),
                        child: Text(translation(context).teaching,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 23,
                            )))
                  ],
                )))),
  ]);
}

Row _row1(context) {
  return Row(children: [
    Expanded(
      child: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => OrphanageListScreen()));
          },
          child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 194, 43, 86),
                borderRadius: BorderRadius.circular(20.0),
              ),
              margin: EdgeInsets.only(right: 20, left: 40),
              height: 150,
              width: 100,
              padding: EdgeInsets.only(top: 25),
              child: Column(
                children: [
                  foodlogo("assets/images/food3.png"),
                  Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(translation(context).food,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                          )))
                ],
              ))),
    ),
    Expanded(
        child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OrphanageListScreen()));
            },
            child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 194, 43, 86),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                margin: EdgeInsets.only(right: 30, left: 30),
                height: 150,
                width: 100,
                padding: EdgeInsets.only(top: 25),
                child: Column(
                  children: [
                    Image.asset("assets/images/money2.png",
                        height: 70, width: 70, fit: BoxFit.contain),
                    Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text(translation(context).money,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 23,
                            )))
                  ],
                )))),
  ]);
}

Image foodlogo(String s) {
  return Image.asset(
    s,
    fit: BoxFit.contain,
    height: 70,
    width: 70,
  );
}

Row _row3(context) {
  return Row(children: [
    Expanded(
        child: GestureDetector(
      onTap: () => {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => OrphanageListScreen2()))
      },
      child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 194, 43, 86),
            borderRadius: BorderRadius.circular(20.0),
          ),
          margin: EdgeInsets.only(right: 20, left: 40, top: 40),
          height: 150,
          width: 100,
          padding: EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Image.asset("assets/images/clothes.png",
                  height: 70, width: 70, fit: BoxFit.contain),
              Container(
                  margin: EdgeInsets.only(top: 15),
                  child: Text(translation(context).clothes,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                      )))
            ],
          )),
    )),
    Expanded(
        child: GestureDetector(
      onTap: () => {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Donationlinks()))
      },
      child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 194, 43, 86),
            borderRadius: BorderRadius.circular(20.0),
          ),
          margin: EdgeInsets.only(right: 30, left: 30, top: 40),
          height: 150,
          width: 100,
          padding: EdgeInsets.only(top: 25),
          child: Column(
            children: [
              Image.asset("assets/images/others.png",
                  height: 70, width: 60, fit: BoxFit.contain),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text(translation(context).others,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                      )))
            ],
          )),
    )),
  ]);
}

AppBar _buildappbar(context) {
  // return AppBar(
  //     backgroundColor: Color.fromARGB(255, 194, 43, 86),
  //     title: Row(children: [
  //       Expanded(
  //           child: Text("HelpOut",
  //               style: TextStyle(
  //                   color: Colors.white,
  //                   fontStyle: FontStyle.normal,
  //                   fontSize: 28.0))),
  //       // GestureDetector(
  //       //   // onTap:()=>{

  //       //   //   Navigator.push(context,
  //       //   //   MaterialPageRoute(builder: (context) => ProfilePage(user: null,)))
  //       //   // },
  //       //     child: Icon(
  //       //   Icons.language_sharp,
  //       // ))
  //         // Padding(padding: EdgeInsets.all(5.0),
  //         // child: DropdownButton<String>(
  //         //   underline: const SizedBox(),
  //         //   icon: Icon(
  //         //     Icons.language,
  //         //     color: Colors.white,
  //         //   ),
  //         //   items:<String> ["English", "मराठी","മലയാളം","हिंदी"].map((String language){
  //         //     return DropdownMenuItem(
  //         //       value: language,
  //         //       child : Text(language),
  //         //     );
  //         //   }).toList(),
  //         //   onChanged: (String){},
  //         // ))
  //     ]));
  return AppBar(
    backgroundColor: Color.fromARGB(255, 194, 43, 86),
    title: Text("HelpOut",
        style: TextStyle(
            color: Colors.white, fontStyle: FontStyle.normal, fontSize: 28.0)),
    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: DropdownButton<Language>(
          underline: const SizedBox(),
          icon: const Icon(
            Icons.language,
            color: Colors.white,
          ),
          onChanged: (Language? language) async {
            if (language != null) {
              Locale _locale = await setLocale(language.languageCode);
              MyApp.setLocale(context, _locale);
            }
          },
          items: Language.languageList()
              .map<DropdownMenuItem<Language>>(
                (e) => DropdownMenuItem<Language>(
                  value: e,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      // Text(
                      //   e.flag,
                      //   style: const TextStyle(fontSize: 30),
                      // ),
                      Text(e.name)
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ),
    ],
  );
}
