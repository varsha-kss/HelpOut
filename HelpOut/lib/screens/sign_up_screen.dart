import "package:flutter/material.dart";
import 'package:help_out/screens/home_screen.dart';
import 'package:help_out/screens/first_screen.dart';
import 'package:help_out/screens/login_screen.dart';
import 'package:help_out/screens/sign_up_screen.dart';
import 'package:help_out/screens/aboutus.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:help_out/screens/contactus.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
/*
class SignUpScreen extends StatefulWidget {
    const SignUpScreen({Key? key}) : super(key: key);
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
 late String _email, _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.0, 80.0, 20.0, 0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                ),
                SizedBox(height: 40.0),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Email Address',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (input) =>
                      input!.isEmpty ? 'Please enter an email' : null,
                  onSaved: (input) => _email = input!.trim(),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  obscureText: true,
                  validator: (input) =>
                      input!.isEmpty ? 'Please enter a password' : null,
                  onSaved: (input) => _password = input!.trim(),
                ),
                SizedBox(height: 40.0),

                Container(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    color: Colors.blueGrey,
                  child: ElevatedButton(
                    onPressed: signUp,
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    ),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signUp() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {
        UserCredential userCredential = await _auth
            .createUserWithEmailAndPassword(email: _email, password: _password);
        if (userCredential.user != null) {
          Fluttertoast.showToast(msg: "Sign up successful");
          Navigator.pop(context);
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          Fluttertoast.showToast(msg: 'The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          Fluttertoast.showToast(
              msg: 'The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    }
  }
}

*/

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  late String _email, _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(padding: EdgeInsets.only(top: 100), children: [
        Container(
          margin: EdgeInsets.only(left: 60),
          child: _row1(),
        ),
        Container(
            margin: EdgeInsets.only(left: 140, top: 10, bottom: 05),
            child: Text("Sign Up",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 35,
                ))),
        Container(
          //padding: EdgeInsets.fromLTRB(20.0, 80.0, 20.0, 0),
          margin: EdgeInsets.all(20),
          height: 360,
          width: 360,
          padding: EdgeInsets.only(top: 35, left: 18, right: 18),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 211, 209, 209),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  height: 50,
                  width: 320,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Enter Name",
                        border: InputBorder.none,
                        hintStyle:
                            TextStyle(color: Colors.black, fontSize: 20)),
                    keyboardType: TextInputType.emailAddress,
                    //validator: (input) =>
                    //  input!.isEmpty ? 'Please enter a name' : null,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  height: 50,
                  width: 320,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Email Address',
                        border: InputBorder.none,
                        hintStyle:
                            TextStyle(color: Colors.black, fontSize: 20)),
                    keyboardType: TextInputType.emailAddress,
                    // validator: (input) =>
                    //   input!.isEmpty ? 'Please enter an email' : null,
                    onSaved: (input) => _email = input!.trim(),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  height: 50,
                  width: 320,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Password',
                        border: InputBorder.none,
                        hintStyle:
                            TextStyle(color: Colors.black, fontSize: 20)),
                    obscureText: true,
                    //validator: (input) =>
                    //  input!.isEmpty ? 'Please enter a password' : null,
                    onSaved: (input) => _password = input!.trim(),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  height: 50,
                  width: 320,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 194, 43, 86),
                      borderRadius: BorderRadius.circular(5)),
                  //color: Colors.blueGrey,
                  child: ElevatedButton(
                    onPressed: signUp,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 194, 43, 86),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    child: Text(
                      'Create Account ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        //_container4(),
      ]),
    );
  }

  Container _container4() {
    return Container(
        margin: EdgeInsets.only(top: 20, bottom: 0),
        child: Column(
          children: [
            Text("If already registered ?",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w400)),
            Container(
                margin: EdgeInsets.only(right: 5),
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Login here",
                      style: TextStyle(
                          color: Color.fromARGB(255, 194, 43, 86),
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                    )))
          ],
        ));
  }

  Row _row1() {
    return Row(children: [
      Image.asset("assets/images/logo2.png",
          fit: BoxFit.contain, width: 90, height: 90),
      Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 10),
          child: Text('HelpOut',
              style: TextStyle(
                  color: Color.fromARGB(255, 21, 20, 20),
                  fontWeight: FontWeight.w400,
                  fontSize: 40.0))),
    ]);
  }

  void signUp() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {
        UserCredential userCredential = await _auth
            .createUserWithEmailAndPassword(email: _email, password: _password);
        if (userCredential.user != null) {
          Fluttertoast.showToast(msg: "Sign up successful");
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => login_screen()),
          );
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          Fluttertoast.showToast(msg: 'The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          Fluttertoast.showToast(
              msg: 'The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    }
  }
}
