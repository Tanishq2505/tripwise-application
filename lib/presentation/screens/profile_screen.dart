import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:trip_wise/constants.dart';
import 'package:trip_wise/utils/show_snack_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _emailReadOnly = true;
  bool _phoneReadOnly = true;
  bool _cityReadOnly = true;
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    var size = MediaQuery.of(context).size;

    TextEditingController emailController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController cityController = TextEditingController();

    emailController.text = firebaseUser!.email.toString();
    phoneController.text = firebaseUser.phoneNumber.toString();

    return Scaffold(
      backgroundColor: const Color(0xffbababa),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      CupertinoIcons.arrow_left,
                      color: Colors.black,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.settings,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.07,
              ),
              Text(
                firebaseUser.displayName!.toString(),
                textAlign: TextAlign.center,
                style: GoogleFonts.nunito(
                  fontSize: size.width * 0.09,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: size.height * 0.17,
              ),
              Stack(
                children: [
                  Container(
                    width: size.width,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24.0,
                        vertical: 16,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: size.height * 0.06,
                          ),
                          buildTextInput(
                            emailController,
                            "Email",
                            TextInputType.emailAddress,
                            false,
                            (p0) => null,
                            null,
                            _emailReadOnly,
                            () {
                              if (_emailReadOnly) {
                                _emailReadOnly = !_emailReadOnly;
                                setState(() {});
                              } else {
                                _emailReadOnly = !_emailReadOnly;
                                setState(() {});
                                showSnackBar(
                                    context, "Cannot change google email.");
                              }
                            },
                          ),
                          buildTextInput(
                            phoneController,
                            "Phone",
                            TextInputType.phone,
                            false,
                            (p0) => null,
                            null,
                            _phoneReadOnly,
                            () {
                              if (_phoneReadOnly) {
                                _phoneReadOnly = !_phoneReadOnly;
                                setState(() {});
                              } else {
                                _phoneReadOnly = !_phoneReadOnly;
                                setState(() {});
                              }
                            },
                          ),
                          buildTextInput(
                            cityController,
                            "City",
                            TextInputType.phone,
                            false,
                            (p0) => null,
                            null,
                            _cityReadOnly,
                            () {
                              if (_cityReadOnly) {
                                _cityReadOnly = !_cityReadOnly;
                                setState(() {});
                              } else {
                                _cityReadOnly = !_cityReadOnly;
                                setState(() {});
                              }
                            },
                          ),
                          SizedBox(
                            height: size.height * 0.288,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      transform:
                          Matrix4.translationValues(0, -(size.height * 0.1), 0),
                      margin: EdgeInsets.zero,
                      child: Hero(
                        tag: "profile",
                        child: CircleAvatar(
                          radius: size.width * 0.2,
                          child: ClipOval(
                            child: Image.network(
                              firebaseUser.photoURL!,
                              fit: BoxFit.cover,
                              scale: 0.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
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
    bool readOnly,
    void Function()? onEdit,
  ) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: TextFormField(
            controller: textEditingController,
            validator: validate,
            keyboardType: textInputType,
            obscureText: hidden,
            readOnly: readOnly,
            decoration: kInputTextDecoration.copyWith(
              hintText: hintText,
              suffixIcon: suffixIcon,
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: Color(0xffb2b1b1),
                ),
              ),
              errorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: Color(0xffb2b1b1),
                ),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: Color(0xff6f6f6f),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: IconButton(
            onPressed: onEdit,
            icon: Icon(
              (readOnly) ? Icons.edit : Icons.check,
              color: Colors.red.shade400,
            ),
          ),
        )
      ],
    );
  }
}
