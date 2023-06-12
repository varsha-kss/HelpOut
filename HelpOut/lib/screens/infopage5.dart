import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:help_out/screens/home_screen.dart';
import 'package:help_out/screens/first_screen.dart';
import 'package:help_out/screens/sign_up_screen.dart';
import 'package:help_out/screens/aboutus.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:help_out/screens/contactus.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPage5 extends StatelessWidget {
  const InfoPage5({Key? key}) : super(key: key);

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
              child: Center(child: Image.asset('assets/images/infopage5i.jpg')),
            ),
            const SizedBox(height: 20),
            // Text placeholders
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Vriddh Anand Ashram',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Container(
                      margin: EdgeInsets.only(right: 20),
                      child: Text(
                          "Address : Akurdi Station,Chinchwad,Pune,Maharashta-411033",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold))),
                  const SizedBox(height: 10),
                  Text(
                    'Established in 2005,NGO charitable organization boarding with a mission to help senior citizens',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Phone number
            GestureDetector(
              onTap: () async {
                final Uri url = Uri(
                  scheme: 'tel',
                  path: "774 507 0544",
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
                      'Call +917745070544',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),

            // Location link
            const SizedBox(height: 15),
            GestureDetector(
              onTap: () async {
                var url = Uri.parse(
                    'https://www.google.com/maps/place/Sant+Baba+Moni+Saheb+Vridh+Anand+Ashram/@18.6459978,73.7622383,17z/data=!3m1!4b1!4m6!3m5!1s0x3bc2b9201ec2aeef:0xbe9c7c6e44fc25e7!8m2!3d18.6459978!4d73.7622383!16s%2Fg%2F11rr15pysn');
                // ignore: deprecated_member_use
                if (await canLaunchUrl(url)) {
                  // ignore: deprecated_member_use
                  await launchUrl(url, mode: LaunchMode.externalApplication);
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
                      'View Location',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            Container(
                //margin: EdgeInsets.symmetric(horizontal: 15),
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
                      Text("Scan to Pay",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 10,
                      ),
                      Image.asset(
                        'assets/images/infopage5.jpg',
                        fit: BoxFit.contain,
                        height: 220,
                        width: 220,
                      )
                    ]))
          ],
        ),
      ),
    );
  }
}
