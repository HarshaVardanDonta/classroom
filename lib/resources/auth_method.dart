import 'dart:typed_data';

import 'package:classroom/resources/storage_methods.dart';
import 'package:classroom/screens/details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //signup user
  Future<String> signupUser({
    required String name,
    required String email,
    required String username,
    required String password,
    required String branch,
    required String semester,
    required Uint8List file,
  }) async {
    String res = "some error occured";
    try {
      if (email.isNotEmpty || username.isNotEmpty || password.isNotEmpty) {
        //register user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        print(cred.user!.uid);
        String photoUrl =
            await StorageMethod().uploadImageToStorage('profilePics', file);
        //add user to database
        await _firestore.collection('users').doc(cred.user!.uid).set({
          'name': name,
          'username': username,
          'email': email,
          'password': password,
          'branch': branch,
          'semester': semester,
          'photoUrl': photoUrl,
        });
        res = "success";
        print(res);
      }
    } catch (err) {
      print("error");
      res = err.toString();
    }
    return res;
  }

  //signin user
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "some error occured";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "success";
      } else {
        res = "enter all fields";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
