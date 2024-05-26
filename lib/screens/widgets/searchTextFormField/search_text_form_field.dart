import 'package:flutter/material.dart';

class SearchTextFormField extends StatelessWidget {
  SearchTextFormField(
      {required this.txt,required this.onChanged,required this.controller});
  String txt;
  Function(String) onChanged;
  TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      height: 50,
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search_rounded),
           filled: true,
                fillColor: Colors.white,
          hintText: txt,
          helperStyle: const TextStyle(
             color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
          ),
          enabledBorder: OutlineInputBorder(
             borderSide: const BorderSide(
                    color: Colors.white,
                  ),
            borderRadius: BorderRadius.circular(10),
            
          ),
          focusedBorder: OutlineInputBorder(
             borderSide: const BorderSide(
                    color: Colors.white,
                  ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedErrorBorder: OutlineInputBorder(
             borderSide: const BorderSide(
                    color: Colors.white,
                  ),
            borderRadius: BorderRadius.circular(10),
          ),

          errorBorder: OutlineInputBorder(
             borderSide: const BorderSide(
                    color: Colors.white,
                  ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
