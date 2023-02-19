import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:trip_wise/constants.dart';
import 'package:trip_wise/models/suggestion_autocomplete.dart';
import 'package:trip_wise/presentation/screens/dest_details.dart';
import 'package:trip_wise/presentation/screens/login_screen.dart';
import 'package:trip_wise/presentation/screens/profile_screen.dart';
import 'package:trip_wise/presentation/widgets/search_delegate.dart';
import 'package:trip_wise/services/firebase_auth.dart';
import 'package:trip_wise/utils/show_snack_bar.dart';
import 'package:uuid/uuid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _startDateController = TextEditingController();
  TextEditingController _endDateController = TextEditingController();
  TextEditingController _destinationController = TextEditingController();
  late Suggestion? finalResult;
  String _quote =
      "Patience is the key to success, so wait while today's quote loads!";
  getQuote() async {
    Response response = await Dio().get("https://zenquotes.io/api/today");
    if (response.statusCode! > 199 && response.statusCode! < 300) {
      _quote = response.data[0]["q"];
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    getQuote();
  }

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    context.watch<User?>()!.reload();
    Logger().e(firebaseUser!.displayName);
    var size = MediaQuery.of(context).size;

    AlertDialog alert = AlertDialog(
      title: Text(
        "Log out?",
        style: GoogleFonts.nunito(),
      ),
      content: Text(
        "Are you sure you want to log out?",
        style: GoogleFonts.nunito(),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            "Cancel",
            style: GoogleFonts.nunito(),
          ),
        ),
        TextButton(
          onPressed: () async {
            await context.read<FirebaseAuthMethods>().signOut(context);
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
                (route) => false);
          },
          child: Text(
            "Continue",
            style: GoogleFonts.nunito(),
          ),
        ),
      ],
    );

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Hello there!\n${(firebaseUser?.displayName!.split(' ')[0]) ?? "Name"}",
                      style: GoogleFonts.nunito(
                        fontWeight: FontWeight.w700,
                        fontSize: 30,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (builder) => const ProfileScreen(),
                          ),
                        );
                      },
                      onDoubleTap: () {
                        showDialog(
                            context: context, builder: (builder) => alert);
                      },
                      child: Hero(
                        tag: "profile",
                        child: CircleAvatar(
                          radius: 40,
                          child: ClipOval(
                            child: Image.network(
                              firebaseUser!.photoURL!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                RichText(
                  text: TextSpan(
                    text: '"',
                    style: GoogleFonts.nunito(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                    children: [
                      TextSpan(
                        text: _quote,
                        style: GoogleFonts.nunito(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      TextSpan(
                        text: '"',
                        style: GoogleFonts.nunito(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                Container(
                  height: size.height * 0.5,
                  width: size.width,
                  child: Card(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.06),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Going on a trip?",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.nunito(
                              fontSize: 26,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          TextField(
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1950),
                                //DateTime.now() - not to allow to choose before today.
                                lastDate: DateTime(2100),
                              );

                              if (pickedDate != null) {
                                if (!pickedDate.isAfter(DateTime.now())) {
                                  showSnackBar(
                                      context, 'Date should be of the future');
                                  return;
                                }
                                print(
                                    pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                String formattedDate =
                                    DateFormat('yyyy-MM-dd').format(pickedDate);
                                print(
                                    formattedDate); //formatted date output using intl package =>  2021-03-16
                                setState(() {
                                  _startDateController.text =
                                      formattedDate; //set output date to TextField value.
                                });
                              } else {}
                            },
                            controller: _startDateController,
                            enabled: true,
                            readOnly: true,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.nunito(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            decoration: InputDecoration(
                              hintText: "Start Date",
                              hintStyle: GoogleFonts.nunito(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 4,
                                ),
                              ),
                            ),
                          ),
                          TextField(
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1950),
                                //DateTime.now() - not to allow to choose before today.
                                lastDate: DateTime(2100),
                              );

                              if (pickedDate != null) {
                                if (_startDateController.text != '' &&
                                    !pickedDate.isAfter(
                                      DateFormat('yyyy-MM-dd')
                                          .parse(_startDateController.text),
                                    )) {
                                  showSnackBar(context,
                                      'End Date should be after the start date');
                                  return;
                                }
                                print(
                                    pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                String formattedDate =
                                    DateFormat('yyyy-MM-dd').format(pickedDate);
                                print(
                                    formattedDate); //formatted date output using intl package =>  2021-03-16
                                setState(() {
                                  _endDateController.text =
                                      formattedDate; //set output date to TextField value.
                                });
                              } else {}
                            },
                            controller: _endDateController,
                            enabled: true,
                            readOnly: true,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.nunito(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            decoration: InputDecoration(
                              hintText: "End Date",
                              hintStyle: GoogleFonts.nunito(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 4,
                                ),
                              ),
                            ),
                          ),
                          TextField(
                            onTap: () async {
                              // generate a new token here
                              final sessionToken = const Uuid().v4();
                              final Suggestion? result = await showSearch(
                                context: context,
                                delegate: AddressSearch(
                                  sessionToken,
                                  kSearchType.cityonly.toString(),
                                ),
                              );
                              // This will change the text displayed in the TextField
                              if (result != null) {
                                setState(() {
                                  _destinationController.text =
                                      result.cityonly ?? "City";
                                  Logger().v(result);
                                  finalResult = result;
                                });
                              }
                            },
                            controller: _destinationController,
                            enabled: true,
                            readOnly: true,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.nunito(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            decoration: InputDecoration(
                              hintText: "Destination",
                              hintStyle: GoogleFonts.nunito(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 4,
                                ),
                              ),
                            ),
                          ),
                          FilledButton.tonal(
                            onPressed: () {
                              if (_startDateController.text == '' ||
                                  _endDateController.text == '' ||
                                  _destinationController.text == '') {
                                showSnackBar(
                                    context, "Please enter all the details");
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => cityDetails(
                                      city: finalResult!,
                                      startDate: _startDateController.text,
                                      endDate: _endDateController.text,
                                    ),
                                  ),
                                );
                                // _startDateController.clear();
                                // _endDateController.clear();
                                // _destinationController.clear();
                              }
                            },
                            child: Text(
                              "Start Trip",
                              style: GoogleFonts.nunito(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
