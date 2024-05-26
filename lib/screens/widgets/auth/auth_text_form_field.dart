import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final Function validator;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final String hintText;
  final String label;

  AuthTextFormField({
    required this.controller,
    required this.obscureText,
    required this.validator,
    required this.prefixIcon,
    required this.suffixIcon,
    required this.hintText,
    required this.label,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 5),
      child: SizedBox(
        width: 300,
        child: TextFormField(
          controller: controller,
          obscureText: obscureText,
          cursorColor: Colors.black,
          keyboardType: TextInputType.text,
          validator: (value) => validator(value),
          decoration: InputDecoration(
            label: Text(label,style: TextStyle(color: Color(0xff3374D4)),),
            fillColor: Colors.grey.shade200,
            filled: true,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 16,
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
      ),
    );
  }
}
