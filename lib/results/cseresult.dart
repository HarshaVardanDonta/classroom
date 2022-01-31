import 'package:classroom/screens/details.dart';
import 'package:classroom/screens/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class cseResult extends StatefulWidget {
  const cseResult({Key? key}) : super(key: key);

  @override
  _cseResultState createState() => _cseResultState();
}

double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

//todo: semOneSubjects
late double semOneGpa = 0.0;
final mathOneController = TextEditingController();
late double mathOneGrade = 0.0;
double mathOneCredit = 4.0;
final chemOneController = TextEditingController();
late double chemGrade = 0.0;
double chemCredit = 4.0;
final beeController = TextEditingController();
late double beeGrade = 0.0;
double beeCredit = 3.0;
final ewController = TextEditingController();
late double ewGrade = 0.0;
double ewCredit = 2.5;
final englishController = TextEditingController();
late double englishGrade = 0.0;
double englishCredit = 2.0;
final chemLabController = TextEditingController();
late double chemLabGrade = 0.0;
double chemLabCredit = 1.5;
final elcsLabController = TextEditingController();
late double elcsLabGrade = 0.0;
double elcsLabCredit = 1.0;
final beeLabController = TextEditingController();
late double beeLabGrade = 0.0;
double beeLabCredit = 1.0;

//todo:sem two subjects
late double semTwoGpa = 0.0;
final mathTwoController = TextEditingController();
late double mathTwoGrade;
double mathTwoCredit = 4.0;
final physicsController = TextEditingController();
late double physicsGrade;
double physicsCredit = 4.0;
final pplController = TextEditingController();
late double pplGrade;
double pplCredit = 4.0;
final egController = TextEditingController();
late double egGrade;
double egCredit = 3.0;
final esController = TextEditingController();
late double esGrade = 0.0;
double esCredit = 0.0;
final pplLabController = TextEditingController();
late double pplLabGrade;
double pplLabCredit = 1.5;
final physicsLabController = TextEditingController();
late double physicsLabGrade;
double physicsLabCredit = 1.5;

//todo: sem three subjects
late double semThreeGpa = 0.0;
final adeController = TextEditingController();
late double adeGrade;
double adeCredit = 3.0;
final dsController = TextEditingController();
late double dsGrade;
double dsCredit = 4.0;
final cosmController = TextEditingController();
late double cosmGrade;
double cosmCredit = 4.0;
final coaController = TextEditingController();
late double coaGrade;
double coaCredit = 3.0;
final cppController = TextEditingController();
late double cppGrade;
double cppCredit = 2.0;
final adeLabController = TextEditingController();
late double adeLabGrade;
double adeLabCredit = 1.0;
final dsLabController = TextEditingController();
late double dsLabGrade;
double dsLabCredit = 1.5;
final itWsLabController = TextEditingController();
late double itWsLabGrade;
double itWsLabCredit = 1.5;
final cppLabController = TextEditingController();
late double cppLabGrade;
double cppLabCredit = 1;
final gsLabController = TextEditingController();

//todo: sem four subjects 2-2
late double semFourGpa = 0.0;
final discreteMathController = TextEditingController();
late double discreteMathGrade;
double discreteMathCredit = 3.0;
final befaController = TextEditingController();
late double befaGrade;
double befaCredit = 3.0;
final osController = TextEditingController();
late double osGrade;
double osCredit = 3.0;
final dbmsController = TextEditingController();
late double dbmsGrade;
double dbmsCredit = 4.0;
final javaController = TextEditingController();
late double javaGrade;
double javaCredit = 4.0;
final osLabController = TextEditingController();
late double osLabGrade;
double osLabCredit = 1.5;
final dbmsLabController = TextEditingController();
late double dbmsLabGrade;
double dbmsLabCredit = 1.5;
final javaLabController = TextEditingController();
late double javaLabGrade;
double javaLabCredit = 1;
final coiController = TextEditingController();
double coiCredit = 0;

//todo: sem - 5 subs 3-1
late double semFiveGpa = 0.0;
final flatController = TextEditingController();
late double flatGrade;
double flatCredit = 3.0;
final seController = TextEditingController();
late double seGrade;
double seCredit = 3.0;
final cnController = TextEditingController();
late double cnGrade;
double cnCredit = 3.0;
final wtController = TextEditingController();
late double wtGrade;
double wtCredit = 3.0;
final seLabController = TextEditingController();
late double seLabGrade;
double seLabCredit = 1.5;
final cnwtLabController = TextEditingController();
late double cnwtLabGrade;
double cnwtLabCredit = 1.5;
final acsLabController = TextEditingController();
late double acsLabGrade;
double acsLabCredit = 1;
final iprController = TextEditingController();

