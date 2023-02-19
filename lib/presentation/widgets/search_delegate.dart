import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:trip_wise/models/suggestion_autocomplete.dart';
import 'package:trip_wise/services/places_autocomplete.dart';

class AddressSearch extends SearchDelegate<Suggestion> {
  AddressSearch(this.sessionToken, this.type) {
    apiClient = PlaceApiProvider(sessionToken);
  }

  final sessionToken;
  String type;
  late PlaceApiProvider apiClient;

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        tooltip: 'Clear',
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, Suggestion());
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return SizedBox.shrink();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return FutureBuilder<List>(
      future: query == "" ? null : apiClient.fetchSuggestions(query, type),
      builder: (context, snapshot) {
        Logger().e(snapshot.data);
        return query == ''
            ? Container(
                padding: EdgeInsets.all(16.0),
                child: Text('Enter your address'),
              )
            : (snapshot.hasData &&
                    snapshot.connectionState == ConnectionState.done)
                ? ListView.builder(
                    itemBuilder: (context, index) => ListTile(
                      title: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              height: size.height * 0.06,
                              decoration: BoxDecoration(
                                color: Color(0xffebe6ef),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ((snapshot.data![index] as Suggestion)
                                              .destinationImages !=
                                          null &&
                                      (snapshot.data![index] as Suggestion)
                                              .loctype ==
                                          'city')
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                        10,
                                      ),
                                      child: Image.network(
                                        (snapshot.data![index] as Suggestion)
                                            .destinationImages!
                                            .imageJpeg!,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : (snapshot.data![index] as Suggestion)
                                              .loctype ==
                                          'ap'
                                      ? Icon(
                                          CupertinoIcons.airplane,
                                        )
                                      : (snapshot.data![index] as Suggestion)
                                                  .loctype ==
                                              'lm'
                                          ? Icon(
                                              CupertinoIcons.location_solid,
                                            )
                                          : Icon(
                                              CupertinoIcons.bed_double_fill,
                                            ),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(),
                          ),
                          Expanded(
                            flex: 11,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  (snapshot.data![index] as Suggestion)
                                          .smartyDisplay ??
                                      "Display name",
                                  style: GoogleFonts.nunito(),
                                ),
                                Text(
                                  (snapshot.data![index] as Suggestion)
                                          .displayType!
                                          .displayName ??
                                      "Type",
                                  style: GoogleFonts.nunito(
                                    color: Colors.grey,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        close(context, snapshot.data![index] as Suggestion);
                      },
                    ),
                    itemCount: snapshot.data!.length,
                  )
                : Container(
                    padding: EdgeInsets.only(
                      left: 10,
                    ),
                    child: Text('Loading...'),
                  );
      },
    );
  }
}
