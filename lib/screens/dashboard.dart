import 'package:classroom/results/cseresult.dart';
import 'package:classroom/screens/details.dart';
import 'package:classroom/screens/signin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:classroom/screens/drawerwidgets.dart';

class dashboard extends StatefulWidget {
  const dashboard({Key? key}) : super(key: key);

  @override
  _dashboardState createState() => _dashboardState();
}

double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

class _dashboardState extends State<dashboard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openEndDrawer() {
    _scaffoldKey.currentState!.openEndDrawer();
  }

  void _closeEndDrawer() {
    Navigator.of(context).pop();
  }

  @override
  riskCalculate() {
    setState(() {
      resultCse.toString();
    });
    return resultCse;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: const Color(0xFFCC2944),
        elevation: 5,
        title: const Text(
          'Dashboard',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: _openEndDrawer,
              child: const Icon(Icons.menu),
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFFCC2944),
              ),
            ),
          ),
        ],
      ),
      endDrawer: const navigationDrawerWidget(),
      backgroundColor: const Color(0xFF1A1A2E),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                child: Image.asset(
                  'pics/dashboard_design.png',
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: 40,
                              backgroundColor: Colors.black38,
                              // gold color
                              // backgroundColor: Color(0xFFFFD700),
                              child: ClipOval(
                                child: Image.asset('pics/diablo.jpeg'),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          //todo:read name from database
                          Flexible(child: user(nameController.text)),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    //todo: read data (branch) from database
                    dashboardText('Class : ' + branchController.text),
                    const SizedBox(
                      height: 10,
                    ),
                    //todo:read semester from database
                    dashboardText("Semester: " + semesterController.text),
                    const SizedBox(
                      height: 10,
                    ),
                    dashboardText('Scheduled events : '),
                    const SizedBox(
                      height: 10,
                    ),
                    dashboardText('Number of bunks : '),
                    const SizedBox(
                      height: 10,
                    ),
                    //todo:read data(cgpa) from database
                    dashboardText(
                        'Current CGPA : ' + resultCse.toStringAsFixed(2)),
                    const SizedBox(
                      height: 10,
                    ),
                    dashboardText('Risk -O- meter : '),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            branchController;
            semesterController;
            resultCse;
          });
        },
        backgroundColor: const Color(0xFFCC2944),
        child: const Icon(Icons.refresh),
        tooltip: 'refresh',
      ),
    );
  }
}
