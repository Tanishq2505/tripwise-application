import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:trip_wise/presentation/screens/dest_details.dart';
import 'package:trip_wise/presentation/widgets/search_delegate.dart';
import 'package:trip_wise/services/places_autocomplete.dart';
import 'package:uuid/uuid.dart';

class fligthBooking extends StatefulWidget {
  const fligthBooking({super.key});

  @override
  State<fligthBooking> createState() => _fligthBookingState();
}

class _fligthBookingState extends State<fligthBooking> {
  TextEditingController _startDateController = TextEditingController();
  TextEditingController _endDateController = TextEditingController();
  TextEditingController _departureController = TextEditingController();
  TextEditingController _destinationController = TextEditingController();

  bool _bothdate = true;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: height * 0.03,
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 25),
                  height: height / 15,
                  width: width,
                  child: Row(
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
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                  child: TextField(
                    onTap: () async {
                      // generate a new token here
                      final sessionToken = const Uuid().v4();
                      final Suggestion? result = await showSearch(
                        context: context,
                        delegate: AddressSearch(sessionToken),
                      );
                      // This will change the text displayed in the TextField
                      if (result != null) {
                        setState(() {
                          _departureController.text = result.description;
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
                        delegate: AddressSearch(sessionToken),
                      );
                      // This will change the text displayed in the TextField
                      if (result != null) {
                        setState(() {
                          _destinationController.text = result.description;
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
                  margin: const EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _bothdate = false;
                          print('clicked1');
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          width: width / 2.5,
                          height: height / 16,
                          decoration: BoxDecoration(
                            color: Colors.black38,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Text(
                            'One Way',
                            style: GoogleFonts.nunito(
                                fontSize: 22,
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
                          _bothdate = true;
                          print('clicked2');
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          width: width / 2.5,
                          height: height / 16,
                          decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Text(
                            'Round Trip',
                            style: GoogleFonts.nunito(
                                fontSize: 22,
                                color: Colors.white,
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
                  height: height / 8,
                  margin: const EdgeInsets.all(10.0),
                  child: _bothdate
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 155,
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
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
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
                              width: 155,
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
                                  fontSize: 14,
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
                          width: 175,
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
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
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
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: width,
                height: height / 3,
                decoration: const BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
