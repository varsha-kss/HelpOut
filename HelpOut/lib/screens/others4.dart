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

class donationlink4 extends StatelessWidget {
  const donationlink4({Key? key}) : super(key: key);

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
                    padding: const EdgeInsets.only(top: 10.0, left: 75),
                    child: Text(
                      'BAL RAKSHA BHARAT',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    margin: EdgeInsets.only(top: 15, left: 15, right: 15),
                    height: 200,
                    width: double.infinity,
                    color: Colors.grey[300],
                    child: Center(
                        child: Image.asset('assets/images/others4.jpeg')),
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(height: 20),
                  Text(
                    'Through the support of our donors, Save the Children has been implementing projects to cater to childrens various needs, making their childhood happier and more fulfilling. We are working relentlessly to give children a chance at building a brighter future. And in this quest, every bit of support counts.',
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
                    'https://www.savethechildren.in/donate/?utm_source=ARM-Google&utm_medium=paid-search&utm_campaign=Non-Brand_education&utm_term=exact&gclid=Cj0KCQjwlumhBhClARIsABO6p-xBJOrseu75EJNlu-QufEYAi4GH4z_X7rAw7HUKCXlXyB7m9xNlCpgaAphIEALw_wcB');
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
