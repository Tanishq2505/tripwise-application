import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:trip_wise/models/attractions_data.dart';

Future<AttractionDetails> getdestinattractions(String city) async {
  try {
    Logger().i(city);
    Response response =
        await Dio().get("10.150.23.219:8000/getdetails/mumbai");

    if (response.statusCode!.toInt() > 199 &&
        response.statusCode!.toInt() < 300) {
      return AttractionDetails.fromJson(response.data);
    }
  } catch (e) {
    Logger().e(e);
    Logger().e((e as TypeError).stackTrace);
  }
  return AttractionDetails();
}

Widget dataPrint(city) {
  return Container(
    child: FutureBuilder(
      future: getdestinattractions(city),
      builder: (context, snapshot) {
        print(snapshot.connectionState);
        print(snapshot.data);
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
          case ConnectionState.active:
            break;
          case ConnectionState.done:
            {
              if (!snapshot.hasData) break;
              AttractionDetails data = snapshot.data!;
              return Container(
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        print(data);
                      },
                      child: Text('Print Data'),
                    ),
                  ],
                ),
              );
            }
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    ),
  );
}
