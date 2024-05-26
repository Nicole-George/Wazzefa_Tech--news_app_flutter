// import 'package:animated_splash_screen/animated_splash_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:new_app/screens/view/Register/register_screen.dart';
// import 'package:page_transition/page_transition.dart';
// class SpalshScreen extends StatefulWidget {
//   const SpalshScreen({super.key});

//   @override
//   State<SpalshScreen> createState() => _SpalshScreenState();
// }

// class _SpalshScreenState extends State<SpalshScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return

//      AnimatedSplashScreen(
//       splash:'assets/images/news1.jpg',
//       nextScreen: RegisterationPage(),
//       splashTransition: SplashTransition.rotationTransition,
//       pageTransitionType: PageTransitionType.scale,
//       backgroundColor: Colors.blue,
//       animationDuration: const Duration(seconds: 5),
//     );
//   }
// }


import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/screens/view/Register/register_screen.dart';

import '../../../controller/auth_controller.dart';
import '../Home/home_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Simulate a delay before navigating to the main screen
    Timer(Duration(seconds: 5), () {
      // Get.to(RegisterationPage());
      AuthController().isLoggedIn().then((isLoggedIn) {
        if (isLoggedIn) {
          // User is logged in, navigate to home screen
          Get.off(HomePage(txt: '',));
        } else {
          // User is not logged in, navigate to register screen
          Get.off(RegisterationPage());
        }
      });

    });

    return Scaffold(
      body: Center(
        child: Image.asset('assets/images/news1.jpg'),
      ),
    );
  }
}