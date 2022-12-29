import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mysampleapp/firebase/signinwithgoogle.dart';
import 'package:provider/provider.dart';

class afterloggedin extends StatefulWidget {
  const afterloggedin({super.key});

  @override
  State<afterloggedin> createState() => _afterloggedinState();
}

class _afterloggedinState extends State<afterloggedin> {

  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('signed in with account : '+user.email!),
          SizedBox(height: 15,),
          TextButton(onPressed: () {
                                    final provider =Provider.of<GoogleSignInProvider>(context,listen:false);
                                      provider.googlelogout();
                                  }, child:Text('Logout') )
        ],
      ),),
    );
  }
}