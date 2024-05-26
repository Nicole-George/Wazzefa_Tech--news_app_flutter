import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/controller/auth_controller.dart';
import 'package:new_app/screens/widgets/auth/text_utils.dart';

class CheckWidget extends StatelessWidget {
  final String text;
  CheckWidget({required this.text});
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (_) {
        return Row(
          children: [
            InkWell(
              onTap: () {
                controller.checkBox();
                
              },
              
              child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: controller.isCheckBox
                    ? Icon(
                        Icons.done,
                        color: Color.fromARGB(255, 134, 135, 137),
                        size: 30,
                      )
                    : Container(),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Row(
              children: [
                TextUtils(
                    text: text,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff2b3868),
                    underLine: TextDecoration.none),
             
              ],
            ),
          ],
        );
      },
    );
  }
}
