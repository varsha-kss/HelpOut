import 'package:flutter/material.dart';
import 'package:help_out/screens/home_screen.dart';
import 'package:help_out/screens/first_screen.dart';
import 'package:help_out/screens/login_screen.dart';
import 'package:help_out/screens/sign_up_screen.dart';

class first_screen extends StatefulWidget {
  const first_screen({super.key});

  @override
  State<first_screen> createState() => _first_screenState();
}

class _first_screenState extends State<first_screen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool exit = await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Exit'),
              content: Text('Do you want to exit?'),
              actions: <Widget>[
                ElevatedButton(
                  child: Text('Yes'),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                ),
                ElevatedButton(
                  child: Text('No'),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
              ],
            );
          },
        );
        return exit ?? false;
      },
      child: Scaffold(
          body: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 218, 37, 37),
                    Color.fromARGB(255, 248, 246, 246)
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  //stops: [0,0.5]
                ),
              ),
              child: Column(children: [
                _container1(),
                Container(
                    margin: EdgeInsets.only(right: 20, top: 15),
                    child: logoWidget("assets/images/logo2.png")),
                Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Text("Connect to help !",
                        style: TextStyle(fontSize: 20))),
                Container(
                    // color : Colors.black,
                    margin: EdgeInsets.only(top: 100),
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        color: Color.fromARGB(255, 7, 7, 7)),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(128, 10, 10, 10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18))),
                        child: Text(
                          "Get Started",
                          style: TextStyle(
                              color: Color.fromARGB(255, 250, 249, 249),
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        ))),
                Container(
                    margin: EdgeInsets.only(top: 40, bottom: 0),
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
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => login_screen()),
                                  );
                                },
                                // style: ElevatedButton.styleFrom(
                                //disabledBackgroundColor:Color.fromARGB(255, 40, 144, 228) ,
                                //backgroundColor:Color.fromARGB(255, 234, 5, 165),
                                //  ),
                                child: Text(
                                  "Login here",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400),
                                )))
                      ],
                    )),
              ]))),
    );
  }
}

Widget _container1() {
  return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 250),
      child: Text('HelpOut',
          style: TextStyle(
              color: Color.fromARGB(255, 21, 20, 20),
              fontWeight: FontWeight.w400,
              fontSize: 45.0)));
}

Image logoWidget(String imagename) {
  return Image.asset(imagename, fit: BoxFit.contain, width: 140, height: 140);
}
