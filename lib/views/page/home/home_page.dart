import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mysampleapp/firebase/signinwithgoogle.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('WELCOME PAGE'),
          actions: [],
        ),
        body: Center(
            child: Container(
              
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center
            ,children: [
            Text(' WELCOME TO MYAPP'),
            TextButton(
                onPressed: () {
                  final provider =
                      Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.googlelogout(); 
                },
                child: Text('Logout'))
          ]),
        )));
  }
}
