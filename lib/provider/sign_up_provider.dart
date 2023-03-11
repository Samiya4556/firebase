import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordlController = TextEditingController();
  bool isLoading = false;
  bool isSuccess = false;
  String error = "";
  Future<dynamic> signUp() async {
    isLoading = true;
    notifyListeners();
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordlController.text);
      isLoading = true;
      isSuccess = true;
      notifyListeners();
      return isSuccess;
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        error = "Parolingiz kuchsiz";
        debugPrint(error);
      } else if (e.code == "email-al-ready-in-use") {
        error = "Bu email allaqachon mavchud";
        debugPrint(error);
      } else {
        error = "Noma'lum xato yuz berdi";
        debugPrint(error);
      }
    }
  }
}
