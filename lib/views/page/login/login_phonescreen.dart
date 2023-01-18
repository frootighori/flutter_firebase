import 'package:flutter/material.dart';
import 'package:mysampleapp/firebase/authfirebase.dart';
import 'package:mysampleapp/views/page/widget/button_widget.dart';
import 'package:provider/provider.dart';

class PhoneScreen extends StatefulWidget {
  static String routeName = '/phone';
  const PhoneScreen({Key? key}) : super(key: key);

  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  final TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            const Text(
              "Phone Number",
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w400, color: Colors.deepPurple),
            ),
            const SizedBox(height: 10),
            TextFormField(
              style: const TextStyle(
                color: Colors.deepPurple,
              ),
              keyboardType: TextInputType.phone,
              controller: phoneController,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                hintText: "Enter your Phone Number",
                hintStyle: const TextStyle(color: Colors.deepPurple),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: const BorderSide(),
                ),
              ),
            ),
            const SizedBox(height: 15,),
            ButtonWidget(
              onPressed: () {
                context
                    .read<FirebaseAuthMethods>()
                    .phoneSignIn(context, phoneController.text);
              },
              text: 'OK',
            ),
          ],
        ),
      ),
    );
  }
}
