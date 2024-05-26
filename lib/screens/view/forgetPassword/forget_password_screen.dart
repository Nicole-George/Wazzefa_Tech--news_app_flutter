import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/controller/auth_controller.dart';
import 'package:new_app/screens/view/login/login_screen.dart';
import 'package:new_app/screens/widgets/auth/auth_button.dart';
import 'package:new_app/screens/widgets/auth/auth_text_form_field.dart';
import 'package:new_app/screens/widgets/utils/my_string.dart';


class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xff2b3868),
          title: const Text(
            'Forget Password',
            style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
              onPressed: () {
                Get.to(LoginPage());
              },
              icon: Icon(Icons.arrow_back,
                  color: Colors.white)),
        ),
        body: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(Icons.close_rounded),
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'if you want to recover your account, them please provide your email ID below..',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 17,
                        color: Get.isDarkMode ? Colors.black : Colors.blue),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Image.asset(
                    'assets/images/forgetpass.jpg',
                    width: 250,
                  ),
                  SizedBox(height: 50,),
                  AuthTextFormField(
                    label: 'forget password',
                      controller: emailController,
                      obscureText: false,
                      validator: (value) {
                        if (!RegExp(validationEmail).hasMatch(value)) {
                          return 'Invalid email';
                        } else {
                          return null;
                        }
                      },
                      prefixIcon: const Icon(
                        Icons.email,
                        color: Color(0xff2b3868),
                        size: 30,
                      ),
                      suffixIcon: Text(""),
                      hintText: "Email"),
                  const SizedBox(
                    height: 40,
                  ),
                  GetBuilder<AuthController>(
                    builder: (_) {
                      return AuthButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            String email = emailController.text.trim();
                            controller.resetPassword(email);
                          }
                        },
                        text: "SEND",
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
