import 'package:flutter/material.dart';

final hintTextStyle = TextStyle(color: Colors.white, fontFamily: 'OpenSans');

final labelTextStyle = TextStyle(
    color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'OpenSans');

final labelUnderlineTextStyle = TextStyle(
    color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
decoration: TextDecoration.underline);

final boxDecoration = BoxDecoration(
    color: Color(0xFF6CA8F1),
    borderRadius: BorderRadius.circular(10.0),
    boxShadow: [
      BoxShadow(color: Colors.black12, blurRadius: 6.0, offset: Offset(0, 2))
    ]
);
