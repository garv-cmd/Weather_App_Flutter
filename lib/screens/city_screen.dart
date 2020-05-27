import 'package:myweatherapp/screens/location_screen.dart';
import 'package:myweatherapp/services/location.dart';
import 'package:flutter/material.dart';

import 'package:myweatherapp/utilities/constants.dart';
import 'location_screen.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://i.pinimg.com/originals/76/34/0c/76340c5efe8928365bb5dc51f78e9339.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  onPressed: () {
                    Navigator.pop(
                      context,
                    );
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 30.0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                  decoration: kInputDecor,
                  onChanged: (value) {
                    cityName = value;
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.deepOrange,
                ),
                child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context, cityName);
                  },
                  child: Icon(
                    Icons.check,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
