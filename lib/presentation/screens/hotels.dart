import 'package:cart_stepper/cart_stepper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:trip_wise/models/suggestion_autocomplete.dart';
import 'package:trip_wise/presentation/screens/web_view_screen.dart';
import 'package:trip_wise/presentation/widgets/search_delegate.dart';
import 'package:trip_wise/utils/show_snack_bar.dart';
import 'package:uuid/uuid.dart';
import 'package:trip_wise/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:numberpicker/numberpicker.dart';

class hotelBooking extends StatefulWidget {
  const hotelBooking({super.key});

  @override
  State<hotelBooking> createState() => _hotelBookingState();
}

class _hotelBookingState extends State<hotelBooking> {
  TextEditingController _locationController = TextEditingController();
  TextEditingController _checkInController = TextEditingController();
  TextEditingController _checkOutController = TextEditingController();
  late WebViewController controller;
  int _age = 1;
  int _adultCount = 0;
  int _childrenCount = 0;
  int _roomCount = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _age = 0;
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
                height: height * 0.10,
                margin: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                padding: const EdgeInsets.all(10.0),
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
                          fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                    CartStepperInt(
                      value: _roomCount,
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
                          fontSize: 18, fontWeight: FontWeight.w400),
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
                          fontSize: 18, fontWeight: FontWeight.w400),
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
              _childrenCount > 0
                  ? Container(
                      height: height * 0.35,
                      width: width,
                      margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Children Ages :',
                            style: GoogleFonts.nunito(
                                fontSize: 18, fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: height * 0.28,
                            width: width,
                            child: ListView.builder(
                              itemCount: _childrenCount,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  height: height * 0.07,
                                  width: width,
                                  margin:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 10),
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Child ${index + 1}",
                                          style: GoogleFonts.nunito(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        NumberPicker(
                                          value: _age,
                                          minValue: 0,
                                          maxValue: 12,
                                          step: 1,
                                          itemHeight: height * 0.05,
                                          itemWidth: width*0.2,
                                          axis: Axis.vertical,
                                          onChanged: (value) =>
                                              setState(() => _age = value),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            border: Border.all(
                                                color: Colors.black26),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  : const SizedBox.shrink(),
              FilledButton(
                onPressed: () {
                  if (_checkInController == null ||
                      _checkOutController == null ||
                      _locationController == null ||
                      _adultCount < 1 ||
                      _childrenCount < 0 ||
                      _roomCount < 1) {
                    showSnackBar(context, 'Please enter data for all fields');
                  }
                  controller = WebViewController()
                    ..loadRequest(
                      Uri.parse(
                          'https://www.momondo.in/hotel-search/${_locationController.text}-c8030/${_checkInController.text}/${_checkOutController.text}/${_adultCount}adults/${_childrenCount}children-2-3/${_roomCount}rooms?sort=rank_a'),
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
                  height: height * 0.07,
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Search Hotels',
                        style: GoogleFonts.nunito(
                            fontSize: 20, fontWeight: FontWeight.w400),
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
