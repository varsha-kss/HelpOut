// import 'dart:async';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:help_out/screens/home_screen.dart';
// import 'package:help_out/screens/first_screen.dart';
// import 'package:help_out/screens/login_screen.dart';
// import 'package:help_out/screens/sign_up_screen.dart';
// import 'package:help_out/screens/aboutus.dart';
// import 'package:help_out/screens/userlist.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:help_out/screens/contactus.dart';
// import 'package:help_out/screens/infopage1.dart';
// import 'package:url_launcher/url_launcher.dart';

// import 'dart:math';
// import 'package:help_out/screens/infopage2.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'HelpOut',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: SplashScreen(),
//     );
//   }
// }

// final FirebaseAuth _auth = FirebaseAuth.instance;

// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 2),
//     );
//     _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
//     _animationController.forward();
//     Timer(Duration(seconds: 3), () {
//       if (_auth.currentUser == null) {
//         // User is not signed in, show signup screen
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => first_screen()),
//         );
//       } else {
//         // User is already signed in, navigate to home screen
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => home()),
//         );
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ScaleTransition(
//               scale: _animation,
//               child: Image.asset(
//                 'assets/images/logo2.png',
//                 width: 100.0,
//                 height: 100.0,
//               ),
//             ),
//             SizedBox(height: 16.0),
//             FadeTransition(
//               opacity: _animation,
//               child: Text(
//                 'HelpOut',
//                 style: TextStyle(
//                   fontSize: 32.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:help_out/screens/home_screen.dart';
import 'package:help_out/screens/first_screen.dart';
import 'package:help_out/screens/login_screen.dart';
import 'package:help_out/screens/sign_up_screen.dart';
import 'package:help_out/screens/aboutus.dart';
import 'package:help_out/screens/userlist.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:help_out/screens/language_constants.dart';
import 'package:help_out/screens/contactus.dart';
import 'package:help_out/screens/infopage1.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'dart:math';
import 'package:help_out/screens/infopage2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  Locale? _locale;
  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) => {setLocale(locale)});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HelpOut',
      // localizationsDelegates: [
      //   // delegate from flutter_localization
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      //   // delegate from localization package.
      //   //LocalJsonLocalization.delegate,
      // ],
      // supportedLocales: [
      //   Locale("en",''),
      //   Locale("mr",''),
      //   Locale("ml",''),
      //   Locale("hi",'')
      // ],
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: _locale,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: home(),
    );
  }
}

final FirebaseAuth _auth = FirebaseAuth.instance;

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
    _animationController.forward();
    Timer(Duration(seconds: 3), () {
      if (_auth.currentUser == null) {
        // User is not signed in, show signup screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => first_screen()),
        );
      } else {
        // User is already signed in, navigate to home screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => home()),
        );
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: _animation,
              child: Image.asset(
                'assets/images/logo2.png',
                width: 100.0,
                height: 100.0,
              ),
            ),
            SizedBox(height: 16.0),
            FadeTransition(
              opacity: _animation,
              child: Text(
                'HelpOut',
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
