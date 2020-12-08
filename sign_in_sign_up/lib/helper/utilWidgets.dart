import 'package:flutter/material.dart';
import 'package:sign_in_sign_up/helper/styleWidgets.dart';

Widget buildTextField(String labelText, String hintText, IconData prefixIcon,
    bool shouldObscure, TextInputType textInputType) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        labelText,
        style: labelTextStyle,
      ),
      SizedBox(
        height: 10.0,
      ),
      Container(
        alignment: Alignment.centerLeft,
        decoration: boxDecoration,
        height: 60.0,
        child: TextField(
          cursorColor: Colors.black,
          obscureText: shouldObscure,
          keyboardType: textInputType,
          style: TextStyle(fontWeight: FontWeight.bold),
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(prefixIcon, color: Colors.white),
              hintText: hintText,
              hintStyle: hintTextStyle),
        ),
      )
    ],
  );
}

Widget buildButton(Function pressed, String btnText, double verticalPad) {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.symmetric(vertical: verticalPad),
    child: RaisedButton(
      onPressed: pressed,
      padding: EdgeInsets.all(15.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      color: Colors.white,
      elevation: 5.0,
      child: Text(
        btnText,
        style: TextStyle(
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans'),
      ),
    ),
  );
}

Widget buildTextFormField(
    String labelText,
    String hintText,
    IconData prefixIcon,
    bool shouldObscure,
    TextInputType textInputType,
    Function validator,
    TextEditingController textEditingController) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        labelText,
        style: labelTextStyle,
      ),
      SizedBox(
        height: 10.0,
      ),
      Container(
        alignment: Alignment.centerLeft,
        decoration: boxDecoration,
        height: 60.0,
        child: TextFormField(
          validator: validator,
          controller: textEditingController,
          cursorColor: Colors.black,
          obscureText: shouldObscure,
          keyboardType: textInputType,
          style: TextStyle(fontWeight: FontWeight.bold),
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(prefixIcon, color: Colors.white),
              hintText: hintText,
              hintStyle: hintTextStyle),
        ),
      )
    ],
  );
}
