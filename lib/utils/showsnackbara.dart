import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String text) {
  print("firebase snackbar");
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  ); 
}