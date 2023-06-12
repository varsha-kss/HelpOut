import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:help_out/screens/infopage1.dart';
import 'package:help_out/screens/infopage2.dart';
import 'package:help_out/screens/infopage3.dart';
import 'package:help_out/screens/infopage4.dart';
import 'package:help_out/screens/infopage5.dart';
import 'package:help_out/screens/infopage6.dart';
import 'package:help_out/screens/infopage7.dart';
import 'package:help_out/screens/infopage8.dart';
import 'package:help_out/screens/infopage9.dart';
import 'package:help_out/screens/infopage10.dart';

class OrphanageListScreen extends StatefulWidget {
  @override
  _OrphanageListScreenState createState() => _OrphanageListScreenState();
}

class _OrphanageListScreenState extends State<OrphanageListScreen> {
  TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  Map<String, Widget> _orphanagePages = {
    'Dnyandeep Balgruha': OrphanageInfoPage1(),
    'Sneh Sawali Old Age Home': OrphanageInfoPage2(),
    'Jeeva Jyothi trust': InfoPage3(),
    'Nachiket Balgram': InfoPage4(),
    'Vriddh Anand Ashram': InfoPage5(),
    'Adarana Charitable trust': InfoPage6(),
    'shanti sahyog old age home': InfoPage7(),
    'Naad Foundation': InfoPage8(),
    'Relief Old Age Home,Kozhikode': InfoPage10(),
    'Nanma Maram Old Age Home': InfoPage9(),
   
  };

  List<String> _orphanageNames = [
    'Dnyandeep Balgruha',
    'Sneh Sawali Old Age Home',
    'Jeeva Jyothi trust',
    'Nachiket Balgram',
    'Vriddh Anand Ashram',
    'Adarana Charitable trust',
    'shanti sahyog old age home',
    'Naad Foundation',
    'Relief Old Age Home,Kozhikode',
    'Nanma Maram Old Age Home',
    
  ];

  List<String> _filteredOrphanageNames = [];

  @override
  void initState() {
    super.initState();
    _filteredOrphanageNames = _orphanageNames;
  }

  void _updateSearchQuery(String query) {
    setState(() {
      _searchQuery = query;
      _filteredOrphanageNames = _orphanageNames
          .where(
              (name) => name.toLowerCase().contains(_searchQuery.toLowerCase()))
          .toList();
    });
  }

  void _navigateToOrphanageDetailsScreen(String orphanageName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => _orphanagePages[orphanageName]!,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 194, 43, 86),
          // title: Text("HelpOut",
          //     style: TextStyle(
          //         color: Colors.white,
          //         fontStyle: FontStyle.normal,
          //         fontSize: 26.0)),
          title: TextField(
            controller: _searchController,
            onChanged: _updateSearchQuery,
            decoration: InputDecoration(
                hintText: 'Search ...',
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.black, fontSize: 18)),
          ),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              })),
      body: ListView.builder(
        itemCount: _filteredOrphanageNames.length,
        itemBuilder: (BuildContext context, int index) {
          final orphanageIndex = index;
          return Container(
            padding: const EdgeInsets.only(top: 15.0),
            margin: EdgeInsets.only(left: 15, right: 15, top: 20),
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              //color: Color.fromARGB(255, 203, 31, 31)
            ),
            child: GestureDetector(
                onTap: () {
                  // Navigate to the page for the selected orphanage
                  _navigateToOrphanageDetailsScreen(
                      _filteredOrphanageNames[orphanageIndex]);
                },
                child: Container(
                  //padding: EdgeInsets.only(top: 30, left: 80),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 205, 206, 205),
                      borderRadius: BorderRadius.circular(15)),
                  child: Text(_filteredOrphanageNames[orphanageIndex],
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                )),
          );
        },
      ),
    );
  }
}
