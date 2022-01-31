import 'package:flutter/material.dart';
import 'widget.dart';

class scheduledEvents extends StatefulWidget {
  const scheduledEvents({Key? key}) : super(key: key);

  @override
  _scheduledEventsState createState() => _scheduledEventsState();
}

class _scheduledEventsState extends State<scheduledEvents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A1A2E),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                myclassText('Class : '),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
