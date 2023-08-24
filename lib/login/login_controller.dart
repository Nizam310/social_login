import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../home/home.dart';

class LoginController extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? name;
  String? email;
  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuth =
            await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuth.accessToken,
          idToken: googleSignInAuth.idToken,
        );
        name = googleSignInAccount.displayName;
        email = googleSignInAccount.email;

        log(name.toString());
        log('name');
        log(googleSignInAccount.displayName.toString());
        return await _auth.signInWithCredential(credential);
      }
    } catch (e) {
      log("Google Sign-In Error: $e");
    }
    return null;
  }

  Future<void> handleGoogleSignIn() async {
    final UserCredential? userCredential = await signInWithGoogle();
    if (userCredential != null) {
      Navigator.pushAndRemoveUntil(
          Get.context!,
          MaterialPageRoute(
              builder: (builder) =>
                  Home(name: name ?? 'Name', email: email ?? 'Email')),
          (route) => false);

      log("Google Sign-In Success");
    } else {
      log("Google Sign-In Failed");
    }
  }

  Future signOut() async {
   await  _googleSignIn.signOut();
   await  _auth.signOut();
    Navigator.pushNamedAndRemoveUntil(Get.context!, '/', (route) => false);
  }

  login() {
    if (nameController.text == '' && passwordController.text == '') {
      Get.showSnackbar(const GetSnackBar(
        duration: Duration(seconds: 1),
        message: 'Type something first',
      ));
    } else if (nameController.text == 'nisam' &&
        passwordController.text == '123') {
      Navigator.pushAndRemoveUntil(
          Get.context!,
          MaterialPageRoute(
              builder: (builder) =>
                  Home(name: name ?? 'Name', email: email ?? 'Email')),
          (route) => false);
      Get.showSnackbar(const GetSnackBar(
        duration: Duration(seconds: 1),
        message: 'Successfully logged in',
      ));
    } else if (nameController.text != 'nisam' &&
        passwordController.text != '123') {
      Get.showSnackbar(const GetSnackBar(
        duration: Duration(seconds: 1),
        message: 'Invalid username or password',
      ));
    }
  }
}

