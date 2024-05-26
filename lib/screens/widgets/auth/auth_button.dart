import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/screens/widgets/auth/text_utils.dart';


class AuthButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  AuthButton({required this.text, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color(0xff2b3868),
          maximumSize: Size(360, 60),
        ),
        onPressed: onPressed,
        child: TextUtils(
            text: text,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            underLine: TextDecoration.none),
      ),
    );
  }
}
