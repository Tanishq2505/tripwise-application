import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:trip_wise/models/attractions_data.dart';

Future<AttractionDetails> getdestinattractions(String city) async {
  try {
    Response response = await Dio().get(
        "http://iitgscrape.westeurope.cloudapp.azure.com:3000/getdetails/$city");

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
