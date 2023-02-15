import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trip_wise/presentation/screens/dest_details.dart';

class trainBooking extends StatefulWidget {
  const trainBooking({super.key});

  @override
  State<trainBooking> createState() => _trainBookingState();
}

class _trainBookingState extends State<trainBooking> {
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
            Container(
              margin: const EdgeInsets.only(bottom: 25),
              height: height / 15,
              width: width,
              child: Row(
                children: [
                  Text(
                    'Hotels ',
                    style: GoogleFonts.nunito(
                        fontSize: 28, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const Icon(FontAwesomeIcons.building, size: 30),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const cityDetails(),
            ),
          );
        },
        child: const Icon(FontAwesomeIcons.arrowLeft, size: 20),
      ),
    );
  }
}
