import 'package:flutter/material.dart';
import 'package:help_out/screens/home_screen.dart';
import 'package:help_out/screens/first_screen.dart';
import 'package:help_out/screens/sign_up_screen.dart';
import 'package:help_out/screens/aboutus.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  _ContactPageState createState() => _ContactPageState();
}

final nameController = TextEditingController();
final subjectController = TextEditingController();
final emailController = TextEditingController();
final messageController = TextEditingController();

Future sendEmail() async {
  final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
  const serviceId = "service_x7jx8vi";
  const templateId = "template_b5jklo9";
  const userId = "zC_oV3ytgFuS6ymZZ";
  final response = await http.post(url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        "service_id": serviceId,
        "template_id": templateId,
        "user_id": userId,
        "template_params": {
          "name": nameController.text,
          "subject": subjectController.text,
          "message": messageController.text,
          "user_email": emailController.text,
        }
      }));
  return response.statusCode;
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Contact Form"),
          backgroundColor: Color.fromARGB(255, 194, 43, 86),
        ),
        body: Padding(
            padding: const EdgeInsets.fromLTRB(25.0, 40, 25, 0),
            child: Form(
                child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.account_circle),
                    hintText: 'Name',
                    labelText: 'Name',
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  controller: subjectController,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.subject_rounded),
                    hintText: 'Subject',
                    labelText: 'Subject',
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.email),
                    hintText: 'Email',
                    labelText: 'Email',
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  controller: messageController,
                  decoration: const InputDecoration(
                      icon: const Icon(Icons.message),
                      hintText: 'Message',
                      labelText: 'Message'),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    sendEmail();
                  },
                  child: Text(
                    "Send",
                    style: TextStyle(fontSize: 20),
                  ),
                )
              ],
            ))),
      ),
    );
  }
}
