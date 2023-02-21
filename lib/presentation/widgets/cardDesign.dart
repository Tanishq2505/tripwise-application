import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:trip_wise/models/attractions_data.dart';

final _long = false;
Widget cardDesign(height, width, Points data) {
  _launchURL(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  return Container(
    height: height / 1.5,
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
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
              bottomLeft: Radius.circular(60.0),
              bottomRight: Radius.circular(10.0),
            ),
            color: Colors.white,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
              bottomLeft: Radius.circular(60.0),
              bottomRight: Radius.circular(10.0),
            ),
            child: (data.image!.url != null)
                ? Image.network(
                    data.image!.url!,
                    fit: BoxFit.cover,
                    scale: 0.2,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                  )
                : Center(
                    child: Text(
                      data.image!.alt![0],
                      style: GoogleFonts.nunito(
                        fontWeight: FontWeight.w700,
                        fontSize: 32,
                        color: Color(
                          0xffab733b,
                        ).withOpacity(
                          0.8,
                        ),
                      ),
                    ),
                  ),
          ),
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Text(
            data.title.toString(),
            style: GoogleFonts.nunito(
              fontWeight: FontWeight.w700,
              fontSize: 24,
            ),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        Container(
          height: height * 0.15,
          padding: const EdgeInsets.only(left: 15.0, top: 10, bottom: 10.0),
          child: Text(
            data.description.toString(),
            style: GoogleFonts.nunito(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        ElevatedButton(
          onPressed:
              (data.coordinates!.lat != null && data.coordinates!.lon != null)
                  ? () {
                      _launchURL(
                        Uri.parse(
                          'google.navigation:q=${data.coordinates!.lat!},${data.coordinates!.lon!}',
                        ),
                      );
                    }
                  : null,
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
