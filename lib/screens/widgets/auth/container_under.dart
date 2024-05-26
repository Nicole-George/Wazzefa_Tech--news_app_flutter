import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/screens/widgets/auth/text_utils.dart';

class ContainerUnder extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final String textType;
  ContainerUnder(
      {required this.text, required this.onPressed, required this.textType});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 70,
      // decoration:const BoxDecoration(
      //     color: Color(0xff2b3868),
      //     borderRadius:  BorderRadius.only(
      //       topLeft: Radius.circular(25),
      //       topRight: Radius.circular(25),
      //       bottomLeft: Radius.circular(25),
      //       bottomRight: Radius.circular(25),
      //     )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextUtils(
              text: text,
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xff2b3868),
              underLine: TextDecoration.none),
          TextButton(
            onPressed: onPressed,
            child: TextUtils(
                text: textType,
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color(0xff3374D4),
                underLine: TextDecoration.underline),
          )
        ],
      ),
    );
  }
}
