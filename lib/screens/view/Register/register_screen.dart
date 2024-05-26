
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:new_app/controller/auth_controller.dart';
import 'package:new_app/screens/view/Home/home_screen.dart';
import 'package:new_app/screens/view/login/login_screen.dart';
import 'package:new_app/screens/widgets/auth/auth_button.dart';
import 'package:new_app/screens/widgets/auth/auth_text_form_field.dart';
import 'package:new_app/screens/widgets/auth/check_widget.dart';
import 'package:new_app/screens/widgets/auth/container_under.dart';
import 'package:new_app/screens/widgets/textFormField.dart/custom_Text.dart';

class RegisterationPage extends StatefulWidget {
  RegisterationPage({super.key});

  @override
  State<RegisterationPage> createState() => _RegisterationPageState();
}

class _RegisterationPageState extends State<RegisterationPage>
    with TickerProviderStateMixin {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  //final controller = Get.put(AuthController());
  String? firstname, lastname, email, password;

  GlobalKey<FormState> form = GlobalKey<FormState>();

  final AuthController controller = Get.put(AuthController());
  FirebaseAuth auth = FirebaseAuth.instance; //instance => object

  int currentImageIndex = 0;
  List<String> images = [
    'assets/images/news1.jpg' ,
    'assets/images/news2.jpg',
    'assets/images/news3.jpg',
    'assets/images/news4.jpg',

  ];

  late Timer timer;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      // duration: Duration(milliseconds: 500),
    );

    // Start the timer when the widget is first created
    timer = Timer.periodic(Duration(seconds: 5), (Timer t) {
      // Update the image index every 5 seconds
      setState(() {
        currentImageIndex = (currentImageIndex + 1) % images.length;
      });
      // _animationController.forward(from: 0);
    });
  }

  @override
  void dispose() {
    // Dispose of the animation controller and cancel the timer
    _animationController.dispose();
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "Registration Page",
            style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Color(0xff2b3868),
           
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Form(
              key: form,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                 const Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Center(

                        child:
                        CircleAvatar(
                          radius: 70,
                          backgroundImage: AssetImage(
                            // images[currentImageIndex],
                            'assets/images/login.jpg',
                            // key: ValueKey<int>(currentImageIndex),
                            // fit: BoxFit.cover,
                          ),
                        ),
                      // FadeTransition(
                            //   opacity: _animationController,
                            //   child: CircleAvatar(
                            //     radius: 70,
                            //     backgroundImage: AssetImage(
                            //       // images[currentImageIndex],
                            //       'assets/images/login.jpg',
                            //       // key: ValueKey<int>(currentImageIndex),
                            //       // fit: BoxFit.cover,
                            //     ),
                            //   ),
                            // ),

                      ),

                  ),
      
                  const SizedBox(height: 10),
      
                  CustomTextFormField(
                    txt: 'First Name',
                    title: 'First Name',
                    obscureText: false,
                    onChanged: (data) {
                      firstname = data;
                    },
                    keyboardType: TextInputType.name,
                    prefixIcon: Icon(Icons.person, color: Color(0xff2b3868)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    txt: 'Last Name',
                    title: 'Last Name',
                    obscureText: false,
                    onChanged: (data) {
                      lastname = data;
                    },
                    keyboardType: TextInputType.name,
                    prefixIcon: Icon(Icons.person, color: Color(0xff2b3868)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    txt: 'Email',
                    title: 'Email',
                    obscureText: false,
                    onChanged: (data) {
                      email = data;
                    },
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: Icon(Icons.email, color: Color(0xff2b3868)),
                  ),
                  const SizedBox(
                    height: 5,
                  ),

                  GetBuilder<AuthController>(
                    builder: (_) {
                      return AuthTextFormField(
                          label: 'Password',
                          controller: passwordController,
                          obscureText: controller.isVisibility ? false : true,
                          validator: (value) {
                            if (value.toString().length < 8) {
                              return 'Password should be longer or equal to 6 characters';
                            }
                          },
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Color(0xff2b3868),
                            size: 30,
                          ),
                          suffixIcon: IconButton(
                              onPressed: () {
                                controller.visibility();
                              },
                              icon: controller.isVisibility
                                  ? Icon(Icons.visibility_off,
                                      color: Colors.black)
                                  : Icon(
                                      Icons.visibility,
                                      color: Colors.black,
                                    )),
                          hintText: "Password");
                    },
                  ),

                  GetBuilder<AuthController>(
                    builder: (_) {
                      return AuthTextFormField(
                        label: 'Confirm Password',
                        controller:
                        confirmPasswordController, // Use a different controller
                        obscureText: controller.isVisibility ? false : true,
                        validator: (value) {
                          if (value.toString().length < 8) {
                            return 'Password should be longer or equal to 8 characters';
                          } else if (value != passwordController.text) {
                            return 'Passwords do not match';
                          }
                        },
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Color(0xff2b3868),
                          size: 30,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            controller.visibility();
                          },
                          icon: controller.isVisibility
                              ? Icon(Icons.visibility_off, color: Colors.black)
                              : Icon(
                            Icons.visibility,
                            color: Colors.black,
                          ),
                        ),
                        hintText: "Confirm Password",
                      );
                    },
                  ),
      
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 50),
                    child: CheckWidget(
                      text: "I accept  terms & conditions",
                    ),
                  ),
      
                  SizedBox(
                    height: 10,
                  ),

                  GetBuilder<AuthController>(builder: (_) {
                    return AuthButton(
                      onPressed: () {
                        if (controller.isCheckBox == false) {
                          Get.snackbar(
                              "Check Box", "Please,Accept terms & conditions",
                              snackPosition: SnackPosition.BOTTOM,
                              colorText: Colors.white,
                              backgroundColor: Colors.green);
                        } else {
                          if (form.currentState!.validate()) {
                            String email = emailController.text.trim();
                            String password = passwordController.text;
                            controller.signUpUsingFirebase(email, password);
                            Get.to(LoginPage());
      
                            controller.isCheckBox == true;
                          }
                        }
                      },
                      text: 'SIGN UP',
                    );
                  }),
                  //  GetBuilder<AuthController>(builder: (_){
                  //    return  ElevatedButton(
                  //         onPressed: () {
                  //           if (form.currentState!.validate()) {
                  //             // auth.createUserWithEmailAndPassword(email: email!, password: password!);
                  //              controller.signUpUsingFirebase(email!, password!);
                  //             Get.to(LoginPage());
      
                  //           }
                  //         },
                  //         child: Text(
                  //           "Register",
                  //           style: TextStyle(color: Colors.white, fontSize: 30),
                  //         ),
      
                  //         style: ButtonStyle(
                  //           backgroundColor:
                  //               MaterialStateProperty.all<Color>(Color(0xff3374D4)),
                  //         ),
                  //       );
                  //  }),
      
                  //        Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
      
                  //        InkWell(
                  //       onTap: () {
                  //         controller.googleSignUpApp();
                  //             signInWithGoogle().then((userCredential) {
                  //               if (userCredential != null){
                  //                 Navigator.push(
                  //                   context,
                  //                   MaterialPageRoute(
                  //                     builder: (context) => LoginPage(),
                  //                   ),
                  //                 );
                  //               }
                  //             }).catchError((error) {
                  //               print('Google sign-in error: $error');
                  //             });
                  //           },
                  //         child: Image.asset('assets/images/google.jpg',width: 50,)),
      
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: 5,
                  // ),
                  ContainerUnder(
                      text: "Already have an Account ?",
                      onPressed: () {
                        Get.off(LoginPage());
                      },
                      textType: "Log in"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


