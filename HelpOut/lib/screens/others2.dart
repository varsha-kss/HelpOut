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

class donationlink2 extends StatelessWidget {
  const donationlink2({Key? key}) : super(key: key);

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
            const SizedBox(height: 20),
            // Text placeholders
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 108.0, top: 20),
                    child: Text(
                      'UNICEF INDIA',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    margin: EdgeInsets.only(top: 15, left: 15, right: 15),
                    height: 200,
                    width: double.infinity,
                    color: Colors.grey[300],
                    child:
                        Center(child: Image.asset('assets/images/others2.jpg')),
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(height: 20),
                  Text(
                    'UNICEF India relies on the support and donations from businesses and individuals to sustain and expand health, nutrition, water and sanitation, education and child protection programmes for all girls and boys in India. Support us today to help every child survive and thrive! ',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Phone number

            const SizedBox(height: 10),
            // Location link
            GestureDetector(
              onTap: () async {
                var url = Uri.parse(
                    'https://cloud.info.unicef.org/donate?utm_id=7015q0000004sXjAAI&_gl=1*1ih21hi*_ga*MTM0OTE0Njg2NC4xNjgxNTYyMDc1*_ga_MXEPXSMFSH*MTY4MTU2MjA3NS4xLjAuMTY4MTU2MjA3NS');
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
                    Icon(Icons.monetization_on, color: Colors.white),
                    const SizedBox(width: 10),
                    Text(
                      'Donate Here',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
