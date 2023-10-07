import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutterext/constants.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField(
      {this.hintText,
      this.onChanged,
      this.controller,
      this.obsecureText = false});
  String? hintText;
  Function(String)? onChanged;
  TextEditingController? controller;
  bool obsecureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        maxLength: 15,
        controller: controller,
        obscureText: obsecureText,
        validator: (data) {
          if (data!.isEmpty) {
            return "fill form correctly";
          }
        },
        onChanged: onChanged,
        style: TextStyle(color: kSecondaryColor, fontSize: 17),
        decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 20, right: 10),
              child: Icon(
                Icons.search_outlined,
                color: Colors.grey,
                size: 25,
              ),
            ),
            fillColor: Colors.transparent,
            filled: true,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(35)),
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey, fontSize: 17),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(35)),
            border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(35))),
      ),
    );
  }
}
