import 'package:detectnew/profile_setting.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:detectnew/WeatherPage.dart';
import 'package:detectnew/screens/consts.dart';
import 'package:weather/weather.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final WeatherFactory _wf = WeatherFactory(OPENWEATHER_API_KEY);

  Weather? _weather;
  String _cityName = 'Colombo'; // Default city

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  Future<void> _fetchWeather() async {
    try {
      final weather = await _wf.currentWeatherByCityName(_cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      // Handle error, e.g., show a snackbar
      print("Error fetching weather: $e");
    }
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.blue.shade100,
                Colors.blue.shade100,
              ],
            ),
          ),
          child: AppBar(
            title: Center(
              child: Text(
                'Weather Condition',
                style: TextStyle(
                  fontSize: 30, // Adjust font size
                  fontWeight: FontWeight.bold, // Add font weight
                  color: Color.fromARGB(255, 4, 88, 111), // Change text color
                  fontFamily: 'Roboto', // Change font family
                ),
              ),
            ),
            backgroundColor: Colors.transparent, // Set app bar background color to transparent
            elevation: 0, // Remove app bar elevation
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => profilesetting()), // Navigate to your profile page
          );
        },
        child: _buildUI(),
      ),
    );
  }

  Widget _buildUI() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.blue.shade100,
            Colors.blue.shade300,
          ],
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 50), // Added spacing at the top
          Expanded(
            child: SingleChildScrollView(
              child: _weather != null ? _buildWeatherDetails() : _buildLoading(),
            ),
          ),
          _buildSearchInput(),
        ],
      ),
    );
  }

  Widget _buildSearchInput() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              style: TextStyle(fontSize: 18), // Increase font size
              decoration: InputDecoration(
                hintText: 'Enter city name...',
              ),
              onChanged: (value) {
                _cityName = value;
              },
              onSubmitted: (value) {
                _fetchWeather();
              },
            ),
          ),
          SizedBox(width: 10),
          ElevatedButton(
            onPressed: () {
              _fetchWeather();
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 2, 10, 105)), // Change button color
            ),
            child: Text(
              'Search',
              style: TextStyle(fontSize: 17, color: Color.fromARGB(255, 181, 246, 251)), // Increase button text font size
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildWeatherDetails() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _locationHeader(),
        SizedBox(height: 20),
        _dateTimeInfo(),
        SizedBox(height: 20),
        _weatherIcon(),
        SizedBox(height: 20),
        _currentTemp(),
        SizedBox(height: 20),
        _extraInfo(),
        SizedBox(height: 20), // Add extra spacing at the bottom
      ],
    );
  }

  Widget _locationHeader() {
    return Text(
      _weather?.areaName ?? "",
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _dateTimeInfo() {
    DateTime now = _weather!.date!;
    return Column(
      children: [
        Text(
          DateFormat("h:mm a").format(now),
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              DateFormat("EEEE").format(now),
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              "  ${DateFormat("d.M.y").format(now)}",
              style: TextStyle(
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _weatherIcon() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.network(
          "http://openweathermap.org/img/wn/${_weather?.weatherIcon}@2x.png",
          height: 100,
          width: 100,
        ),
        Text(
          _weather?.weatherDescription ?? "",
          style: TextStyle(
            color: Color.fromARGB(255, 86, 5, 161),
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _currentTemp() {
    return Text(
      "${_weather?.temperature?.celsius?.toStringAsFixed(0)}° C",
      style: TextStyle(
        color: Color.fromARGB(255, 87, 87, 87),
        fontSize: 50, // Adjust the font size as needed
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _extraInfo() {
    return Container(
      height: 100, // Adjust the height as needed
      width: double.infinity,
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text(
                "Max: ${_weather?.tempMax?.celsius?.toStringAsFixed(0)}° C",
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Min: ${_weather?.tempMin?.celsius?.toStringAsFixed(0)}° C",
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                "Wind: ${_weather?.windSpeed?.toStringAsFixed(0)}m/s",
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Humidity: ${_weather?.humidity?.toStringAsFixed(0)}%",
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
