import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trip_wise/models/attractions_data.dart';
import 'package:trip_wise/models/suggestion_autocomplete.dart';
import 'package:trip_wise/presentation/screens/flights.dart';
import 'package:trip_wise/presentation/screens/hotels.dart';
import 'package:trip_wise/presentation/screens/web_view_screen.dart';
import 'package:trip_wise/presentation/widgets/cardDesign.dart';
import 'package:trip_wise/presentation/widgets/data.dart';
import 'package:trip_wise/presentation/widgets/weatherCard.dart';
import 'package:webview_flutter/webview_flutter.dart';

class cityDetails extends StatefulWidget {
  final Suggestion city;
  final String startDate;
  final String endDate;
  const cityDetails({
    super.key,
    required this.city,
    required this.startDate,
    required this.endDate,
  });

  @override
  State<cityDetails> createState() => _cityDetailsState();
}

class _cityDetailsState extends State<cityDetails> {
  TextEditingController _startDateController = TextEditingController();
  TextEditingController _endDateController = TextEditingController();
  TextEditingController _destinationController = TextEditingController();
  TextEditingController _departureController = TextEditingController();
  late Future<AttractionDetails> getAttractionsFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAttractionsFuture =
        getdestinattractions(widget.city.smartyDisplay!.split(',')[0]);
  }

  @override
  Widget build(BuildContext context) {
    print(widget.city.displayType!.displayName!.split(',')[0]);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height * 0.05,
              ),
              SizedBox(
                height: height / 8,
                width: width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "You are travelling to",
                      style: GoogleFonts.nunito(
                        fontWeight: FontWeight.w700,
                        fontSize: 27,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      widget.city.smartyDisplay!.split(',')[0],
                      style: GoogleFonts.nunito(
                        fontWeight: FontWeight.w700,
                        fontSize: 30,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
              Container(
                height: height / 15,
                width: width,
                margin: const EdgeInsets.fromLTRB(10.0, 10.0, 0, 0),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    FilledButton.tonal(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => fligthBooking(
                                destination: widget.city,
                                startDate: widget.startDate,
                                endDate: widget.endDate),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Book Flights  ',
                            style: GoogleFonts.nunito(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                          const FaIcon(
                            FontAwesomeIcons.planeDeparture,
                            size: 24,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(width: 15.0),
                    FilledButton.tonal(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => hotelBooking(),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Book Hotels  ',
                            style: GoogleFonts.nunito(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                          const FaIcon(
                            FontAwesomeIcons.building,
                            size: 24,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(width: 15.0),
                    FilledButton.tonal(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => WebViewScreen(
                              controller: WebViewController()
                                ..loadRequest(
                                  Uri.parse(
                                    'https://www.irctc.co.in/nget/train-search',
                                  ),
                                )
                                ..setJavaScriptMode(
                                  JavaScriptMode.unrestricted,
                                ),
                            ),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Book Trains  ',
                            style: GoogleFonts.nunito(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                          const FaIcon(
                            FontAwesomeIcons.trainTram,
                            size: 24,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 0),
                child: Text(
                  'Attractions',
                  style: GoogleFonts.nunito(
                      fontSize: 26, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: height / 20,
                margin: const EdgeInsets.fromLTRB(10.0, 10.0, 0, 0),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(200, 40),
                      ),
                      onPressed: () {},
                      child: Text(
                        'All',
                        style: GoogleFonts.nunito(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(width: 15.0),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(200, 40),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Suggested',
                        style: GoogleFonts.nunito(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(width: 15.0),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(200, 40),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Tourists',
                        style: GoogleFonts.nunito(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(width: 15.0),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(200, 40),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Tourists',
                        style: GoogleFonts.nunito(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              FutureBuilder(
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                    case ConnectionState.active:
                      break;
                    case ConnectionState.done:
                      if (snapshot.hasData) {
                        AttractionDetails data =
                            snapshot.data as AttractionDetails;
                        return Container(
                          height: height / 1.7,
                          width: width,
                          margin: const EdgeInsets.only(top: 30),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => cardDesign(
                              height,
                              width,
                              data.points![index],
                            ),
                            itemCount: data.points!.length,
                          ),
                        );
                      }
                  }
                  return const SizedBox.shrink();
                },
                future: getAttractionsFuture,
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: weatherCardDesign(
                    width, height, widget.city.smartyDisplay!.split(',')[0]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
