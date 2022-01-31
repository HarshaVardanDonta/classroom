import 'dart:typed_data';

import 'package:classroom/resources/auth_method.dart';
import 'package:classroom/resources/utils.dart';
import 'package:classroom/screens/dashboard.dart';
import 'package:classroom/screens/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class details extends StatefulWidget {
  const details({Key? key}) : super(key: key);

  @override
  _detailsState createState() => _detailsState();
}

double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

late String birthDateInString;
late DateTime birthDate;
final formKey = GlobalKey<FormState>();
final nameController = TextEditingController();
final userNameController = TextEditingController();
final emailController = TextEditingController();
final passController = TextEditingController();
final discController = TextEditingController();
final branchController = TextEditingController();
final semesterController = TextEditingController();
late String nameOfUser;
late String bioOfUser;

class _detailsState extends State<details> {
  DateTime currentDate = DateTime.now();
// DateTime pickedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(1999),
        lastDate: DateTime(2050));

    // currentDate = pickedDate!;
    if (pickedDate != null && pickedDate != currentDate) {
      setState(() {
        currentDate = pickedDate;
      });
    }
  }

  Uint8List? image;
  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      image = im;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                dashboardText("Enter your details below:"),
                const SizedBox(
                  height: 10,
                ),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      //photo
                      Stack(
                        children: [
                          image != null
                              ? CircleAvatar(
                                  radius: 64,
                                  backgroundImage: MemoryImage(image!),
                                )
                              : const CircleAvatar(
                                  radius: 64,
                                  backgroundImage: NetworkImage(
                                      'https://www.kindpng.com/picc/m/451-4517876_default-profile-hd-png-download.png'),
                                ),
                          Positioned(
                            bottom: -10,
                            child: IconButton(
                              onPressed: () {
                                selectImage();
                              },
                              icon: const Icon(
                                Icons.add_a_photo,
                              ),
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      //name
                      TextFormField(
                        controller: nameController,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        decoration: const InputDecoration(
                          labelStyle: TextStyle(color: Colors.white),
                          label: Text("Name"),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFCC2944)),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFCC2944)),
                          ),
                        ),
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      //username
                      TextFormField(
                        controller: userNameController,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        decoration: const InputDecoration(
                          labelStyle: TextStyle(color: Colors.white),
                          label: Text("User name"),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFCC2944)),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFCC2944)),
                          ),
                        ),
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      //email
                      TextFormField(
                        controller: emailController,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        decoration: const InputDecoration(
                          labelStyle: TextStyle(color: Colors.white),
                          label: Text("email"),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFCC2944)),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFCC2944)),
                          ),
                        ),
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      //pass
                      TextFormField(
                        obscureText: true,
                        controller: passController,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        decoration: const InputDecoration(
                          labelStyle: TextStyle(color: Colors.white),
                          label: Text("password"),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFCC2944)),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFCC2944)),
                          ),
                        ),
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      //date
                      Container(
                        height: 40,
                        width: getScreenWidth(context),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _selectDate(context);
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              dashboardText("select date of birth"),
                              Text(
                                "${currentDate.day}-${currentDate.month}-${currentDate.year}",
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      //class
                      TextFormField(
                        controller: branchController,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        decoration: const InputDecoration(
                          hintText: "Cse ,Mech, Civil, others..",
                          hintStyle: TextStyle(color: Colors.white),
                          labelStyle: TextStyle(color: Colors.white),
                          label: Text("Branch"),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFCC2944)),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFCC2944)),
                          ),
                        ),
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      //semester
                      TextFormField(
                        controller: semesterController,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        decoration: const InputDecoration(
                          labelStyle: TextStyle(color: Colors.white),
                          label: Text("Semester"),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFCC2944)),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFCC2944)),
                          ),
                        ),
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      //submit button
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: const Color(0xFFCC2944)),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              // If the form is valid, display a snackbar. In the real world,
                              // you'd often call a server or save the information in a database.
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Processing Data')),
                              );
                              nameOfUser = nameController.text;
                              bioOfUser = discController.text;
                              AlertDialog alert = AlertDialog(
                                title: const Text(
                                  "Confirmation",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                content: const Text(
                                  "Is the information entered correct? ",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () async {
                                      String res = await AuthMethods()
                                          .signupUser(
                                              name: nameController.text,
                                              email: emailController.text,
                                              username: userNameController.text,
                                              password: passController.text,
                                              branch: branchController.text,
                                              semester: semesterController.text,
                                              file: image!);
                                      print(res);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const dashboard()),
                                      );
                                    },
                                    child: const Text(
                                      "continue",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                        primary: const Color(0xFFCC2944)),
                                  ),
                                ],
                              );

                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => alert),
                              );
                            }
                          },
                          child: const Text(
                            "Submit",
                            style: TextStyle(fontSize: 20),
                          )),
                    ],
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