//todo: sem-6 3-2
late double semSixGpa = 0.0;
final mlController = TextEditingController();
late double mlGrade;
double mlCredit = 4.0;
final cdController = TextEditingController();
late double cdGrade;
double cdCredit = 4.0;
final daaController = TextEditingController();
late double daaGrade;
double daaCredit = 4.0;
final mlLabController = TextEditingController();
late double mlLabGrade;
double mlLabCredit = 1.5;
final cdLabController = TextEditingController();
late double cdLabGrade;
double cdLabCredit = 1.5;
final eScienceController = TextEditingController();

late double resultCse = 0.0;
final semNoController = TextEditingController();
riskFactor() async {
  if (semNoController.text == "1") {
    resultCse = (semOneGpa) / 1;
  } else if (semNoController.text == "2") {
    resultCse = (semOneGpa + semTwoGpa) / 2;
  } else if (semNoController.text == "3") {
    resultCse = (semOneGpa + semTwoGpa + semThreeGpa) / 3;
  }

  return resultCse;
}

final FirebaseAuth auth = FirebaseAuth.instance;
final User? fUser = auth.currentUser;

class _cseResultState extends State<cseResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    dashboardText("result available till sem:"),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      width: 70,
                      child: TextFormField(
                        controller: semNoController,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                        decoration: const InputDecoration(
                          hintStyle: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                          border: UnderlineInputBorder(),
                          hintText: 'Sem no?',
                        ),
                      ),
                    ),
                  ],
                ),
                const Text(
                  "Sem - 1",
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 1,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //sem 1 card
                Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    color: Colors.white,
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          subject("Maths - 1", mathOneController),
                          subject("Chem", chemOneController),
                          subject("BEE", beeController),
                          subject("Engineering Workshop", ewController),
                          subject("English", englishController),
                          subject("Chemistry Lab", chemLabController),
                          subject("ELCS LAb", elcsLabController),
                          subject("BEE Lab", beeLabController),
                          const SizedBox(
                            height: 20,
                          ),
                          //button
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RaisedButton(
                                onPressed: () {
                                  setState(() {
                                    mathOneController.text;
                                    chemOneController.text;

                                    //mathOne
                                    if (mathOneController.text == "O") {
                                      mathOneGrade = 10;
                                    } else if (mathOneController.text == "A+") {
                                      mathOneGrade = 9;
                                    } else if (mathOneController.text == "A") {
                                      mathOneGrade = 8;
                                    } else if (mathOneController.text == "B+") {
                                      mathOneGrade = 7;
                                    } else if (mathOneController.text == "B") {
                                      mathOneGrade = 6;
                                    } else if (mathOneController.text == "C") {
                                      mathOneGrade = 5;
                                    } else {
                                      mathOneGrade = 0;
                                    }

                                    //chem
                                    if (chemOneController.text == "O") {
                                      chemGrade = 10;
                                    } else if (chemOneController.text == "A+") {
                                      chemGrade = 9;
                                    } else if (chemOneController.text == "A") {
                                      chemGrade = 8;
                                    } else if (chemOneController.text == "B+") {
                                      chemGrade = 7;
                                    } else if (chemOneController.text == "B") {
                                      chemGrade = 6;
                                    } else if (chemOneController.text == "C") {
                                      chemGrade = 5;
                                    } else {
                                      chemGrade = 0;
                                    }

                                    //BEE
                                    if (beeController.text == "O") {
                                      beeGrade = 10;
                                    } else if (beeController.text == "A+") {
                                      beeGrade = 9;
                                    } else if (beeController.text == "A") {
                                      beeGrade = 8;
                                    } else if (beeController.text == "B+") {
                                      beeGrade = 7;
                                    } else if (beeController.text == "B") {
                                      beeGrade = 6;
                                    } else if (beeController.text == "C") {
                                      beeGrade = 5;
                                    } else {
                                      beeGrade = 0;
                                    }

                                    //workshop
                                    if (ewController.text == "O") {
                                      ewGrade = 10;
                                    } else if (ewController.text == "A+") {
                                      ewGrade = 9;
                                    } else if (ewController.text == "A") {
                                      ewGrade = 8;
                                    } else if (ewController.text == "B+") {
                                      ewGrade = 7;
                                    } else if (ewController.text == "B") {
                                      ewGrade = 6;
                                    } else if (ewController.text == "C") {
                                      ewGrade = 5;
                                    } else {
                                      ewGrade = 0;
                                    }

                                    //english
                                    if (englishController.text == "O") {
                                      englishGrade = 10;
                                    } else if (englishController.text == "A+") {
                                      englishGrade = 9;
                                    } else if (englishController.text == "A") {
                                      englishGrade = 8;
                                    } else if (englishController.text == "B+") {
                                      englishGrade = 7;
                                    } else if (englishController.text == "B") {
                                      englishGrade = 6;
                                    } else if (englishController.text == "C") {
                                      englishGrade = 5;
                                    } else {
                                      englishGrade = 0;
                                    }

                                    //chem lab
                                    if (chemLabController.text == "O") {
                                      chemLabGrade = 10;
                                    } else if (chemLabController.text == "A+") {
                                      chemLabGrade = 9;
                                    } else if (chemLabController.text == "A") {
                                      chemLabGrade = 8;
                                    } else if (chemLabController.text == "B+") {
                                      chemLabGrade = 7;
                                    } else if (chemLabController.text == "B") {
                                      chemLabGrade = 6;
                                    } else if (chemLabController.text == "C") {
                                      chemLabGrade = 5;
                                    } else {
                                      chemLabGrade = 0;
                                    }

                                    //elcs lab
                                    if (elcsLabController.text == "O") {
                                      elcsLabGrade = 10;
                                    } else if (elcsLabController.text == "A+") {
                                      elcsLabGrade = 9;
                                    } else if (elcsLabController.text == "A") {
                                      elcsLabGrade = 8;
                                    } else if (elcsLabController.text == "B+") {
                                      elcsLabGrade = 7;
                                    } else if (elcsLabController.text == "B") {
                                      elcsLabGrade = 6;
                                    } else if (elcsLabController.text == "C") {
                                      elcsLabGrade = 5;
                                    } else {
                                      elcsLabGrade = 0;
                                    }

                                    //bee lab
                                    if (beeLabController.text == "O") {
                                      beeLabGrade = 10;
                                    } else if (beeLabController.text == "A+") {
                                      beeLabGrade = 9;
                                    } else if (beeLabController.text == "A") {
                                      beeLabGrade = 8;
                                    } else if (beeLabController.text == "B+") {
                                      beeLabGrade = 7;
                                    } else if (beeLabController.text == "B") {
                                      beeLabGrade = 6;
                                    } else if (beeLabController.text == "C") {
                                      beeLabGrade = 5;
                                    } else {
                                      beeLabGrade = 0;
                                    }

                                    semOneGpa =
                                        ((mathOneGrade * mathOneCredit) +
                                                (chemGrade * chemCredit) +
                                                (beeGrade * beeCredit) +
                                                (ewGrade * ewCredit) +
                                                (englishGrade * englishCredit) +
                                                (chemLabGrade * chemLabCredit) +
                                                (elcsLabGrade * elcsLabCredit) +
                                                (beeLabGrade * beeLabCredit)) /
                                            19;
                                  });
                                },
                                color: const Color(0xFFCC2944),
                                child: const Text(
                                  "Calculate SGPA",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              Text(
                                "The result is: " +
                                    semOneGpa.toStringAsFixed(2),
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Sem - 2",
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 1,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //sem 2
                Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    color: Colors.white,
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          subject("Maths - 2", mathTwoController),
                          subject("Applied Physics", physicsController),
                          subject("PPL", pplController),
                          subject("Engineering Graphics", egController),
                          subject("Environmental Science", esController),
                          subject("Physics Lab", physicsLabController),
                          subject("PPL Lab", pplLabController),
                          const SizedBox(
                            height: 20,
                          ),
                          //button
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RaisedButton(
                                onPressed: () {
                                  setState(() {
                                    mathOneController.text;
                                    chemOneController.text;

                                    //mathTwo
                                    if (mathTwoController.text == "O") {
                                      mathTwoGrade = 10;
                                    } else if (mathTwoController.text == "A+") {
                                      mathTwoGrade = 9;
                                    } else if (mathTwoController.text == "A") {
                                      mathTwoGrade = 8;
                                    } else if (mathTwoController.text == "B+") {
                                      mathTwoGrade = 7;
                                    } else if (mathTwoController.text == "B") {
                                      mathTwoGrade = 6;
                                    } else if (mathTwoController.text == "C") {
                                      mathTwoGrade = 5;
                                    } else {
                                      mathTwoGrade = 0;
                                    }

                                    //physics
                                    if (physicsController.text == "O") {
                                      physicsGrade = 10;
                                    } else if (physicsController.text == "A+") {
                                      physicsGrade = 9;
                                    } else if (physicsController.text == "A") {
                                      physicsGrade = 8;
                                    } else if (physicsController.text == "B+") {
                                      physicsGrade = 7;
                                    } else if (physicsController.text == "B") {
                                      physicsGrade = 6;
                                    } else if (physicsController.text == "C") {
                                      physicsGrade = 5;
                                    } else {
                                      physicsGrade = 0;
                                    }

                                    //ppl
                                    if (pplController.text == "O") {
                                      pplGrade = 10;
                                    } else if (pplController.text == "A+") {
                                      pplGrade = 9;
                                    } else if (pplController.text == "A") {
                                      pplGrade = 8;
                                    } else if (pplController.text == "B+") {
                                      pplGrade = 7;
                                    } else if (pplController.text == "B") {
                                      pplGrade = 6;
                                    } else if (pplController.text == "C") {
                                      pplGrade = 5;
                                    } else {
                                      pplGrade = 0;
                                    }

                                    //graphics
                                    if (egController.text == "O") {
                                      egGrade = 10;
                                    } else if (egController.text == "A+") {
                                      egGrade = 9;
                                    } else if (egController.text == "A") {
                                      egGrade = 8;
                                    } else if (egController.text == "B+") {
                                      egGrade = 7;
                                    } else if (egController.text == "B") {
                                      egGrade = 6;
                                    } else if (egController.text == "C") {
                                      egGrade = 5;
                                    } else {
                                      egGrade = 0;
                                    }

                                    //env science credit is 0 for all so no need...
                                    //physics lab
                                    if (physicsController.text == "O") {
                                      physicsLabGrade = 10;
                                    } else if (physicsController.text == "A+") {
                                      physicsLabGrade = 9;
                                    } else if (physicsController.text == "A") {
                                      physicsLabGrade = 8;
                                    } else if (physicsController.text == "B+") {
                                      physicsLabGrade = 7;
                                    } else if (physicsController.text == "B") {
                                      physicsLabGrade = 6;
                                    } else if (physicsController.text == "C") {
                                      physicsLabGrade = 5;
                                    } else {
                                      physicsLabGrade = 0;
                                    }

                                    //ppl lab
                                    if (pplLabController.text == "O") {
                                      pplLabGrade = 10;
                                    } else if (pplLabController.text == "A+") {
                                      pplLabGrade = 9;
                                    } else if (pplLabController.text == "A") {
                                      pplLabGrade = 8;
                                    } else if (pplLabController.text == "B+") {
                                      pplLabGrade = 7;
                                    } else if (pplLabController.text == "B") {
                                      pplLabGrade = 6;
                                    } else if (pplLabController.text == "C") {
                                      pplLabGrade = 5;
                                    } else {
                                      pplLabGrade = 0;
                                    }
                                    semTwoGpa =
                                        ((mathTwoGrade * mathTwoCredit) +
                                                (physicsGrade * physicsCredit) +
                                                (pplGrade * pplCredit) +
                                                (egGrade * egCredit) +
                                                (physicsLabGrade *
                                                    physicsLabCredit) +
                                                (pplLabGrade * pplLabCredit)) /
                                            18;
                                  });
                                },
                                color: const Color(0xFFCC2944),
                                child: const Text(
                                  "Calculate SGPA",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              Text(
                                "The result is: " +
                                    semTwoGpa.toStringAsFixed(2),
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
                //sem 3
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Sem - 3",
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 1,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    color: Colors.white,
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          subject(
                              "Analogue Digital Electronics", adeController),
                          subject("Data Structures", dsController),
                          subject("COSM", cosmController),
                          subject("COA", coaController),
                          subject("CPP", cppController),
                          subject("ADE Lab", adeLabController),
                          subject("DS Lab", dsLabController),
                          subject("IT Workshop", itWsLabController),
                          subject("CPP Lab", cppLabController),
                          subject("Gender Sensitization Lab", gsLabController),
                          const SizedBox(
                            height: 20,
                          ),
                          //button
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RaisedButton(
                                onPressed: () {
                                  setState(() {
                                    //ade
                                    if (adeController.text == "O") {
                                      adeGrade = 10;
                                    } else if (adeController.text == "A+") {
                                      adeGrade = 9;
                                    } else if (adeController.text == "A") {
                                      adeGrade = 8;
                                    } else if (adeController.text == "B+") {
                                      adeGrade = 7;
                                    } else if (adeController.text == "B") {
                                      adeGrade = 6;
                                    } else if (adeController.text == "C") {
                                      adeGrade = 5;
                                    } else {
                                      adeGrade = 0;
                                    }

                                    //data structure
                                    if (dsController.text == "O") {
                                      dsGrade = 10;
                                    } else if (dsController.text == "A+") {
                                      dsGrade = 9;
                                    } else if (dsController.text == "A") {
                                      dsGrade = 8;
                                    } else if (dsController.text == "B+") {
                                      dsGrade = 7;
                                    } else if (dsController.text == "B") {
                                      dsGrade = 6;
                                    } else if (dsController.text == "B") {
                                      dsGrade = 5;
                                    } else {
                                      dsGrade = 0;
                                    }

                                    //cosm
                                    if (cosmController.text == "O") {
                                      cosmGrade = 10;
                                    } else if (cosmController.text == "A+") {
                                      cosmGrade = 9;
                                    } else if (cosmController.text == "A") {
                                      cosmGrade = 8;
                                    } else if (cosmController.text == "B+") {
                                      cosmGrade = 7;
                                    } else if (cosmController.text == "B") {
                                      cosmGrade = 6;
                                    } else if (cosmController.text == "C") {
                                      cosmGrade = 5;
                                    } else {
                                      cosmGrade = 0;
                                    }

                                    //coa
                                    if (coaController.text == "O") {
                                      coaGrade = 10;
                                    } else if (coaController.text == "A+") {
                                      coaGrade = 9;
                                    } else if (coaController.text == "A") {
                                      coaGrade = 8;
                                    } else if (coaController.text == "B+") {
                                      coaGrade = 7;
                                    } else if (coaController.text == "B") {
                                      coaGrade = 6;
                                    } else if (coaController.text == "C") {
                                      coaGrade = 5;
                                    } else {
                                      coaGrade = 0;
                                    }

                                    //cpp
                                    if (cppController.text == "O") {
                                      cppGrade = 10;
                                    } else if (cppController.text == "A+") {
                                      cppGrade = 9;
                                    } else if (cppController.text == "A") {
                                      cppGrade = 8;
                                    } else if (cppController.text == "B+") {
                                      cppGrade = 7;
                                    } else if (cppController.text == "B") {
                                      cppGrade = 6;
                                    } else if (cppController.text == "C") {
                                      cppGrade = 5;
                                    } else {
                                      cppGrade = 0;
                                    }

                                    //ade Lab
                                    if (adeLabController.text == "O") {
                                      adeLabGrade = 10;
                                    } else if (adeLabController.text == "A+") {
                                      adeLabGrade = 9;
                                    } else if (adeLabController.text == "A") {
                                      adeLabGrade = 8;
                                    } else if (adeLabController.text == "B+") {
                                      adeLabGrade = 7;
                                    } else if (adeLabController.text == "B") {
                                      adeLabGrade = 6;
                                    } else if (adeLabController.text == "C") {
                                      adeLabGrade = 5;
                                    } else {
                                      adeLabGrade = 0;
                                    }

                                    //ds lab
                                    if (dsLabController.text == "O") {
                                      dsLabGrade = 10;
                                    } else if (dsLabController.text == "A+") {
                                      dsLabGrade = 9;
                                    } else if (dsLabController.text == "A") {
                                      dsLabGrade = 8;
                                    } else if (dsLabController.text == "B+") {
                                      dsLabGrade = 7;
                                    } else if (dsLabController.text == "B") {
                                      dsLabGrade = 6;
                                    } else if (dsLabController.text == "C") {
                                      dsLabGrade = 5;
                                    } else {
                                      dsLabGrade = 0;
                                    }

                                    //it workshop
                                    if (itWsLabController.text == "O") {
                                      itWsLabGrade = 10;
                                    } else if (itWsLabController.text == "A+") {
                                      itWsLabGrade = 9;
                                    } else if (itWsLabController.text == "A") {
                                      itWsLabGrade = 8;
                                    } else if (itWsLabController.text == "B+") {
                                      itWsLabGrade = 7;
                                    } else if (itWsLabController.text == "B") {
                                      itWsLabGrade = 6;
                                    } else if (itWsLabController.text == "C") {
                                      itWsLabGrade = 5;
                                    } else {
                                      itWsLabGrade = 0;
                                    }

                                    //cpp lab
                                    if (cppLabController.text == "O") {
                                      cppLabGrade = 10;
                                    } else if (cppLabController.text == "A+") {
                                      cppLabGrade = 9;
                                    } else if (cppLabController.text == "A") {
                                      cppLabGrade = 8;
                                    } else if (cppLabController.text == "B+") {
                                      cppLabGrade = 7;
                                    } else if (cppLabController.text == "B") {
                                      cppLabGrade = 6;
                                    } else if (cppLabController.text == "C") {
                                      cppLabGrade = 5;
                                    } else {
                                      cppLabGrade = 0;
                                    }

                                    //gender sensitizzation lab
                                    semThreeGpa = ((adeGrade * adeCredit) +
                                            (dsGrade * dsCredit) +
                                            (cosmGrade * cosmCredit) +
                                            (coaGrade * coaCredit) +
                                            (cppGrade * cppCredit) +
                                            (adeLabGrade * adeLabCredit) +
                                            (dsLabGrade * dsLabCredit) +
                                            (itWsLabGrade * itWsLabCredit) +
                                            (cppLabGrade * cppLabCredit)) /
                                        21;
                                  });
                                },
                                color: const Color(0xFFCC2944),
                                child: const Text(
                                  "Calculate SGPA",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              Text(
                                "The result is: " +
                                    semThreeGpa.toStringAsFixed(2),
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
                //sem -4
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Sem - 4",
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 1,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    color: Colors.white,
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          subject("Discrete Maths", discreteMathController),
                          subject("BEFA", befaController),
                          subject("Operating Systems", osController),
                          subject("DBMS", dbmsController),
                          subject("Java Programming", javaController),
                          subject("OS Lab", osLabController),
                          subject("DBMS Lab", dbmsLabController),
                          subject("Java Programming Lab", javaLabController),
                          subject("Constitution Of India", coiController),

                          const SizedBox(
                            height: 20,
                          ),
                          //button
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RaisedButton(
                                onPressed: () {
                                  setState(() {
                                    //disc math
                                    if (discreteMathController.text == "O") {
                                      discreteMathGrade = 10;
                                    } else if (discreteMathController.text ==
                                        "A+") {
                                      discreteMathGrade = 9;
                                    } else if (discreteMathController.text ==
                                        "A") {
                                      discreteMathGrade = 8;
                                    } else if (discreteMathController.text ==
                                        "B+") {
                                      discreteMathGrade = 7;
                                    } else if (discreteMathController.text ==
                                        "B") {
                                      discreteMathGrade = 6;
                                    } else if (discreteMathController.text ==
                                        "C") {
                                      discreteMathGrade = 6;
                                    } else {
                                      discreteMathGrade = 0;
                                    }

                                    //befa
                                    if (befaController.text == "O") {
                                      befaGrade = 10;
                                    } else if (befaController.text == "A+") {
                                      befaGrade = 9;
                                    } else if (befaController.text == "A") {
                                      befaGrade = 8;
                                    } else if (befaController.text == "B+") {
                                      befaGrade = 7;
                                    } else if (befaController.text == "B") {
                                      befaGrade = 6;
                                    } else if (befaController.text == "C") {
                                      befaGrade = 5;
                                    } else {
                                      befaGrade = 0;
                                    }

                                    //os
                                    if (osController.text == "O") {
                                      osGrade = 10;
                                    } else if (osController.text == "A+") {
                                      osGrade = 9;
                                    } else if (osController.text == "A") {
                                      osGrade = 8;
                                    } else if (osController.text == "B+") {
                                      osGrade = 7;
                                    } else if (osController.text == "B") {
                                      osGrade = 6;
                                    } else if (osController.text == "C") {
                                      osGrade = 5;
                                    } else {
                                      osGrade = 0;
                                    }

                                    //dbms
                                    if (dbmsController.text == "O") {
                                      dbmsGrade = 10;
                                    } else if (dbmsController.text == "A+") {
                                      dbmsGrade = 9;
                                    } else if (dbmsController.text == "A") {
                                      dbmsGrade = 8;
                                    } else if (dbmsController.text == "B+") {
                                      dbmsGrade = 7;
                                    } else if (dbmsController.text == "B") {
                                      dbmsGrade = 6;
                                    } else if (dbmsController.text == "C") {
                                      dbmsGrade = 5;
                                    } else {
                                      dbmsGrade = 0;
                                    }

                                    //java
                                    if (javaController.text == "O") {
                                      javaGrade = 10;
                                    } else if (javaController.text == "A+") {
                                      javaGrade = 9;
                                    } else if (javaController.text == "A") {
                                      javaGrade = 8;
                                    } else if (javaController.text == "B+") {
                                      javaGrade = 7;
                                    } else if (javaController.text == "B") {
                                      javaGrade = 6;
                                    } else if (javaController.text == "C") {
                                      javaGrade = 5;
                                    } else {
                                      javaGrade = 0;
                                    }

                                    //os lab
                                    if (osLabController.text == "O") {
                                      osLabGrade = 10;
                                    } else if (osLabController.text == "A+") {
                                      osLabGrade = 9;
                                    } else if (osLabController.text == "A") {
                                      osLabGrade = 8;
                                    } else if (osLabController.text == "B+") {
                                      osLabGrade = 7;
                                    } else if (osLabController.text == "B") {
                                      osLabGrade = 6;
                                    } else if (osLabController.text == "C") {
                                      osLabGrade = 5;
                                    } else {
                                      osLabGrade = 0;
                                    }

                                    //dbms lab
                                    if (dbmsLabController.text == "O") {
                                      dbmsLabGrade = 10;
                                    } else if (dbmsLabController.text == "A+") {
                                      dbmsLabGrade = 9;
                                    } else if (dbmsLabController.text == "A") {
                                      dbmsLabGrade = 8;
                                    } else if (dbmsLabController.text == "B+") {
                                      dbmsLabGrade = 7;
                                    } else if (dbmsLabController.text == "B") {
                                      dbmsLabGrade = 6;
                                    } else if (dbmsLabController.text == "C") {
                                      dbmsLabGrade = 5;
                                    } else {
                                      dbmsLabGrade = 0;
                                    }

                                    //java lab
                                    if (javaLabController.text == "O") {
                                      javaLabGrade = 10;
                                    } else if (javaLabController.text == "A+") {
                                      javaLabGrade = 9;
                                    } else if (javaLabController.text == "A") {
                                      javaLabGrade = 8;
                                    } else if (javaLabController.text == "B+") {
                                      javaLabGrade = 7;
                                    } else if (javaLabController.text == "B") {
                                      javaLabGrade = 6;
                                    } else if (javaLabController.text == "C") {
                                      javaLabGrade = 5;
                                    } else {
                                      javaLabGrade = 0;
                                    }

                                    //coi
                                    coiCredit = 0;

                                    semFourGpa = ((discreteMathGrade *
                                                discreteMathCredit) +
                                            (befaGrade * befaCredit) +
                                            (osGrade * osCredit) +
                                            (dbmsGrade * dbmsCredit) +
                                            (javaGrade * javaCredit) +
                                            (osLabGrade * osLabCredit) +
                                            (dbmsLabGrade * dbmsLabCredit) +
                                            (javaLabGrade * javaLabCredit)) /
                                        21;
                                  });
                                },
                                color: const Color(0xFFCC2944),
                                child: const Text(
                                  "Calculate SGPA",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              Text(
                                "The result is: " +
                                    semFourGpa.toStringAsFixed(2),
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 10,
                ),
                //sem -5
                const Text(
                  "Sem - 5",
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 1,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    color: Colors.white,
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          subject("FLAT", flatController),
                          subject("Software Engineering", seController),
                          subject("Computer Networks", cnController),
                          subject("Web Technologies", wtController),
                          subject("SE Lab", seLabController),
                          subject("CN & WT Lab", cnwtLabController),
                          subject("ACS Lab", acsLabController),
                          subject("IPR", iprController),

                          const SizedBox(
                            height: 20,
                          ),
                          //button
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RaisedButton(
                                onPressed: () {
                                  setState(() {
                                    //flat
                                    if (flatController.text == "O") {
                                      flatGrade = 10;
                                    } else if (flatController.text == "A+") {
                                      flatGrade = 9;
                                    } else if (flatController.text == "A") {
                                      flatGrade = 8;
                                    } else if (flatController.text == "B+") {
                                      flatGrade = 7;
                                    } else if (flatController.text == "B") {
                                      flatGrade = 6;
                                    } else if (flatController.text == "C") {
                                      flatGrade = 5;
                                    } else {
                                      flatGrade = 0;
                                    }

                                    //se
                                    if (seController.text == "O") {
                                      seGrade = 10;
                                    } else if (seController.text == "A+") {
                                      seGrade = 9;
                                    } else if (seController.text == "A") {
                                      seGrade = 8;
                                    } else if (seController.text == "B+") {
                                      seGrade = 7;
                                    } else if (seController.text == "B") {
                                      seGrade = 6;
                                    } else if (seController.text == "C") {
                                      seGrade = 5;
                                    } else {
                                      seGrade = 0;
                                    }

                                    //cn
                                    if (cnController.text == "O") {
                                      cnGrade = 10;
                                    } else if (cnController.text == "A+") {
                                      cnGrade = 9;
                                    } else if (cnController.text == "A") {
                                      cnGrade = 8;
                                    } else if (cnController.text == "B+") {
                                      cnGrade = 7;
                                    } else if (cnController.text == "B") {
                                      cnGrade = 6;
                                    } else if (cnController.text == "C") {
                                      cnGrade = 5;
                                    } else {
                                      cnGrade = 0;
                                    }

                                    //wt
                                    if (wtController.text == "O") {
                                      wtGrade = 10;
                                    } else if (wtController.text == "A+") {
                                      wtGrade = 9;
                                    } else if (wtController.text == "A") {
                                      wtGrade = 8;
                                    } else if (wtController.text == "B+") {
                                      wtGrade = 7;
                                    } else if (wtController.text == "B") {
                                      wtGrade = 6;
                                    } else if (wtController.text == "C") {
                                      wtGrade = 5;
                                    } else {
                                      wtGrade = 0;
                                    }

                                    //se lab
                                    if (seLabController.text == "O") {
                                      seLabGrade = 10;
                                    } else if (seLabController.text == "A+") {
                                      seLabGrade = 9;
                                    } else if (seLabController.text == "A") {
                                      seLabGrade = 8;
                                    } else if (seLabController.text == "B+") {
                                      seLabGrade = 7;
                                    } else if (seLabController.text == "B") {
                                      seLabGrade = 6;
                                    } else if (seLabController.text == "C") {
                                      seLabGrade = 5;
                                    } else {
                                      seLabGrade = 0;
                                    }

                                    //cnwt lab
                                    if (cnwtLabController.text == "O") {
                                      cnwtLabGrade = 10;
                                    } else if (cnwtLabController.text == "A+") {
                                      cnwtLabGrade = 9;
                                    } else if (cnwtLabController.text == "A") {
                                      cnwtLabGrade = 8;
                                    } else if (cnwtLabController.text == "B+") {
                                      cnwtLabGrade = 7;
                                    } else if (cnwtLabController.text == "B") {
                                      cnwtLabGrade = 6;
                                    } else if (cnwtLabController.text == "C") {
                                      cnwtLabGrade = 5;
                                    } else {
                                      cnwtLabGrade = 0;
                                    }

                                    //acs lab
                                    if (acsLabController.text == "O") {
                                      acsLabGrade = 10;
                                    } else if (acsLabController.text == "A+") {
                                      acsLabGrade = 9;
                                    } else if (acsLabController.text == "A") {
                                      acsLabGrade = 8;
                                    } else if (acsLabController.text == "B+") {
                                      acsLabGrade = 7;
                                    } else if (acsLabController.text == "B") {
                                      acsLabGrade = 6;
                                    } else if (acsLabController.text == "C") {
                                      acsLabGrade = 5;
                                    } else {
                                      acsLabGrade = 0;
                                    }

                                    semFiveGpa = ((flatGrade * flatCredit) +
                                            (seGrade * seCredit) +
                                            (cnGrade * cnCredit) +
                                            (wtGrade * wtCredit) +
                                            (seLabGrade * seLabCredit) +
                                            (cnwtLabCredit * cnwtLabGrade) +
                                            (acsLabCredit * acsLabGrade)) /
                                        16;
                                  });
                                },
                                color: const Color(0xFFCC2944),
                                child: const Text(
                                  "Calculate SGPA",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              Text(
                                "The result is: " +
                                    semFiveGpa.toStringAsFixed(2),
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 10,
                ),
                //SEM -6
                const Text(
                  "Sem - 6",
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 1,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    color: Colors.white,
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          subject("Machine Learning", mlController),
                          subject("Compiler Design", cdController),
                          subject(
                              "Design&Analysis of Algorithm", daaController),
                          subject("Machine Learning Lab", mlLabController),
                          subject("Compiler Design Lab", cdLabController),
                          subject("Environmental Science", esController),

                          const SizedBox(
                            height: 20,
                          ),
                          //button
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RaisedButton(
                                onPressed: () {
                                  setState(() {
                                    //machine learning
                                    if (mlController.text == "O") {
                                      mlGrade = 10;
                                    } else if (mlController.text == "A+") {
                                      mlGrade = 9;
                                    } else if (mlController.text == "A") {
                                      mlGrade = 8;
                                    } else if (mlController.text == "B+") {
                                      mlGrade = 7;
                                    } else if (mlController.text == "B") {
                                      mlGrade = 6;
                                    } else if (mlController.text == "C") {
                                      mlGrade = 5;
                                    } else {
                                      mlGrade = 0;
                                    }

                                    //compiler design
                                    if (cdController.text == "O") {
                                      cdGrade = 10;
                                    } else if (cdController.text == "A+") {
                                      cdGrade = 9;
                                    } else if (cdController.text == "A") {
                                      cdGrade = 8;
                                    } else if (cdController.text == "B+") {
                                      cdGrade = 7;
                                    } else if (cdController.text == "B") {
                                      cdGrade = 6;
                                    } else if (cdController.text == "C") {
                                      cdGrade = 5;
                                    } else {
                                      cdGrade = 0;
                                    }

                                    //design and analysis of algorithm
                                    if (daaController.text == "O") {
                                      daaGrade = 10;
                                    } else if (daaController.text == "A+") {
                                      daaGrade = 9;
                                    } else if (daaController.text == "A") {
                                      daaGrade = 8;
                                    } else if (daaController.text == "B+") {
                                      daaGrade = 7;
                                    } else if (daaController.text == "B") {
                                      daaGrade = 6;
                                    } else if (daaController.text == "C") {
                                      daaGrade = 5;
                                    } else {
                                      daaGrade = 0;
                                    }

                                    //machine learning lab
                                    if (mlLabController.text == "O") {
                                      mlLabGrade = 10;
                                    } else if (mlLabController.text == "A+") {
                                      mlLabGrade = 9;
                                    } else if (mlLabController.text == "A") {
                                      mlLabGrade = 8;
                                    } else if (mlLabController.text == "B+") {
                                      mlLabGrade = 7;
                                    } else if (mlLabController.text == "B") {
                                      mlLabGrade = 6;
                                    } else if (mlLabController.text == "C") {
                                      mlLabGrade = 5;
                                    } else {
                                      mlLabGrade = 0;
                                    }

                                    //compiler design lab
                                    if (cdLabController.text == "O") {
                                      cdLabGrade = 10;
                                    } else if (cdLabController.text == "A+") {
                                      cdLabGrade = 9;
                                    } else if (cdLabController.text == "A") {
                                      cdLabGrade = 8;
                                    } else if (cdLabController.text == "B+") {
                                      cdLabGrade = 7;
                                    } else if (cdLabController.text == "B") {
                                      cdLabGrade = 6;
                                    } else if (cdLabController.text == "C") {
                                      cdLabGrade = 5;
                                    } else {
                                      cdLabGrade = 0;
                                    }

                                    semSixGpa = ((mlGrade * mlCredit) +
                                            (cdGrade * cdCredit) +
                                            (daaGrade * daaCredit) +
                                            (mlLabGrade * mlLabCredit) +
                                            (cdLabGrade * cdLabCredit)) /
                                        15;
                                  });
                                },
                                color: const Color(0xFFCC2944),
                                child: const Text(
                                  "Calculate SGPA",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              Text(
                                "The result is: " +
                                    semSixGpa.toStringAsFixed(2),
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 20,
                ),
                RaisedButton(
                  color: const Color(0xFFCC2944),
                  onPressed: () {
                    setState(() {
                      riskFactor();
                      FirebaseFirestore.instance
                          .collection('cgpa')
                          .doc(auth.currentUser?.uid)
                          .set({
                        'cgpa': resultCse.toString(),
                      });
                    });
                  },
                  child: Text(
                    "CGPA is: " + resultCse.toStringAsFixed(2),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
