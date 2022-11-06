import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'weather.dart';

class WeatherScreen extends ConsumerWidget {
  WeatherScreen({Key? key}) : super(key: key);

  List<Weather> _weather = [];
  String cityName = ""; //! keep it empty

  int nextDayHour = 0; //! keep it 0
  int forecastResultsCount =
      5; // you can change it, it's results count for forecast
  int hoursNextDay = 0; //! keep it 0
  List hoursList = []; //! keep it empty
  int currTime = DateTime.now().hour; // current hour

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      body: Center(
        child: Container(
          height: size.height,
          width: size.height,
          decoration: BoxDecoration(
            color: isDarkMode ? Colors.black : Colors.white,
          ),
          child: SafeArea(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: size.height * 0.01,
                          horizontal: size.width * 0.05,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.bars,
                              color: isDarkMode ? Colors.white : Colors.black,
                            ),
                            Align(
                              child: Text(
                                'Weather App',
                                style: GoogleFonts.questrial(
                                  color: isDarkMode
                                      ? Colors.white
                                      : const Color(0xff1D1617),
                                  fontSize: size.height * 0.02,
                                ),
                              ),
                            ),
                            FaIcon(
                              FontAwesomeIcons.plusCircle,
                              color: isDarkMode ? Colors.white : Colors.black,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.03,
                          left: size.width * 0.01,
                          right: size.width * 0.01,
                        ),
                        child: Align(
                          child: Text(
                            cityName,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.questrial(
                              color: isDarkMode ? Colors.white : Colors.black,
                              fontSize: size.height * 0.06,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.005,
                        ),
                        child: Align(
                          child: Text(
                            'Today',
                            style: GoogleFonts.questrial(
                              color:
                                  isDarkMode ? Colors.white54 : Colors.black54,
                              fontSize: size.height * 0.035,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.03,
                        ),
                        child: Align(
                          child: _weather.isNotEmpty
                              ? Text(
                                  "${_weather.first.hour[hoursList[0]]['temp_c'].round()}˚C",
                                  style: GoogleFonts.questrial(
                                    color: _weather.first
                                                .hour[hoursList[0]]['temp_c']
                                                .round() <=
                                            0
                                        ? Colors.blue
                                        : _weather.first.hour[hoursList[0]]['temp_c']
                                                        .round() >
                                                    0 &&
                                                _weather
                                                        .first
                                                        .hour[hoursList[0]]
                                                            ['temp_c']
                                                        .round() <=
                                                    15
                                            ? Colors.indigo
                                            : _weather
                                                            .first
                                                            .hour[hoursList[0]]
                                                                ['temp_c']
                                                            .round() >
                                                        15 &&
                                                    _weather
                                                            .first
                                                            .hour[hoursList[0]]
                                                                ['temp_c']
                                                            .round() <
                                                        30
                                                ? Colors.deepPurple
                                                : Colors.pink,
                                    fontSize: size.height * 0.13,
                                  ),
                                )
                              : SizedBox(
                                  height: size.width * 0.265,
                                  width: size.width * 0.265,
                                  child: Transform.scale(
                                    scale: 1,
                                    child: const CircularProgressIndicator(
                                      strokeWidth: 2.0,
                                      valueColor:
                                          AlwaysStoppedAnimation(Colors.indigo),
                                    ),
                                  ),
                                ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.25),
                        child: Divider(
                          color: isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                      _weather.isNotEmpty
                          ? Padding(
                              padding: EdgeInsets.only(
                                top: size.height * 0.005,
                                left: size.width * 0.01,
                                right: size.width * 0.01,
                              ),
                              child: Align(
                                child: Text(
                                  '${_weather[1].hour.first['condition']['text']}',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.questrial(
                                    color: isDarkMode
                                        ? Colors.white54
                                        : Colors.black54,
                                    fontSize: size.height * 0.03,
                                  ),
                                ),
                              ),
                            )
                          : Container(),
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.01,
                          bottom: size.height * 0.01,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _weather.isNotEmpty
                                ? Text(
                                    '${_weather[0].minTemp}˚C',
                                    style: GoogleFonts.questrial(
                                      color: _weather[0].minTemp <= 0
                                          ? Colors.blue
                                          : _weather[0].minTemp > 0 &&
                                                  _weather[0].minTemp <= 15
                                              ? Colors.indigo
                                              : _weather[0].minTemp > 15 &&
                                                      _weather[0].minTemp < 30
                                                  ? Colors.deepPurple
                                                  : Colors.pink,
                                      fontSize: size.height * 0.03,
                                    ),
                                  )
                                : Container(),
                            Text(
                              '/',
                              style: GoogleFonts.questrial(
                                color: isDarkMode
                                    ? Colors.white54
                                    : Colors.black54,
                                fontSize: size.height * 0.03,
                              ),
                            ),
                            _weather.isNotEmpty
                                ? Text(
                                    '${_weather[0].maxTemp}˚C',
                                    style: GoogleFonts.questrial(
                                      color: _weather[0].maxTemp <= 0
                                          ? Colors.blue
                                          : _weather[0].maxTemp > 0 &&
                                                  _weather[0].maxTemp <= 15
                                              ? Colors.indigo
                                              : _weather[0].maxTemp > 15 &&
                                                      _weather[0].maxTemp < 30
                                                  ? Colors.deepPurple
                                                  : Colors.pink,
                                      fontSize: size.height * 0.03,
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.05,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            color: isDarkMode
                                ? Colors.white.withOpacity(0.05)
                                : Colors.black.withOpacity(0.05),
                          ),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: size.height * 0.01,
                                    left: size.width * 0.03,
                                  ),
                                  child: Text(
                                    'Forecast for today',
                                    style: GoogleFonts.questrial(
                                      color: isDarkMode
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: size.height * 0.025,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: size.height * 0.28,
                                margin: const EdgeInsets.all(20),
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: hoursList.isNotEmpty
                                      ? hoursList.length <= forecastResultsCount
                                          ? forecastResultsCount
                                          : hoursList.length
                                      : 0,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return _weather.isNotEmpty
                                        ? buildForecastToday(
                                            index == 0
                                                ? 'Now'
                                                : "${hoursList[index]}:00",
                                            index >
                                                    hoursList.length -
                                                        hoursNextDay -
                                                        1
                                                ? _weather[1]
                                                    .hour[hoursList[index]]
                                                        ['temp_c']
                                                    .round()
                                                : _weather
                                                    .first
                                                    .hour[hoursList[index]]
                                                        ['temp_c']
                                                    .round(),
                                            index >
                                                    hoursList.length -
                                                        hoursNextDay -
                                                        1
                                                ? _weather[1]
                                                    .hour[hoursList[index]]
                                                        ['wind_kph']
                                                    .round()
                                                : _weather
                                                    .first
                                                    .hour[hoursList[index]]
                                                        ['wind_kph']
                                                    .round(),
                                            index >
                                                    hoursList.length -
                                                        hoursNextDay -
                                                        1
                                                ? _weather[1]
                                                    .hour[hoursList[index]]
                                                        ['chance_of_rain']
                                                    .round()
                                                : _weather
                                                    .first
                                                    .hour[hoursList[index]]
                                                        ['chance_of_rain']
                                                    .round(),
                                            index >
                                                    hoursList.length -
                                                        hoursNextDay -
                                                        1
                                                ? _weather[1]
                                                        .hour[hoursList[index]]
                                                    ['condition']['icon']
                                                : _weather.first
                                                        .hour[hoursList[index]]
                                                    ['condition']['icon'],
                                            size,
                                            isDarkMode,
                                          )
                                        : Container();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.05,
                          vertical: size.height * 0.02,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            color: Colors.white.withOpacity(0.05),
                          ),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: size.height * 0.02,
                                    left: size.width * 0.03,
                                  ),
                                  child: Text(
                                    '3-day forecast',
                                    style: GoogleFonts.questrial(
                                      color: isDarkMode
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: size.height * 0.025,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Divider(
                                color: isDarkMode ? Colors.white : Colors.black,
                              ),
                              Padding(
                                padding: EdgeInsets.all(size.width * 0.00),
                                child: Column(
                                  children: [
                                    _weather.isNotEmpty
                                        ? buildThreeDayForecast(
                                            "Today",
                                            _weather[0].minTemp,
                                            _weather[0].maxTemp,
                                            _weather[0].icon,
                                            size,
                                            isDarkMode,
                                          )
                                        : Container(),
                                    _weather.isNotEmpty
                                        ? buildThreeDayForecast(
                                            "Wed",
                                            _weather[1].minTemp,
                                            _weather[1].maxTemp,
                                            _weather[1].icon,
                                            size,
                                            isDarkMode,
                                          )
                                        : Container(),
                                    _weather.isNotEmpty
                                        ? buildThreeDayForecast(
                                            "Thu",
                                            _weather[2].minTemp,
                                            _weather[2].maxTemp,
                                            _weather[2].icon,
                                            size,
                                            isDarkMode,
                                          )
                                        : Container(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildForecastToday(String time, int temp, int wind, int rainChance,
      String weatherIcon, size, bool isDarkMode) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.005),
      child: Column(
        children: [
          Text(
            time,
            style: GoogleFonts.questrial(
              color: isDarkMode ? Colors.white : Colors.black,
              fontSize: size.height * 0.02,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: size.height * 0.005,
            ),
            child: Image.network(
              'http:$weatherIcon',
              height: size.height * 0.05,
              width: size.width * 0.1,
              fit: BoxFit.contain,
            ),
          ),
          Text(
            '$temp˚C',
            style: GoogleFonts.questrial(
              color: isDarkMode ? Colors.white : Colors.black,
              fontSize: size.height * 0.025,
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.01,
                ),
                child: FaIcon(
                  FontAwesomeIcons.wind,
                  color: Colors.grey,
                  size: size.height * 0.03,
                ),
              ),
            ],
          ),
          Text(
            '$wind km/h',
            style: GoogleFonts.questrial(
              color: Colors.grey,
              fontSize: size.height * 0.017,
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.01,
                ),
                child: FaIcon(
                  FontAwesomeIcons.umbrella,
                  color: Colors.blue,
                  size: size.height * 0.03,
                ),
              ),
            ],
          ),
          Text(
            '$rainChance %',
            style: GoogleFonts.questrial(
              color: Colors.blue,
              fontSize: size.height * 0.02,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildThreeDayForecast(String time, int minTemp, int maxTemp,
      String weatherIcon, size, bool isDarkMode) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                right: size.width * 0.25,
              ),
              child: Align(
                alignment: Alignment.topCenter,
                child: Image.network(
                  'http:$weatherIcon',
                  alignment: Alignment.topCenter,
                  height: size.height * 0.05,
                  width: size.width * 0.1,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.02,
                vertical: size.height * 0.01,
              ),
              child: Text(
                time,
                style: GoogleFonts.questrial(
                  color: isDarkMode ? Colors.white : Colors.black,
                  fontSize: size.height * 0.025,
                ),
              ),
            ),
            Align(
              child: Padding(
                padding: EdgeInsets.only(
                  left: size.width * 0.15,
                  top: size.height * 0.01,
                ),
                child: Text(
                  '$minTemp˚C',
                  style: GoogleFonts.questrial(
                    color: isDarkMode ? Colors.white38 : Colors.black38,
                    fontSize: size.height * 0.025,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.05,
                  vertical: size.height * 0.01,
                ),
                child: Text(
                  '$maxTemp˚C',
                  style: GoogleFonts.questrial(
                    color: isDarkMode ? Colors.white : Colors.black,
                    fontSize: size.height * 0.025,
                  ),
                ),
              ),
            ),
          ],
        ),
        Divider(
          color: isDarkMode ? Colors.white : Colors.black,
        ),
      ],
    );
  }
}
