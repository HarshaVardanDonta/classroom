import 'package:classroom/screens/dashboard.dart';
import 'package:classroom/screens/details.dart';
import 'package:classroom/screens/results.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'signin.dart';
import 'myclass.dart';
import 'package:google_sign_in/google_sign_in.dart';

class navigationDrawerWidget extends StatefulWidget {
  const navigationDrawerWidget({Key? key}) : super(key: key);

  @override
  _navigationDrawerWidgetState createState() => _navigationDrawerWidgetState();
}

class _navigationDrawerWidgetState extends State<navigationDrawerWidget> {
  TextButton menuItem(IconData x, String y, Widget f) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => f),
        );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            x,
            color: Colors.white,
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            y,
            style: const TextStyle(
              letterSpacing: 1,
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
            ),
          ),
        ],
      ),
    );
  }

  TextButton logout(IconData x, String y) {
    return TextButton(
      onPressed: () async {},
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            x,
            color: Colors.white,
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            y,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Container(
          color: const Color(0xFFCC2944),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 35, 0, 0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  menuItem(
                      Icons.event, 'Scheduled Events', const scheduledEvents()),
                  menuItem(Icons.score, 'Results', const results()),
                  menuItem(Icons.book, 'Notes', const scheduledEvents()),
                  menuItem(Icons.message, 'Messaging', const scheduledEvents()),
                  menuItem(
                      Icons.dangerous, '--BUNK--', const scheduledEvents()),
                  menuItem(
                      Icons.dining, 'Hangout planner', const scheduledEvents()),
                  menuItem(Icons.map, 'Location', const scheduledEvents()),
                  const SizedBox(
                    height: 100,
                  ),
                  //todo: create a new settings page
                  menuItem(Icons.settings, 'Update Details', const details()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
