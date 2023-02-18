import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:trip_wise/constants.dart';
import 'package:trip_wise/models/suggestion_autocomplete.dart';
import 'package:trip_wise/presentation/widgets/search_delegate.dart';
import 'package:trip_wise/services/places_autocomplete.dart';
import 'package:uuid/uuid.dart';

class TrainBooking extends StatefulWidget {
  const TrainBooking({Key? key}) : super(key: key);

  @override
  State<TrainBooking> createState() => _TrainBookingState();
}

class _TrainBookingState extends State<TrainBooking> {
  final TextEditingController _startPlaceController = TextEditingController();
  final TextEditingController _destinationController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();

  int _trip = 1;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
            height: size.height,
            width: size.width - 40,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Trains",
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.w700,
                          fontSize: size.width * 0.12,
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.06,
                      ),
                      FaIcon(
                        FontAwesomeIcons.train,
                        size: size.width * 0.1,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  TextField(
                    onTap: () async {
                      // generate a new token here
                      final sessionToken = Uuid().v4();
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
                          _startPlaceController.text =
                              result.cityonly ?? "City";
                        });
                      }
                    },
                    controller: _startPlaceController,
                    enabled: true,
                    readOnly: true,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.nunito(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      hintText: "Departing From",
                      hintStyle: GoogleFonts.nunito(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 4,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  TextField(
                    onTap: () async {
                      // generate a new token here
                      final sessionToken = Uuid().v4();
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
                        });
                      }
                    },
                    controller: _destinationController,
                    enabled: true,
                    readOnly: true,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.nunito(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      hintText: "Destination",
                      hintStyle: GoogleFonts.nunito(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 4,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  SizedBox(
                    height: size.height * 0.1,
                    width: size.width - 40,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              _trip = 1;
                              setState(() {});
                            },
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 250),
                              height: size.height * 0.09,
                              decoration: BoxDecoration(
                                color: (_trip == 1)
                                    ? Colors.black
                                    : Color(0xffD9D9D9),
                                borderRadius: BorderRadius.circular(
                                  16,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.05,
                                ),
                                child: Center(
                                  child: Text(
                                    "All",
                                    style: GoogleFonts.nunito(
                                      fontSize: size.width * 0.07,
                                      fontWeight: FontWeight.w600,
                                      color: (_trip == 1)
                                          ? Color(0xffFCFAFA)
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.04,
                          ),
                          InkWell(
                            onTap: () {
                              _trip = 2;
                              setState(() {});
                            },
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 250),
                              height: size.height * 0.09,
                              decoration: BoxDecoration(
                                color: (_trip == 2)
                                    ? Colors.black
                                    : Color(0xffD9D9D9),
                                borderRadius: BorderRadius.circular(
                                  16,
                                ),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.05,
                                  ),
                                  child: Text(
                                    "CC",
                                    style: GoogleFonts.nunito(
                                      fontSize: size.width * 0.07,
                                      fontWeight: FontWeight.w600,
                                      color: (_trip == 2)
                                          ? Color(0xffFCFAFA)
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.04,
                          ),
                          InkWell(
                            onTap: () {
                              _trip = 3;
                              setState(() {});
                            },
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 250),
                              height: size.height * 0.09,
                              decoration: BoxDecoration(
                                color: (_trip == 3)
                                    ? Colors.black
                                    : Color(0xffD9D9D9),
                                borderRadius: BorderRadius.circular(
                                  16,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.05,
                                ),
                                child: Center(
                                  child: Text(
                                    "2AC",
                                    style: GoogleFonts.nunito(
                                      fontSize: size.width * 0.07,
                                      fontWeight: FontWeight.w600,
                                      color: (_trip == 3)
                                          ? Color(0xffFCFAFA)
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.04,
                          ),
                          InkWell(
                            onTap: () {
                              _trip = 4;
                              setState(() {});
                            },
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 250),
                              height: size.height * 0.09,
                              decoration: BoxDecoration(
                                color: (_trip == 4)
                                    ? Colors.black
                                    : Color(0xffD9D9D9),
                                borderRadius: BorderRadius.circular(
                                  16,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.05,
                                ),
                                child: Center(
                                  child: Text(
                                    "3AC",
                                    style: GoogleFonts.nunito(
                                      fontSize: size.width * 0.07,
                                      fontWeight: FontWeight.w600,
                                      color: (_trip == 4)
                                          ? Color(0xffFCFAFA)
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
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
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 4,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  FilledButton(
                      onPressed: () {},
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: size.height * 0.02,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Search",
                              style: GoogleFonts.nunito(
                                fontSize: size.width * 0.08,
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.04,
                            ),
                            Icon(
                              Icons.search,
                              size: size.width * 0.08,
                            ),
                          ],
                        ),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
