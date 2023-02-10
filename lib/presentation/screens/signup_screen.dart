import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:trip_wise/constants.dart';
import 'package:trip_wise/presentation/screens/home_screen.dart';
import 'package:trip_wise/services/firebase_auth.dart';
import 'package:trip_wise/utils/show_snack_bar.dart';

class SignUpScreen extends StatefulWidget {
  static String routeName = '/signup-email-password';
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> with ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confPasswordController = TextEditingController();

  bool _hidden = true;

  void signUpUser() async {
    if (!formKey.currentState!.validate()) {
      showSnackBar(context, "Enter all values");
      return;
    }
    await context.read<FirebaseAuthMethods>().signUpWithEmail(
          email: emailController.text,
          password: passwordController.text,
          context: context,
        );
    final firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser == null) return;
    await firebaseUser.updateDisplayName(nameController.text);
    await firebaseUser.updatePhotoURL(
      'https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_1280.png',
    );
    notifyListeners();
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (builder) => HomeScreen(),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.85,
          width: MediaQuery.of(context).size.width * 0.9,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(
              width: 5,
              color: Color(0xffbababa),
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 30),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: nameController,
                        hintText: 'Enter your name',
                        textInputType: TextInputType.name,
                        validate: (val) {
                          if (val == null) {
                            return "Please enter your name";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        controller: emailController,
                        hintText: 'Enter your email',
                        textInputType: TextInputType.emailAddress,
                        validate: (val) {
                          if (val == null) {
                            return "Please enter your email";
                          }
                          if (!RegExp('^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}')
                              .hasMatch(val)) {
                            return "Please enter valid email";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        controller: phoneController,
                        hintText: 'Enter your phone number',
                        textInputType: TextInputType.phone,
                        validate: (val) {
                          if (val == null) {
                            return "Please enter your phone number";
                          }
                          if (!RegExp(
                                  r'^(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]\d{3}[\s.-]\d{4}$')
                              .hasMatch(val)) {
                            return "Please enter valid phone number";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        controller: passwordController,
                        hintText: 'Enter your password',
                        hidden: _hidden,
                        textInputType: TextInputType.visiblePassword,
                        suffixIcon: IconButton(
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
                      const SizedBox(height: 20),
                      CustomTextField(
                        controller: confPasswordController,
                        hintText: 'Confirm your password',
                        hidden: _hidden,
                        validate: (val) {
                          if (val == null) {
                            return "Enter password";
                          }
                          if (val != passwordController.text) {
                            return "Enter same password";
                          }
                          return null;
                        },
                        textInputType: TextInputType.visiblePassword,
                        suffixIcon: IconButton(
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
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: signUpUser,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                    textStyle: MaterialStateProperty.all(
                      const TextStyle(color: Colors.white),
                    ),
                    minimumSize: MaterialStateProperty.all(
                      Size(MediaQuery.of(context).size.width / 2.5, 50),
                    ),
                  ),
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool hidden;
  FormFieldValidator? validate;
  TextInputType? textInputType;
  Widget? suffixIcon;

  CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.hidden = false,
    this.validate,
    this.textInputType,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
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
