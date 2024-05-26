import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/screens/view/Home/home_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  // var displayUserName = ''.obs;
  // var displayUserPhoto = ''.obs;
  // var displayUserEmail = ''.obs;
  // var isSignIn = false;
  // GoogleSignIn googleSignIn = GoogleSignIn();
  bool isVisibility = false;
  bool isCheckBox = false;


  void visibility() {
    isVisibility = !isVisibility;
    update();
  }

  void checkBox() {
    isCheckBox = !isCheckBox;
    update();
  }
  static const String isLoggedInKey = 'isLoggedIn';

  // Function to set the login status in shared preferences
  Future<void> setLoggedIn(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(isLoggedInKey, value);
  }

  // Function to get the login status from shared preferences
  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isLoggedInKey) ?? false;
  }

  void signUpUsingFirebase(
    String email,
    String password,
  ) async {
    try {
      await auth
          .createUserWithEmailAndPassword(
            email: email,
            password: password,
          )
          .then((value) {});
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), (' ').capitalize!);
      String message = '';
      if (error.code == 'weak-password') {
        message = 'Provided Password is too weak.';
      } else if (error.code == 'email-already-in-use') {
        message = 'Account Already exists for that email.';
      } else {
        message = error.message.toString();
      }

      Get.snackbar(title, message,
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.green);
    } catch (error) {
      Get.snackbar("Error!", error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.green);
    }
    await setLoggedIn(true);
  }

  void loginUsingFirebase(String email, String password) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {});
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), (' ').capitalize!);
      String message = '';
      if (error.code == 'user-not-found') {
        message =
            "Account don't exist fo that $email Create you account by singing up";
      } else if (error.code == 'wrong-password') {
        message = 'Invalid passord Please try again';
      } else {
        message = error.message.toString();
      }

      Get.snackbar(title, message,
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.green);
    } catch (error) {
      Get.snackbar("Error!", error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.green);
    }
    await setLoggedIn(true);
  }

  // void googleSignUpApp() async {
  //   try {
  //     final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
  //     displayUserName.value = googleUser!.displayName!;
  //     displayUserPhoto.value = googleUser.photoUrl!;
  //     displayUserEmail.value = googleUser.email;
  //     final GoogleSignInAuthentication? googleSignInAuthentication =
  //         await googleUser.authentication;
  //     final credential = GoogleAuthProvider.credential(
  //       accessToken: googleSignInAuthentication?.accessToken,
  //       idToken: googleSignInAuthentication?.idToken,
  //     );
  //     await auth.signInWithCredential(credential);
  //     isSignIn = true;

  //     update();
  //   } catch (error) {
  //     Get.snackbar("Error!", error.toString(),
  //         snackPosition: SnackPosition.BOTTOM,
  //         colorText: Colors.white,
  //         backgroundColor: Colors.green);
  //   }
  // }

  void resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);

      update();
      Get.back();
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), (' ').capitalize!);
      String message = '';
      if (error.code == 'user-not-found') {
        message =
            "Account don't exist fo that $email Create you account by singing up";
      } else {
        message = error.message.toString();
      }

      Get.snackbar(title, message,
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.green);
    } catch (error) {
      Get.snackbar("Error!", error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.green);
    }
  }

  
}
