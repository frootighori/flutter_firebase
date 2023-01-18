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
      shape: const StadiumBorder(),
      padding: const EdgeInsets.symmetric(horizontal: 70,vertical: 12)),
      onPressed: onPressed,
      child: Text(text,style: const TextStyle(fontSize: 22),),
    );
  
}