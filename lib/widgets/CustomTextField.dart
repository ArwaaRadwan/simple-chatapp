import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomFormTextField extends StatelessWidget {
  CustomFormTextField({this.hintText, this.onChanged , this.obscureText=false});
  Function(String)? onChanged;
  String? hintText;
  bool? obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText!,
      validator: (data) {
        if (data!.isEmpty) {
          return "field is required";
        }
        return null;
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        hintStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
        ),
      ),
    );
  }
}
