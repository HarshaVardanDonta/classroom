import 'package:classroom/resources/auth_method.dart';
import 'package:classroom/screens/dashboard.dart';
import 'package:classroom/screens/details.dart';
import 'package:classroom/screens/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'details.dart';

class signIn extends StatefulWidget {
  const signIn({Key? key}) : super(key: key);

  @override
  _signInState createState() => _signInState();
}

double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

class _signInState extends State<signIn> {
  final signInEmailController = TextEditingController();
  final signInPassController = TextEditingController();
  void loginUser() async {
    String res = await AuthMethods().loginUser(
        email: signInEmailController.text, password: signInPassController.text);
    if (res == "success") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => dashboard()),
      );
    } else {
      const snackBar = SnackBar(
        content: Text('invalid details(try removing unnecessary whitespaces)'),
      );

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'pics/signin_design.png',
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fitWidth,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: customTextField('Enter your email id ...', 'Email id',
                  signInEmailController, false),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: customTextField('Enter your password ...', 'Password',
                  signInPassController, true),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                    onTap: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => details()),
                      );
                    },
                    child: customContainerButton('Register')),
                InkWell(
                  onTap: () async {
                    loginUser();
                  },
                  child: customContainerButton('Sign In'),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
