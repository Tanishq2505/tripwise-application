import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:trip_wise/models/weather_data.dart';

Future<WeatherData> getWeather(String city) async {
  try {
    Response response = await Dio().get(
        "https://api.weatherapi.com/v1/forecast.json?key=d8850e2b2a724d7a9d595832231502&q=${city}&days=3");

    if (response.statusCode!.toInt() > 199 &&
        response.statusCode!.toInt() < 300) {
      return WeatherData.fromJson(response.data);
    }
  } catch (e) {
    Logger().e(e);
    Logger().e((e as TypeError).stackTrace);
  }
  return WeatherData();
}

Widget weatherCardDesign(width, height, String city) {
  return Container(
    height: height / 3,
    width: width / 1.2,
    margin: const EdgeInsets.only(top: 10, bottom: 30),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.0),
      gradient: LinearGradient(
        colors: [
          Color(0xfffcfafa),
          Color(0xffdef0ef),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        tileMode: TileMode.clamp,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          blurRadius: 8.0,
          offset: Offset(
            5,
            5,
          ),
        ),
      ],
    ),
    child: FutureBuilder(
      future: getWeather(city),
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
              WeatherData data = snapshot.data!;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Weather',
                    style: GoogleFonts.nunito(
                        fontSize: 26, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Text(
                    data.location?.name ?? city,
                    style: GoogleFonts.nunito(
                        fontSize: 18,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/raindrop.png'),
                            Text(
                              '${data.current?.humidity}%',
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
                            SizedBox(
                              height: height * 0.11,
                              width: width * 0.35,
                              child: Image.asset(
                                'assets/images/sun.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              '${data.current?.feelslikeC}°C',
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
                            SizedBox(
                              height: height * 0.11,
                              width: width * 0.2,
                              child: Image.asset('assets/images/wind.png'),
                            ),
                            Text(
                              '${data.current?.windKph} km/h',
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
                        fontSize: 18,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Container(
                    margin:
                        const EdgeInsets.only(top: 10, left: 15.0, right: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '${data.forecast!.forecastday![0].day!.avgtempC}°C',
                          style: GoogleFonts.nunito(
                              fontSize: 18, fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        Text(
                          '${data.forecast!.forecastday![1].day!.avgtempC}°C',
                          style: GoogleFonts.nunito(
                              fontSize: 18, fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        Text(
                          '${data.forecast!.forecastday![2].day!.avgtempC}°C',
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
              );
            }
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    ),
  );
}
