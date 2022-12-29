import 'package:flutter/material.dart';
import 'package:mysampleapp/constants/appcolor.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const ButtonWidget({ Key? key, 
required this.text,
required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColor.primaryColor,
      shape: StadiumBorder(),
      padding: EdgeInsets.symmetric(horizontal: 70,vertical: 12)),
      child: Text(text,style: TextStyle(fontSize: 22),),
      onPressed: onPressed,
    );
  
}