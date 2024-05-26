import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {required this.txt,
      required this.title,
      required this.obscureText,
      // required this.controller,
      required this.onChanged,
      required this.keyboardType,
      required this.prefixIcon,
     
      });
  String txt;
  String title;
  bool obscureText = true;
  TextInputType keyboardType = TextInputType.text; 
  Icon prefixIcon;
  // TextEditingController controller;
  Function(String)? onChanged;
  final passwordRegex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  final emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
final confrimPasswordRegex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
      
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: TextFormField(
        validator: (data) {
          print(title.toString()+"mmm");
          if (title == 'First Name') {
            if (data!.isEmpty) {
              return 'First Name is required';
            }
          }
       if (title == 'Last Name') {
            if (data!.isEmpty) {
              return 'Last Name is required';
            }
          }
          if (title == 'Email') {
            if (data!.isEmpty) {
              return 'email is required';
            } else if (!emailRegex.hasMatch(data)) {
              return 'Please enter a valid email address';
            }
          }
          if (title == 'Password') {
            if (data!.isEmpty) {
              return 'password is required';
            } else if (!passwordRegex.hasMatch(data)) {
              return 'Password must be at least 8 characters long, contain a mix of uppercase, lowercase, numbers, and special characters';
            }
          }
         
        },
        
        keyboardType: keyboardType,
        onChanged: onChanged,
        obscureText: obscureText,
        // controller: controller,
        decoration: InputDecoration(
          fillColor: Colors.grey.shade200,
          filled: true,
          prefixIcon: prefixIcon,
          label: Text(title),
          labelStyle: const TextStyle(color: Color(0xff3374D4)),
          hintText: txt,
          helperStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.grey[100],
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Color(0xff3374D4),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Color(0xff3374D4),
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Color(0xff3374D4),
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            // الجزء الفوق
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Color(0xff3374D4),
            ),
          ),
        ),
      ),
    );
  }
}
