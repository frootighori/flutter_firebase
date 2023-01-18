import 'package:flutter/material.dart';
import 'package:mysampleapp/firebase/authfirebase.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

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
                  context.read<FirebaseAuthMethods>().deleteAccount(context);
                  },
                  child: const Text('deleteaccount')),
                  const SizedBox(height: 15),
                   TextButton(
                  onPressed: () {              
                    context.read<FirebaseAuthMethods>().signOut(context);
                  },
                  child: const Text('signout')),
            ]
            )
            )
            );
  }
}
