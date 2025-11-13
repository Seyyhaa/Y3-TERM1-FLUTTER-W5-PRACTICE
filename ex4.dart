import 'package:flutter/material.dart';

enum WeatherCity {
  phnomPenh(
    image: "assets/cloudy.png",
    city: "PhnomPenh",
    minTemp: "10.0",
    maxTemp: "30.0",
    currTemp: "12.2",
    startColor: Colors.purpleAccent,
    endColor: Colors.deepPurple,
    ovalColor: Color.fromARGB(255, 181, 162, 231),
  ),
  paris(
    image: "assets/sunnyCloudy.png",
    city: "Paris",
    minTemp: "10.0",
    maxTemp: "40.0",
    currTemp: "22.2",
    startColor: Colors.tealAccent,
    endColor: Colors.teal,
    ovalColor: Color.fromARGB(255, 128, 197, 190),
  ),
  rome(
    image: "assets/sunny.png",
    city: "Rome",
    minTemp: "10.0",
    maxTemp: "40.0",
    currTemp: "45.2",
    startColor: Colors.redAccent,
    endColor: Colors.red,
    ovalColor: Color.fromARGB(255, 222, 123, 118),
  ),
  toulouse(
    image: "assets/veryCloudy.png",
    city: "Toulouse",
    minTemp: "10.0",
    maxTemp: "40.0",
    currTemp: "45.2",
    startColor: Colors.orangeAccent,
    endColor: Colors.orange,
    ovalColor: Color.fromARGB(255, 236, 165, 95),
  );

  final String image;
  final String city;
  final String minTemp;
  final String maxTemp;
  final String currTemp;
  final Color startColor;
  final Color endColor;
  final Color ovalColor;

  const WeatherCity({
    required this.image,
    required this.city,
    required this.minTemp,
    required this.maxTemp,
    required this.currTemp,
    required this.startColor,
    required this.endColor,
    required this.ovalColor,
  });
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [Icon(Icons.menu, color: Colors.white)],
          ),
          backgroundColor: Colors.blue,
        ),

        body: Padding(
          padding: const EdgeInsets.only(top: 15, left: 25, right: 25),
          child: ListView(
            children: [
              WeatherCards(weather: WeatherCity.phnomPenh),
              WeatherCards(weather: WeatherCity.paris),
              WeatherCards(weather: WeatherCity.rome),
              WeatherCards(weather: WeatherCity.toulouse),
            ],
          ),
        ),
      ),
    ),
  );
}

class WeatherCards extends StatelessWidget {
  final WeatherCity weather;

  const WeatherCards({required this.weather, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: PhysicalModel(
        color: Colors.white,
        elevation: 7,
        borderRadius: BorderRadius.circular(20),
        clipBehavior: Clip.antiAlias,
        shadowColor: Colors.grey,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [weather.startColor, weather.endColor],
            ),
          ),
          padding: const EdgeInsets.only(
            top: 10,
            left: 15,
            right: 10,
            bottom: 15,
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                right: -45,
                top: -19,

                child: Container(
                  width: 168,
                  height: 168,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: weather.ovalColor,
                  ),
                ),
              ),
              Row(
                children: [
                  CircleAvatar(backgroundImage: AssetImage(weather.image)),
                  const SizedBox(width: 15),

                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text(
                              weather.city,
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),

                            Text(
                              "Min ${weather.minTemp} °C",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),

                            Text(
                              "Max ${weather.maxTemp} °C",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),

                          ],
                        ),

                        Text(
                          " ${weather.currTemp} °C",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),


                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
