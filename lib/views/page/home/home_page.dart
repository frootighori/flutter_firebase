import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:mysampleapp/firebase/authfirebase.dart';
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
    final user = context.read<FirebaseAuthMethods>().user;

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('WELCOME PAGE'),
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center
              ,children: [
              const Text(' WELCOME TO MYAPP'),
              TextButton(
                  onPressed: () {
                    final provider =
                        Provider.of<GoogleSignInProvider>(context, listen: false);
                    provider.googlelogout(); 
                  },
                  child: const Text('Logout with google')),


                  TextButton(
                  onPressed: () {
                    final provider =
                        Provider.of<GoogleSignInProvider>(context, listen: false);
                    provider.facebooklogout(); 
                  },
                  child: const Text('Logout with facebook')),
                   TextButton(
                  onPressed: () {
                  context.read<FirebaseAuthMethods>().deleteAccount(context);

                  },
                  child: const Text('deleteaccount')),
                   TextButton(
                  onPressed: () {              
                    context.read<FirebaseAuthMethods>().signOut(context);

                  },
                  child: const Text('signout')),



            ])));
  }
  
 Future<void>signOutWithFacebook (BuildContext context) async{
await FacebookAuth.instance.logOut();
 }
}
