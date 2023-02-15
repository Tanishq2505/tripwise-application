import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget weatherCardDesign(width, height) {
  return Container(
    height: height / 3,
    width: width / 1.3,
    margin: const EdgeInsets.only(top: 10, bottom: 30),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.0),
      gradient: const LinearGradient(
        colors: [Colors.white, Colors.lightBlue],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        tileMode: TileMode.clamp,
      ),
      boxShadow: const [
        BoxShadow(
          color: Colors.grey,
          blurRadius: 2.0,
          offset: Offset(
            5,
            5,
          ),
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Weather',
          style: GoogleFonts.nunito(fontSize: 26, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        Text(
          'Chennai',
          style: GoogleFonts.nunito(
              fontSize: 18, color: Colors.red, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        Container(
          margin: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/images/raindrop.png'),
                  Text(
                    '29%',
                    style: GoogleFonts.nunito(
                        fontSize: 16, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ///Image.asset('assets/images/sun.png'),
                  Text(
                    '27°C',
                    style: GoogleFonts.nunito(
                        fontSize: 22, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/images/wind.png'),
                  Text(
                    '7 km/h',
                    style: GoogleFonts.nunito(
                        fontSize: 16, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ],
          ),
        ),
        Text(
          'Next 3 days',
          style: GoogleFonts.nunito(
              fontSize: 18, color: Colors.red, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        Container(
          margin: const EdgeInsets.only(top: 10, left: 15.0, right: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '29°C',
                style: GoogleFonts.nunito(
                    fontSize: 18, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              Text(
                '28°C',
                style: GoogleFonts.nunito(
                    fontSize: 18, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              Text(
                '30°C',
                style: GoogleFonts.nunito(
                    fontSize: 18, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
