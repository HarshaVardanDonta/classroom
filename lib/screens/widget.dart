import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:classroom/results/cseresult.dart';
import 'package:classroom/screens/dashboard.dart';
import 'package:classroom/screens/widget.dart';
import 'package:flutter/cupertino.dart';

double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

Text user(String x) {
  return Text(
    x,
    style: const TextStyle(
        letterSpacing: 1,
        color: Colors.white,
        fontSize: 25,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.bold),
  );
}

Text userDescription(String x) {
  return Text(
    x,
    style: const TextStyle(
        letterSpacing: 1,
        color: Colors.white,
        fontSize: 15,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.bold),
  );
}

//menuItem widget
// TextButton menuItem(IconData x, String y,Widget f){
//   return TextButton(
//     onPressed: () {
//       Navigator.push(context, MaterialPageRoute(builder: (context) => f),);
//     },
//
//     child: Row(crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//       Icon(x,
//       color: Colors.white,
//       ),
//       SizedBox(width: 20,),
//       Text(y,
//       style: const TextStyle(
//         color: Colors.white,
//         fontSize: 15,
//         fontWeight: FontWeight.bold,
//         fontFamily: 'Roboto',
//       ),
//       ),
//     ],
//     ),
//
//   );
// }

Text menuText(String x) {
  return Text(
    x,
    style: const TextStyle(
        color: Colors.white,
        fontSize: 15,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.bold),
  );
}

Text dashboardText(String x) {
  return Text(
    x,
    textAlign: TextAlign.center,
    style: const TextStyle(
      letterSpacing: 1,
      color: Colors.white,
      fontFamily: 'Roboto',
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  );
}

Text myclassText(String x) {
  return Text(
    x,
    style: const TextStyle(
      color: Colors.white,
      fontFamily: 'Roboto',
      fontSize: 20,
    ),
  );
}

TextField customTextField(
    String y, String x, TextEditingController controller) {
  return TextField(
    controller: controller,
    style: const TextStyle(color: Colors.white),
    decoration: InputDecoration(
      border: const OutlineInputBorder(),
      labelText: x,
      hintText: y,
      hintStyle: const TextStyle(color: Colors.white),
      labelStyle: const TextStyle(color: Colors.white),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white, width: 1.0),
      ),
    ),
  );
}

Container customContainerButton(String x) {
  return Container(
    height: 50,
    width: 125,
    decoration: BoxDecoration(
        color: Colors.red[900], borderRadius: BorderRadius.circular(30.0)),
    child: Center(
      child: Text(
        x,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
        ),
      ),
    ),
  );
}

Row subject(String subject, TextEditingController myController) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        subject,
        style: const TextStyle(
          color: Color(0xFFCC2944),
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      SizedBox(
        width: 50,
        child: TextField(
          controller: myController,
          decoration: InputDecoration(
            border: UnderlineInputBorder(),
            hintText: 'Grade',
          ),
        ),
      ),
    ],
  );
}
