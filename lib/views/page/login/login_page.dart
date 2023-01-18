import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mysampleapp/constants/appcolor.dart';
import 'package:mysampleapp/firebase/authfirebase.dart';
import 'package:mysampleapp/views/page/home/home_page.dart';
import 'package:mysampleapp/views/page/login/login_phonescreen.dart';
import 'package:mysampleapp/views/page/register/register.dart';
import 'package:mysampleapp/views/page/widget/button_widget.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  static String routeName = '/login-email-password';

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isHidden = true;

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

  @override
  void dispose() {
    emailid.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
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
          child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                Column(
                  children: const <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Hey There , Welcome Back ',
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
                        'Login to your account to Continue! ',
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
                      height: 700,
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
                            Expanded(
                              flex: 0,
                              child: TextFormField(
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
                            Expanded(
                              flex: 0,
                              child: TextFormField(
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                                controller: password,
                                obscureText: _isHidden,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 10),
                                  hintText: "Enter your Password",
                                  hintStyle:
                                      const TextStyle(color: Colors.white60),
                                  suffixIcon: InkWell(
                                    onTap: _togglePasswordView,
                                    child: Icon(
                                      _isHidden
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                  ),
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
                                  } */
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Center(
                              child: SizedBox(
                                width: 260,
                                child: ButtonWidget(
                                  text: "Login",
                                  onPressed: () {
                                    _formKey.currentState!.save();
                                    if (_formKey.currentState!.validate()) {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const HomePage()));

                                      Map userRegisterData = {
                                        "email": emailid.text,
                                        "password": password.text,
                                      };
                                      print(
                                          "userRegisterData $userRegisterData");
                                    }
                                  },
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Forget Password',
                                    style: TextStyle(
                                        color: AppColor.primaryColorDark,
                                        fontSize: 18),
                                  )),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: MaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                color: AppColor.primaryColor,
                                elevation: 10,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 30.0,
                                      width: 30.0,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/image/googleicon.png'),
                                            fit: BoxFit.cover),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    const Text("Sign In with Google")
                                  ],
                                ),
                                onPressed: () {
                                  context
                                      .read<FirebaseAuthMethods>()
                                      .signInWithGoogle(context);
                                },
                              ),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: MaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                color: AppColor.primaryColor,
                                elevation: 10,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 30.0,
                                      width: 30.0,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/image/facebook.png'),
                                            fit: BoxFit.cover),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    const Text("Sign In with Facebook")
                                  ],
                                ),
                                onPressed: () {
                                  context
                                      .read<FirebaseAuthMethods>()
                                      .signInWithFacebook(context);
                                },
                              ),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: MaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                color: AppColor.primaryColor,
                                elevation: 10,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 30.0,
                                      width: 30.0,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                              'assets/image/phone.png',
                                            ),
                                            fit: BoxFit.cover),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    const Text("Sign In with Phone number")
                                  ],
                                ),
                                onPressed: () {
                                Navigator.pushNamed(context, PhoneScreen.routeName);

                                },
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(children: <Widget>[
                              Expanded(
                                child:  Container(
                                    margin: const EdgeInsets.only(
                                        left: 10.0, right: 15.0),
                                    child: const Divider(
                                      color: Color.fromARGB(196, 106, 76, 255),
                                      thickness: 1,
                                      height: 50,
                                    )),
                              ),
                              const Text("OR",style: TextStyle(color: AppColor.primaryColorDark,fontSize: 20),),
                              Expanded(
                                child:  Container(
                                    margin: const EdgeInsets.only(
                                        left: 15.0, right: 10.0),
                                    child: const Divider(
                                      color: Color.fromARGB(196, 106, 76, 255),
                                      thickness: 1,
                                      height: 50,
                                    )),
                              ),
                            ]),
                            const SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: RichText(
                                text: TextSpan(
                                    text: 'Dont have an Acount?',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: AppColor.primaryColor,
                                        fontFamily:
                                            GoogleFonts.akayaKanadaka()
                                                .fontFamily),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: ' SignUp',
                                          style: const TextStyle(
                                              color:
                                                  AppColor.primaryColorDark,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const RegisterPage()));
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

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
