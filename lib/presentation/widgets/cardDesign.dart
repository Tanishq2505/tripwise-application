import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';

final _long = false;
Widget cardDesign(height, width) {
  return Container(
    height: height / 1.9,
    width: width / 1.3,
    margin: const EdgeInsets.only(left: 25),
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10.0),
        topRight: Radius.circular(10.0),
        bottomLeft: Radius.circular(60.0),
        bottomRight: Radius.circular(10.0),
      ),
      color: Color.fromRGBO(242, 218, 195, 1),
    ),
    child: Column(
      children: [
        const SizedBox(height: 25),
        Container(
          height: height / 3.7,
          width: width / 1.5,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
              bottomLeft: Radius.circular(60.0),
              bottomRight: Radius.circular(10.0),
            ),
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          'Marina Beach',
          style: GoogleFonts.nunito(
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        Container(
          padding: const EdgeInsets.only(left: 15.0, top: 10, bottom: 10.0),
          child: const ReadMoreText(
            'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
            trimLines: 3,
            colorClickableText: Colors.pink,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'Read more',
            trimExpandedText: 'Read less',
            moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
        ElevatedButton(
          onPressed: null,
          child: SizedBox(
            width: 130,
            child: Row(
              children: [
                Text(
                  'Directions  ',
                  style: GoogleFonts.nunito(
                      fontWeight: FontWeight.w500, fontSize: 16),
                ),
                const FaIcon(FontAwesomeIcons.arrowRight),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
