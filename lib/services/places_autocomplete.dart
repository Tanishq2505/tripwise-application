import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:logger/logger.dart';

// For storing our result
class Suggestion {
  final String placeId;
  final String description;

  Suggestion(this.placeId, this.description);

  @override
  String toString() {
    return 'Suggestion(description: $description, placeId: $placeId)';
  }
}

class PlaceApiProvider {
  final client = Client();

  PlaceApiProvider(this.sessionToken);

  final sessionToken;

  static final String androidKey = 'AIzaSyBQTYWYDDKImPseJsoB8xjFZTU_pYPqgv8';
  // static final String iosKey = 'YOUR_API_KEY_HERE';
  final apiKey = androidKey;

  Future<List<Suggestion>> fetchSuggestions(String input, String type) async {
    Logger().v(type);
    final request =
        'https://www.momondo.in/mvm/smartyv2/search?f=j&s=${type.split('.')[1]}&where=$input&lc_cc=IN&lc=en&sv=5&cv=undefined&c=undefined&searchId=undefined&v=undefined';
    final response = await client.get(
      Uri.parse(request),
    );
    // Logger().e(response.body);
    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      // Logger().d(result[0]);

      // compose suggestions in a list
      List<Suggestion> finalResult = result
          .map<Suggestion>((p) => Suggestion(p["displayname"], p["id"]))
          .toList();

      return finalResult;
    } else {
      throw Exception('Failed to fetch suggestion');
    }
  }
}
