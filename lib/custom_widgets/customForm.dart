import 'package:flutter/material.dart';

typedef Validator = String? Function(String?);

class customForm extends StatelessWidget {
  String lableForm;
  String textlable;
  TextEditingController controller;
  Validator? validator;
  TextInputType keyboard;
  bool obscure;
  Icon suffex;

  customForm(
    this.textlable,
    this.suffex,
    this.lableForm,{
     required this.controller,
    this.validator,
    this.keyboard = TextInputType.text,
    this.obscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        keyboardType: keyboard,
        obscureText: obscure,
        controller: controller,
        validator: validator,
        decoration: InputDecoration(

          disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white,)),
          label: Text(
            textlable,
            style: TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600),
          ),
          prefixIcon: suffex,
          hintStyle: TextStyle(color: Color(0xff555454B2), fontSize: 12),
          hintText: lableForm,

        ));
  }
}
