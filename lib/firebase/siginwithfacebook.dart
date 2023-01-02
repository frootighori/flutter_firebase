import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class facebooksignin extends StatefulWidget {
  const facebooksignin({super.key});

  @override
  State<facebooksignin> createState() => _facebooksigninState();
}

class _facebooksigninState extends State<facebooksignin> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
class Facebooksignin {
 Future<void> signInWithFacebook (BuildContext context) async{
  try{
      final LoginResult loginResult = await FacebookAuth.instance.login();

        final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);
        await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);

  }on FirebaseAuthException catch (e){
      print(e.toString()); 

  }
 }
}