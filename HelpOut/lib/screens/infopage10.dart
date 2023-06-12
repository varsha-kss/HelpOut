import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:help_out/screens/home_screen.dart';
import 'package:help_out/screens/first_screen.dart';
import 'package:help_out/screens/language_constants.dart';
import 'package:help_out/screens/sign_up_screen.dart';
import 'package:help_out/screens/aboutus.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:help_out/screens/contactus.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPage10 extends StatelessWidget {
  const InfoPage10({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 194, 43, 86),
          title: const Text('Details'),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              })),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 15, left: 15, right: 15),
              height: 200,
              width: double.infinity,
              color: Colors.grey[300],
              child:
                  Center(child: Image.asset('assets/images/infopage10i.jpeg')),
            ),
            const SizedBox(height: 20),
            // Text placeholders
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    translation(context).info10name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Container(
                      margin: EdgeInsets.only(right: 20),
                      child: Text("Address : Kozhikode,Kerala 673604",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold))),
                  const SizedBox(height: 10),
                  Text(
                    translation(context).info10about,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Phone number
            GestureDetector(
              onTap: () async {
                final Uri url = Uri(
                  scheme: 'tel',
                  path: "85471 01622",
                );
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                } else {
                  print('cannot launch this url');
                }
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.call, color: Colors.white),
                    const SizedBox(width: 10),
                    Text(
                      'Call +918547101622',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Location link
            GestureDetector(
              onTap: () async {
                var url = Uri.parse(
                    'https://www.google.com/maps/place/Relief+Old+Age+Home/@11.3411721,76.0579852,17z/data=!3m1!4b1!4m6!3m5!1s0x3ba640425b928c75:0xd4839608b2924479!8m2!3d11.3411721!4d76.0605548!16s%2Fg%2F11f3vkmq6p');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 194, 43, 86),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on, color: Colors.white),
                    const SizedBox(width: 10),
                    Text(
                      translation(context).view,
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
                //margin: EdgeInsets.only(top: 30),
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Container(
                      //     decoration: BoxDecoration(
                      //       color: Colors.orange,
                      //       borderRadius: BorderRadius.circular(10),
                      //     ),
                      //     padding: const EdgeInsets.symmetric(
                      //         vertical: 10, horizontal: 20),
                      //     child: Row(
                      //         mainAxisAlignment: MainAxisAlignment.center,
                      //         children: [
                      //           Icon(Icons.monetization_on,
                      //               color: Colors.white),
                      //           const SizedBox(width: 10),
                      //           Text('Donate'),
                      //         ])),
                      Text(translation(context).scan,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 10,
                      ),
                      Image.asset(
                        'assets/images/infopage9i.jpeg',
                        fit: BoxFit.contain,
                        height: 210,
                        width: 210,
                      )
                    ]))
          ],
        ),
      ),
    );
  }
}
