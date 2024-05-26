import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:new_app/controller/auth_controller.dart';
import 'package:new_app/screens/view/Home/home_screen.dart';
import 'package:new_app/screens/view/Register/register_screen.dart';
import 'package:new_app/screens/view/forgetPassword/forget_password_screen.dart';
import 'package:new_app/screens/widgets/auth/container_under.dart';
import 'package:new_app/screens/widgets/textFormField.dart/custom_Text.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? email, password;

  GlobalKey<FormState> form = GlobalKey<FormState>();

final AuthController controller=Get.put(AuthController());
   FirebaseAuth auth = FirebaseAuth.instance; //instance => object

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
                  automaticallyImplyLeading: false,
      
          title: Text(
            "Login Page",
            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),
          ),
          centerTitle: true,
          backgroundColor: Color(0xff2b3868)
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Form(
              key: form,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Center(

                      child:
                       CircleAvatar(
                          radius: 100,
                          backgroundImage: AssetImage(
                            'assets/images/login.jpg',
                            // key: ValueKey<int>(currentImageIndex),
                            // fit: BoxFit.cover,
                          ),
                        ),


                    ),

                  ),



                  CustomTextFormField(
                    txt: 'Email',
                    title: 'Email',
                    obscureText: false,
                    onChanged: (data) {
                      email = data;
                    },
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: Icon(Icons.email,color: Color(0xff2b3868)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    txt: 'Password',
                    title: 'Password',
                    obscureText: true,
                    onChanged: (data) {
                      password = data;
                    },
                    keyboardType: TextInputType.visiblePassword,
                    prefixIcon: Icon(Icons.lock,color: Color(0xff2b3868)),
                  ),
                   SizedBox(
                    height: 10,
                  ),
                     Align(
                      alignment: Alignment.topCenter,
                       child: TextButton(onPressed: (){
                        Get.off(ForgetPasswordScreen());
                       }, child: Text("Forget Password ?",style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                       ),)),
                     ),

               GetBuilder<AuthController>(builder: (_){
                 return  Container(
                  width: 200,
                  height: 50,
                   child: ElevatedButton(
                        onPressed: () {
                          if (form.currentState!.validate()) {
                            // auth.createUserWithEmailAndPassword(email: email!, password: password!);
                             controller.loginUsingFirebase(email!, password!);
                             Get.to(HomePage(txt: email!,));
                   
                          }
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                        
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Color(0xff2b3868)),
                        ),
                      ),
                 );
               }),
               const SizedBox(height: 10,),
                //// google
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                          onTap: () async {
                            final GoogleSignInAccount? googleUser =
                            await GoogleSignIn().signIn();
                            final GoogleSignInAuthentication? googleAuth =
                            await googleUser?.authentication;
                            final credential = GoogleAuthProvider.credential(
                              accessToken: googleAuth?.accessToken,
                              idToken: googleAuth?.idToken,
                            );
                            await FirebaseAuth.instance.signInWithCredential(credential);
                            Get.to(HomePage(txt: emailController.text,));
      
                          },
                          child: Image.asset(
                            'assets/images/google.jpg',
                            width: 50,
                          )),
                    ],
                  ),
               SizedBox(height: 15,),
                    ContainerUnder(
                    text: "Don't have an Account ?",
                    onPressed: () {
                      Get.off(RegisterationPage());
                    },
                    textType: "Sign Up"),
      
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
