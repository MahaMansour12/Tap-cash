import 'package:flutter/material.dart';


class CustomButtom extends StatelessWidget {
  @override
  String textButtom;
 Function? OnClic;
  CustomButtom(this.textButtom, {this.OnClic});
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          height: 52,
          width: 225,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17),
            border: Border.all(width: 1.5, color: Color(0xffCC000000)),
            color: Color(0xff2),
          ),
          child: Center(
            child: Text(
              textButtom,
              style: const TextStyle(
                color: Color(0xffCC000000),
                fontSize: 16,
                fontFamily: 'Inter',
              ),
              textAlign: TextAlign.center,
            ),
          )),
    );
  }
}
