import 'dart:ffi';

import 'package:cart_stepper/cart_stepper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:page_transition/page_transition.dart';
import 'package:trip_wise/models/suggestion_autocomplete.dart';
import 'package:trip_wise/presentation/screens/web_view_screen.dart';
import 'package:trip_wise/presentation/widgets/search_delegate.dart';
import 'package:trip_wise/services/places_autocomplete.dart';
import 'package:trip_wise/utils/show_snack_bar.dart';
import 'package:uuid/uuid.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:trip_wise/constants.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';

class fligthBooking extends StatefulWidget {
  final Suggestion destination;
  final String startDate;
  final String endDate;
  const fligthBooking({
    super.key,
    required this.destination,
    required this.startDate,
    required this.endDate,
  });

  @override
  State<fligthBooking> createState() => _fligthBookingState();
}

class _fligthBookingState extends State<fligthBooking> {
  TextEditingController _startDateController = TextEditingController();
  TextEditingController _endDateController = TextEditingController();
  TextEditingController _departureController = TextEditingController();
  TextEditingController _destinationController = TextEditingController();
  late WebViewController controller;
  int _adultCount = 0;
  int _childrenCount = 0;
  int _infantCount = 0;
  String _class = 'E';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _destinationController.text = widget.destination.apicode ?? "";
    _startDateController.text = widget.startDate;
    _endDateController.text = widget.endDate;
    _adultCount = 1;
    _childrenCount = 0;
    _infantCount = 0;
    _class = 'E';
    setState(() {});
  }

  bool _roundtrip = true;
  @override
  Widget build(BuildContext context) {
    Logger().d(widget.destination);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                    'Flights ',
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.w700,
                      fontSize: width * 0.12,
                    ),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const Icon(Icons.flight_takeoff, size: 30),
                ],
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                child: TextField(
                  onTap: () async {
                    // generate a new token here
                    final sessionToken = const Uuid().v4();
                    final Suggestion? result = await showSearch(
                      context: context,
                      delegate: AddressSearch(
                        sessionToken,
                        kSearchType.airportonly.toString(),
                      ),
                    );
                    // This will change the text displayed in the TextField
                    if (result != null) {
                      setState(() {
                        _departureController.text = result.apicode ?? "City";
                      });
                    }
                  },
                  controller: _departureController,
                  enabled: true,
                  readOnly: true,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunito(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    hintText: "Departing From",
                    hintStyle: GoogleFonts.nunito(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    suffixIcon: IconButton(
                      onPressed: _departureController.clear,
                      icon: const Icon(Icons.clear),
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
                margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                child: TextField(
                  onTap: () async {
                    // generate a new token here
                    final sessionToken = const Uuid().v4();
                    final Suggestion? result = await showSearch(
                      context: context,
                      delegate: AddressSearch(
                        sessionToken,
                        kSearchType.airportonly.toString(),
                      ),
                    );
                    // This will change the text displayed in the TextField
                    if (result != null) {
                      setState(() {
                        _destinationController.text = result.apicode ?? "City";
                      });
                    }
                  },
                  controller: _destinationController,
                  enabled: true,
                  readOnly: true,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunito(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    hintText: "Arriving To",
                    hintStyle: GoogleFonts.nunito(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    suffixIcon: IconButton(
                      onPressed: _departureController.clear,
                      icon: const Icon(Icons.clear),
                    ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 10,
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
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _roundtrip = false;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                        padding: const EdgeInsets.all(10.0),
                        width: width / 2.5,
                        height: height / 16,
                        decoration: BoxDecoration(
                          color: _roundtrip ? Colors.black38 : Colors.black87,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Text(
                          'One Way',
                          style: GoogleFonts.nunito(
                              fontSize: 16,
                              color: _roundtrip ? Colors.black54 : Colors.white,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _roundtrip = true;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                        padding: const EdgeInsets.all(10.0),
                        width: width / 2.5,
                        height: height / 16,
                        decoration: BoxDecoration(
                          color: _roundtrip ? Colors.black87 : Colors.black38,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Text(
                          'Round Trip',
                          style: GoogleFonts.nunito(
                              fontSize: 16,
                              color: _roundtrip ? Colors.white : Colors.black54,
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
              Container(
                width: width,
                margin: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 0),
                child: _roundtrip == true
                    ? Row(
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
                                      DateFormat('yyyy-MM-dd')
                                          .format(pickedDate);
                                  print(
                                      formattedDate); //formatted date output using intl package =>  2021-03-16
                                  setState(
                                    () {
                                      _startDateController.text =
                                          formattedDate; //set output date to TextField value.
                                    },
                                  );
                                } else {}
                              },
                              controller: _startDateController,
                              enabled: true,
                              readOnly: true,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.nunito(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                              ),
                              decoration: InputDecoration(
                                hintText: "Departure Date",
                                hintStyle: GoogleFonts.nunito(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
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
                                      DateFormat('yyyy-MM-dd')
                                          .format(pickedDate);
                                  print(
                                      formattedDate); //formatted date output using intl package =>  2021-03-16
                                  setState(
                                    () {
                                      _endDateController.text =
                                          formattedDate; //set output date to TextField value.
                                    },
                                  );
                                } else {}
                              },
                              controller: _endDateController,
                              enabled: true,
                              readOnly: true,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.nunito(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                              decoration: InputDecoration(
                                hintText: "Arrival Date",
                                hintStyle: GoogleFonts.nunito(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
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
                      )
                    : SizedBox(
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
                                  _startDateController.text =
                                      formattedDate; //set output date to TextField value.
                                },
                              );
                            } else {}
                          },
                          controller: _startDateController,
                          enabled: true,
                          readOnly: true,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.nunito(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                          decoration: InputDecoration(
                            hintText: "Departure Date",
                            hintStyle: GoogleFonts.nunito(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
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
                      'Adults :',
                      style: GoogleFonts.nunito(
                          fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    CartStepperInt(
                      value: _adultCount,
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
                      value: _childrenCount,
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
                width: width,
                height: 50,
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Infants :',
                      style: GoogleFonts.nunito(
                          fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    CartStepperInt(
                      value: _infantCount,
                      size: 25,
                      didChangeCount: (count) {
                        setState(() {
                          _infantCount = count;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Container(
                width: width,
                height: height * 0.12,
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Travel Class :',
                      style: GoogleFonts.nunito(
                          fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                    CustomRadioButton(
                      elevation: 0,
                      autoWidth: true,
                      enableShape: true,
                      unSelectedColor: Theme.of(context).canvasColor,
                      buttonLables: const [
                        'Business',
                        'Premium Economy',
                        'Economy',
                      ],
                      buttonTextStyle: ButtonTextStyle(
                        textStyle: GoogleFonts.nunito(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                      buttonValues: const [
                        'B',
                        'PE',
                        'E',
                      ],
                      radioButtonValue: (value) {
                        setState(() {
                          _class = value;
                        });
                      },
                      selectedColor: Colors.deepPurple,
                    ),
                  ],
                ),
              ),
              FilledButton(
                onPressed: () {
                  if (_departureController.text == '' ||
                      _destinationController.text == '' ||
                      _startDateController.text == '' ||
                      _endDateController.text == '' ||
                      _adultCount < 1 ||
                      _childrenCount < 0 ||
                      _infantCount < 0) {
                    showSnackBar(context, 'Please enter data for all fields');
                  }
                  controller = WebViewController()
                    ..loadRequest(
                      Uri.parse(
                          'https://www.makemytrip.com/flight/search?itinerary=${_departureController.text}-${_destinationController.text}-${DateFormat('dd/MM/yyyy').format(DateFormat('yyyy-MM-dd').parse(_startDateController.text))}_${_destinationController.text}-${_departureController.text}-${DateFormat('dd/MM/yyyy').format(DateFormat('yyyy-MM-dd').parse(_endDateController.text))}&tripType=R&paxType=A-${_adultCount}_C-${_childrenCount}_I-${_infantCount}&cabinClass=${_class}&ccde=IN&lang=eng'),
                    )
                    ..setJavaScriptMode(JavaScriptMode.unrestricted);
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.bottomToTop,
                      child: WebViewScreen(controller: controller),
                    ),
                  );
                },
                child: Container(
                  width: width * 0.5,
                  height: 50,
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Search Flights',
                        style: GoogleFonts.nunito(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                      const Icon(Icons.search, size: 22)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
