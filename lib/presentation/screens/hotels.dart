import 'package:cart_stepper/cart_stepper.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:trip_wise/models/suggestion_autocomplete.dart';
import 'package:trip_wise/presentation/widgets/search_delegate.dart';
import 'package:trip_wise/services/places_autocomplete.dart';
import 'package:uuid/uuid.dart';
import 'package:trip_wise/constants.dart';

class hotelBooking extends StatefulWidget {
  const hotelBooking({super.key});

  @override
  State<hotelBooking> createState() => _hotelBookingState();
}

class _hotelBookingState extends State<hotelBooking> {
  TextEditingController _locationController = TextEditingController();
  TextEditingController _checkInController = TextEditingController();
  TextEditingController _checkOutController = TextEditingController();
  var _residingType = null;
  var _adultCount = 0;
  var _childrenCount = 0;
  var _roomCount = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _residingType = null;
    _adultCount = 1;
    _childrenCount = 0;
    _roomCount = 1;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Hotels ',
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.w700,
                    fontSize: width * 0.12,
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                const Icon(FontAwesomeIcons.building, size: 45),
              ],
            ),
            Container(
              width: width,
              height: height * 0.07,
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: CustomRadioButton(
                elevation: 0,
                autoWidth: true,
                absoluteZeroSpacing: true,
                unSelectedColor: Theme.of(context).canvasColor,
                buttonLables: const ['All Stays', 'Hotels', 'House/Apartment'],
                buttonTextStyle: ButtonTextStyle(
                    textStyle: GoogleFonts.nunito(
                        fontSize: 18, fontWeight: FontWeight.w400)),
                buttonValues: const ['All Stays', 'Hotels', 'House/Apartment'],
                /*buttonTextStyle: const ButtonTextStyle(
                    selectedColor: Colors.white,
                    unSelectedColor: Colors.black,
                    textStyle: TextStyle(fontSize: 16)),
                */
                radioButtonValue: (value) {
                  setState(() {
                    _residingType = value;
                    print('$_residingType');
                  });
                },
                selectedColor: Theme.of(context).accentColor,
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(15, 10, 15, 0),
              padding: EdgeInsets.all(10.0),
              child: TextField(
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
                      _locationController.text = result.cityonly ?? "Hotel";
                    });
                  }
                },
                controller: _locationController,
                enabled: true,
                readOnly: true,
                textAlign: TextAlign.center,
                style: GoogleFonts.nunito(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  hintText: "Choose Location",
                  hintStyle: GoogleFonts.nunito(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  suffixIcon: IconButton(
                    onPressed: _locationController.clear,
                    icon: const Icon(FontAwesomeIcons.locationDot),
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 4,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: width,
              margin: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 170,
                    height: 50,
                    child: TextField(
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
                          setState(
                            () {
                              _checkInController.text =
                                  formattedDate; //set output date to TextField value.
                            },
                          );
                        } else {}
                      },
                      controller: _checkInController,
                      enabled: true,
                      readOnly: true,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.nunito(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: InputDecoration(
                        hintText: "Check In",
                        hintStyle: GoogleFonts.nunito(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.calendar_month),
                        ),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 4,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 170,
                    height: 50,
                    child: TextField(
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
                          setState(
                            () {
                              _checkOutController.text =
                                  formattedDate; //set output date to TextField value.
                            },
                          );
                        } else {}
                      },
                      controller: _checkOutController,
                      enabled: true,
                      readOnly: true,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.nunito(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: InputDecoration(
                        hintText: "Check Out",
                        hintStyle: GoogleFonts.nunito(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.calendar_month),
                        ),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 4,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: width,
              height: 50,
              margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Rooms :',
                    style: GoogleFonts.nunito(
                        fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  CartStepperInt(
                    count: _roomCount,
                    size: 25,
                    didChangeCount: (count) {
                      setState(() {
                        _roomCount = count;
                      });
                    },
                  ),
                ],
              ),
            ),
            Container(
              width: width,
              height: 50,
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Adults :',
                    style: GoogleFonts.nunito(
                        fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  CartStepperInt(
                    count: _adultCount,
                    size: 25,
                    didChangeCount: (count) {
                      setState(() {
                        _adultCount = count;
                      });
                    },
                  ),
                ],
              ),
            ),
            Container(
              width: width,
              height: 50,
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Children :',
                    style: GoogleFonts.nunito(
                        fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  CartStepperInt(
                    count: _childrenCount,
                    size: 25,
                    didChangeCount: (count) {
                      setState(() {
                        _childrenCount = count;
                      });
                    },
                  ),
                ],
              ),
            ),
            Container(
              height: height / 6,
              width: width,
              margin: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    FontAwesomeIcons.filter,
                    size: 26,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: width / 1.2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                print('clicked2');
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10.0),
                                width: width / 4,
                                height: height / 20,
                                decoration: BoxDecoration(
                                  color: Colors.black87,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Text(
                                  'Popular',
                                  style: GoogleFonts.nunito(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                print('clicked1');
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10.0),
                                width: width / 4,
                                height: height / 20,
                                decoration: BoxDecoration(
                                  color: Colors.black38,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Text(
                                  'Price',
                                  style: GoogleFonts.nunito(
                                      fontSize: 14,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                print('clicked1');
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10.0),
                                width: width / 4,
                                height: height / 20,
                                decoration: BoxDecoration(
                                  color: Colors.black38,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Text(
                                  'Ratings',
                                  style: GoogleFonts.nunito(
                                      fontSize: 14,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: width / 1.2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                print('clicked2');
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10.0),
                                width: width / 4,
                                height: height / 20,
                                decoration: BoxDecoration(
                                  color: Colors.black38,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Text(
                                  'Start',
                                  style: GoogleFonts.nunito(
                                      fontSize: 14,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                print('clicked1');
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10.0),
                                width: width / 4,
                                height: height / 20,
                                decoration: BoxDecoration(
                                  color: Colors.black38,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Text(
                                  'Location',
                                  style: GoogleFonts.nunito(
                                      fontSize: 14,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                print('clicked1');
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10.0),
                                width: width / 4,
                                height: height / 20,
                                decoration: BoxDecoration(
                                  color: Colors.black38,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Text(
                                  'CheckIn',
                                  style: GoogleFonts.nunito(
                                      fontSize: 14,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
