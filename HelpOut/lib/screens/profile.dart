import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:help_out/screens/home_screen.dart';
import 'package:help_out/screens/first_screen.dart';
import 'package:help_out/screens/sign_up_screen.dart';
import 'package:help_out/screens/aboutus.dart';
import 'package:help_out/screens/userlist.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:help_out/screens/contactus.dart';
import 'package:help_out/screens/infopage1.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:help_out/screens/infopage2.dart';
import 'package:firebase_auth/firebase_auth.dart';



class ProfilePage extends StatelessWidget {
  final String name;
  final String email;

  ProfilePage({required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Name: $name',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'Email: $email',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
     ),
);
}
}