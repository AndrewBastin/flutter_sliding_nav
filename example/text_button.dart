
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class _TextButtonStyles {

  static final TextStyle activeTextButton = new TextStyle(
    color: Colors.black,
    fontSize: 35.0,
    fontWeight: FontWeight.w700
  );

  static final TextStyle inactiveTextButton = new TextStyle(
    color: Colors.grey,
    fontSize: 35.0,
    fontWeight: FontWeight.w700
  );

}

class TextButton extends StatelessWidget {

  final String buttonText;
  final bool buttonActive;
  final Function onTap;

  TextButton({ 
    @required this.buttonText, 
    @required this.buttonActive, 
    @required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: this.onTap,
      
      child: new Text(
        this.buttonText,
        textAlign: TextAlign.left,
        style: this.buttonActive ? _TextButtonStyles.activeTextButton : _TextButtonStyles.inactiveTextButton
      )
    );
  }

}
