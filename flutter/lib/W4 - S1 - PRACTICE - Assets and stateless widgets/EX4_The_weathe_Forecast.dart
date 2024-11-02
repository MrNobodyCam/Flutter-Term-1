import 'package:flutter/material.dart';

enum Condition {
  Sunny(image: 'weather_2.png'),
  Rainy(image: 'weather_3.png'),
  Cloudy(image: 'weather_7.png'),
  Snowy(image: 'weather_5.png'),
  SnowRain(image: 'weather_1.png'),
  SunSnowRain(image: 'weather_6.png'),
  SnowStorm(image: 'weather_4.png');

  final String image;
  const Condition({required this.image});
}

enum Day {
  Mon(name: "Mon"),
  Tue(name: "Tue"),
  Wed(name: "Wed"),
  Thu(name: "Thu"),
  Fri(name: "Fri"),
  Sat(name: "Sat"),
  Sun(name: "Sun");

  final String name;
  const Day({required this.name});
}

class Temperature {
  final int max;
  final int min;
  Temperature({required this.max, required this.min});
}

class Weather extends StatelessWidget {
  final Condition condition;
  final Day day;
  final Temperature temperature;
  const Weather(
      {super.key,
      required this.temperature,
      required this.condition,
      required this.day});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    day.name,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Image.asset(
                    "assets/${condition.image}",
                    width: 45,
                  ),
                  Row(
                    children: [
                      Text(
                        "${temperature.max}°",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${temperature.min}°",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          title: const Text(
            "Weather",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Container(
          padding: const EdgeInsets.only(left: 50, top: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Weather(
                    condition: Condition.Cloudy,
                    day: Day.Mon,
                    temperature: Temperature(max: 28, min: 18),
                  ),
                  Weather(
                    condition: Condition.Rainy,
                    day: Day.Tue,
                    temperature: Temperature(max: 28, min: 18),
                  ),
                  Weather(
                    condition: Condition.SnowRain,
                    day: Day.Wed,
                    temperature: Temperature(max: 28, min: 18),
                  ),
                  Weather(
                    condition: Condition.SnowStorm,
                    day: Day.Thu,
                    temperature: Temperature(max: 28, min: 18),
                  ),
                ],
              ),
              Row(
                children: [
                  Weather(
                    condition: Condition.Snowy,
                    day: Day.Fri,
                    temperature: Temperature(max: 28, min: 18),
                  ),
                  Weather(
                    condition: Condition.Sunny,
                    day: Day.Sat,
                    temperature: Temperature(max: 28, min: 18),
                  ),
                  Weather(
                    condition: Condition.SunSnowRain,
                    day: Day.Sun,
                    temperature: Temperature(max: 28, min: 18),
                  ),
                ],
              ),
            ],
          ),
        )),
  ));
}
