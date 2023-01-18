import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mysampleapp/constants/appcolor.dart';
import 'package:mysampleapp/firebase/authfirebase.dart';
import 'package:mysampleapp/views/page/home/home_page.dart';
import 'package:mysampleapp/views/page/login/login_page.dart';
import 'package:mysampleapp/views/page/widget/button_widget.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
    static String routeName = '/signup-email-password';

  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool passenable = true;
  bool passenable1 = true;
  final RegExp _password =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

  bool validatePassword(String pass) {
    String password = pass.trim();
    if (_password.hasMatch(password)) {
      return true;
    } else {
      return false;
    }
  }

  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailid = TextEditingController();
  final TextEditingController password = TextEditingController();
void signUpUser() async {
    context.read<FirebaseAuthMethods>().signUpWithEmail(
          email: emailid.text,
          password: password.text,
          context: context,
        );
         Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const HomePage()));

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/image/background.png"),
                fit: BoxFit.cover)),
        padding: const EdgeInsets.only(
          top: 70,
          left: 38,
          right: 38,
        ),
        //padding: const EdgeInsets.all(38.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Column(
                children: const <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Hey There , Welcome  ',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Fill the Details to Create an Account ',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Container(
                    height: 500,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      border: Border.all(width: 2, color: Colors.white30),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           const SizedBox(height: 10),
                          const Text(
                            "EmailID",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            controller: emailid,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 10),
                              hintText: "Enter your EmailID",
                              hintStyle:
                                  const TextStyle(color: Colors.white60),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: const BorderSide(),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'EmailId is Required';
                              }
                              if (!EmailValidator.validate(value, true)) {
                                return 'Enter Valid EmailId ';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Password",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                              controller: password,
                              obscureText: passenable,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 10),
                                hintText: "Enter your Password",
                                hintStyle:
                                    const TextStyle(color: Colors.white60),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        if (passenable) {
                                          passenable = false;
                                        } else {
                                          passenable = true;
                                        }
                                      });
                                    },
                                    icon: Icon(passenable == true
                                        ? Icons.visibility
                                        : Icons.visibility_off)),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: const BorderSide(),
                                ),
                              ),
                              /* validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Password is Required';
                                }
                                if (value.length < 8) {
                                  return 'Please enter password of atleast 8 word';
                                } else {
                                  bool result = validatePassword(value);
                                  if (result) {
                                    return null;
                                  } else {
                                    return 'Please enter small, capital , special cass , number ';
                                  }
                                }
                              } */),
                           const SizedBox(
                            height: 25,
                          ),
                          SizedBox(
                            width: 290,
                            child: ButtonWidget(
                              text: "Create Account",
                              onPressed: () {
                                _formKey.currentState!.save();
                                if (_formKey.currentState!.validate()) {
                                 signUpUser();

                                  Map userRegisterData = {
                                    "email": emailid.text,
                                    "password": password.text,
                                  };
                                  print("userRegisterData $userRegisterData");
                                }
                              },
                            ),
                          ),
                          const SizedBox(height: 10),
                          Center(
                            child: RichText(
                              text: TextSpan(
                                  text: 'Already having an Acount?',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: AppColor.primaryColor,
                                      fontFamily: GoogleFonts.akayaKanadaka()
                                          .fontFamily),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: ' Login',
                                        style: const TextStyle(
                                            color: AppColor.primaryColorDark,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const LoginPage()));
                                          })
                                  ]),
                            ),
                          )
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
