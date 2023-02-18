import 'package:flutter/material.dart';
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
                      title: Text(
                          (snapshot.data![index] as Suggestion).displayname ??
                              "Display name"),
                      onTap: () {
                        close(context, snapshot.data![index] as Suggestion);
                      },
                    ),
                    itemCount: snapshot.data!.length,
                  )
                : Container(child: Text('Loading...'));
      },
    );
  }
}
