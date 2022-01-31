import 'package:classroom/results/cseresult.dart';
import 'package:flutter/material.dart';
import 'widget.dart';

class results extends StatefulWidget {
  const results({Key? key}) : super(key: key);

  @override
  _resultsState createState() => _resultsState();
}

class _resultsState extends State<results> {
  InkWell resultCard(String branch, String branchDesc, IconData iconData, dynamic screen){
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => screen),);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        elevation: 10,
        child: ListTile(
          leading: Icon(iconData,
            color: Color(0xFFCC2944A),
          ),
          title: Text(branch,
            style: TextStyle(
              letterSpacing: 1,
              color: Color(0xFFCC2944),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(branchDesc,
            style: TextStyle(
              letterSpacing: 1,
              color: Color(0xFFCC2944),
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A1A2E),
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Select Branch',
                style: TextStyle(
                  letterSpacing: 1,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  ),
                ),
                SizedBox(height: 20,),
                resultCard('CSE', 'select if you are from CSE', Icons.computer, cseResult()),
                resultCard('MECH', 'select if you are from MECH', Icons.build, cseResult()),
                resultCard('CIVIL', 'select if you are from CILIV', Icons.house, cseResult()),

              ],
      ),
          ),
      ),
    );
  }
}
