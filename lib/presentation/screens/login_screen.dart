import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:trip_wise/constants.dart';
import 'package:trip_wise/presentation/screens/home_screen.dart';
import 'package:trip_wise/presentation/screens/signup_screen.dart';
import 'package:trip_wise/services/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _hidden = true;
  bool _loading = false;
  @override
  Widget build(BuildContext context) {
    FirebaseAuthMethods methods = context.read<FirebaseAuthMethods>();
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: _loading,
          child: Center(
            child: Container(
              height: size.height * 0.7,
              width: size.width * 0.9,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 5,
                  color: Color(0xffbababa),
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      transform: Matrix4.translationValues(
                          0, -(size.height * 0.09), 0),
                      margin: EdgeInsets.zero,
                      child: CircleAvatar(
                        foregroundColor: Colors.grey,
                        backgroundColor: Colors.grey,
                        radius: size.width * 0.15,
                        child: ClipOval(
                          child: Placeholder(),
                        ),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: size.height * 0.07,
                        ),
                        Text(
                          "Welcome!",
                          style: GoogleFonts.nunito(
                            fontSize: size.width * 0.1,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              buildTextInput(
                                  _emailController,
                                  "Enter your email",
                                  TextInputType.emailAddress,
                                  false, (val) {
                                if (val == null) {
                                  return "Please enter your email";
                                }
                                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                    .hasMatch(val)) {
                                  return "Please enter valid email";
                                }
                                return null;
                              }, null),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              buildTextInput(
                                _passwordController,
                                "Enter your password",
                                TextInputType.visiblePassword,
                                _hidden,
                                (val) {},
                                IconButton(
                                  onPressed: () {
                                    _hidden = !_hidden;
                                    setState(() {});
                                  },
                                  icon: Icon(
                                    (_hidden)
                                        ? CupertinoIcons.eye
                                        : CupertinoIcons.eye_slash,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xffbababa),
                                  padding: EdgeInsets.symmetric(
                                    vertical: 8,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    setState(() {
                                      _loading = true;
                                    });
                                    await methods.loginWithEmail(
                                      email: _emailController.text,
                                      password: _passwordController.text,
                                      context: context,
                                    );
                                    setState(() {
                                      _loading = false;
                                    });
                                  }
                                },
                                child: Text(
                                  "Login",
                                  style: GoogleFonts.nunito(
                                    fontSize: 26,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        InkWell(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (builder) => SignUpScreen(),
                            ),
                          ),
                          child: RichText(
                            text: TextSpan(
                                text: "Don't have an account? ",
                                style: GoogleFonts.nunito(
                                  fontSize: size.width * 0.04,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                                children: [
                                  TextSpan(
                                    text: "Sign Up",
                                    style: GoogleFonts.nunito(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  TextSpan(
                                    text: " now.",
                                  ),
                                ]),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.04,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey.shade50,
                            elevation: 0,
                            padding: EdgeInsets.symmetric(
                              vertical: 8,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(
                                color: Color(0xffbababa),
                                width: 2,
                              ),
                            ),
                          ),
                          onPressed: () async {
                            _loading = true;
                            setState(() {});
                            await context
                                .read<FirebaseAuthMethods>()
                                .signInWithGoogle(context);
                            _loading = false;
                            setState(() {});
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ),
                              (route) => false,
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Sign in using Google",
                                style: GoogleFonts.nunito(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              Container(
                                width: size.width * 0.08,
                                child: Image.network(
                                  'http://pngimg.com/uploads/google/google_PNG19635.png',
                                  color: Colors.black,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  buildTextInput(
    TextEditingController textEditingController,
    String hintText,
    TextInputType textInputType,
    bool hidden,
    String? Function(String?) validate,
    Widget? suffixIcon,
  ) {
    return TextFormField(
      controller: textEditingController,
      validator: validate,
      keyboardType: textInputType,
      obscureText: hidden,
      decoration: kInputTextDecoration.copyWith(
        hintText: hintText,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
