import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthFn {
  Future<void> signIn(context, email, password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.code, style: const TextStyle(fontSize: 20)),
        ),
      );
    }
  }

  resetPassword(email, context) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content:
            Text('Password Reset request send', style: TextStyle(fontSize: 20)),
        duration: Duration(milliseconds: 1000),
      ));
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.code, style: const TextStyle(fontSize: 20)),
        duration: const Duration(milliseconds: 1000),
      ));
    }
  }

  signUp(email, password, confirmPassword, context) async {
    try {
      if (password == confirmPassword) {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("password don't match")));
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.code)));
    }
  }
}
