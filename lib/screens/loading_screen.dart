import 'package:myweatherapp/screens/location_screen.dart';
import 'package:myweatherapp/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:myweatherapp/main.dart';
import 'package:geolocator/geolocator.dart';
import 'package:myweatherapp/services/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

const apiKey = 'ef5ef66911777d804135599e0ca385e0';

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/bg1.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SpinKitDoubleBounce(
                  color: Colors.black,
                  size: 80,
                ),
              ),
            ],
          )),
    );
  }
}
