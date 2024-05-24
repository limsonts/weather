import 'package:flutter/material.dart';
import 'package:weather/model.dart/weather_model.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherDetailScreen extends StatelessWidget {
  final WeatherResponseModel weather;

  const WeatherDetailScreen({required this.weather});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    dynamic temperature = weather.list?[0].main?.temp;
    double celsius = temperature - 273.15;
    dynamic maxTemperature = weather.list?[0].main?.tempMax;
    dynamic minTemperature = weather.list?[0].main?.tempMin;
    double minTemp = minTemperature - 273.15;
    double maxTemp = maxTemperature - 273.15;
    var humidity = weather.list?[0].main?.humidity;
    var orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('asset/images/bg_blck.jpg'),
                fit: BoxFit.fill)),
        child: SafeArea(
          child: orientation == Orientation.portrait
              ? _buildPortraitLayout(screenHeight, screenWidth, celsius, minTemp, maxTemp, humidity)
              : _buildLandscapeLayout(screenHeight, screenWidth, celsius, minTemp, maxTemp, humidity),
        ),
      ),
    );
  }

  Widget _buildPortraitLayout(double screenHeight, double screenWidth, double celsius, double minTemp, double maxTemp, var humidity) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.location_on,
              color: Colors.white,
              size: 40,
            ),
            Text(
              ' ${weather.list?[0].name}',
              style: const TextStyle(fontSize: 24, color: Colors.white),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            height: screenHeight * 0.4,
            width: screenWidth * 0.6,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                    width: screenWidth * 0.005, color: Colors.white),
                color: Colors.transparent),
            child: Card(
              elevation: 4,
              color: Colors.transparent,
              shadowColor: Colors.black,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.network(
                      'http://openweathermap.org/img/wn/${weather.list?[0].weather?[0].icon}.png',
                      color: Colors.white,
                      filterQuality: FilterQuality.high,
                      scale: 0.29,
                    ),
                    const SizedBox(height: 3),
                    Text(
                      '${celsius.toStringAsFixed(1)}°C',
                      style: const TextStyle(
                          fontSize: 28, color: Colors.white),
                    ),
                    Text(
                      '${weather.list?[0].weather?[0].description}',
                      style: const TextStyle(
                          fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        _buildInfoCardPotriate(screenHeight, screenWidth, minTemp, maxTemp, humidity)
      ],
    );
  }

  Widget _buildLandscapeLayout(double screenHeight, double screenWidth, double celsius, double minTemp, double maxTemp, var humidity) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [

    

        Container(
           height: screenHeight * 0.8,
           width: screenWidth * 0.4,
           decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
                width: screenWidth * 0.005, color: Colors.white),
            color: Colors.transparent),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.location_on,
                color: Colors.white,
                size: 40,
              ),
              Text(
                ' ${weather.list?[0].name}',
                style: const TextStyle(fontSize: 24, color: Colors.white),
              ),
              Image.network(
                'http://openweathermap.org/img/wn/${weather.list?[0].weather?[0].icon}.png',
                color: Colors.white,
                filterQuality: FilterQuality.high,
                scale: 0.29,
              ),
              const SizedBox(height: 3),
              Text(
                '${celsius.toStringAsFixed(1)}°C',
                style: const TextStyle(
                    fontSize: 28, color: Colors.white),
              ),
              Text(
                '${weather.list?[0].weather?[0].description}',
                style: const TextStyle(
                    fontSize: 16, color: Colors.white),
              ),
            ],
          ),
        ),
          _buildInfoCard(screenHeight, screenWidth, minTemp, maxTemp, humidity),
        
      ],
    );
  }

  Widget _buildInfoCard(double screenHeight, double screenWidth, double minTemp, double maxTemp, var humidity) {
    return Flexible(
      child: Container(
        height: screenHeight * 0.5,
        width: screenWidth * 0.4,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
                width: screenWidth * 0.005, color: Colors.white),
            color: Colors.transparent),
        child: Card(
          elevation: 4,
          color: Colors.transparent,
          shadowColor: Colors.black,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Text('Min Temp',style: TextStyle(color: Colors.white),),
                          SizedBox(
                            height: 10,
                          ),
                      Row(
                        children: [
                      Icon(
                        WeatherIcons.day_sunny,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        ' ${minTemp.toStringAsFixed(1)}',
                        style: const TextStyle(
                            fontSize: 18, color: Colors.white),
                      ),
                        ]
                      ),
                        ]
                      ),
                      SizedBox(
                        width: screenWidth * 0.1,
                      ),
                      Column(
                        children: [
                          Text('Wind Speed',style: TextStyle(color: Colors.white),),
                          
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                          Icon(
                            WeatherIcons.wind_beaufort_0,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            '${weather.list?[0].wind?.speed}',
                            style:
                                TextStyle(fontSize: 16, color: Colors.white),
                          ),
                            ]
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20),
                
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Text('MaxTemp ',style: TextStyle(color: Colors.white),),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                      Icon(
                        WeatherIcons.day_sunny,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        '${maxTemp.toStringAsFixed(1)}',
                        style:
                            TextStyle(fontSize: 16, color: Colors.white),
                      )
                            ]
                      ),
                        ]
                      ),
                      SizedBox(
                        width: screenWidth*0.1,
                      ),
                      Column(
                        children: [
                          Text('Humidity',style: TextStyle(color: Colors.white),),
                          SizedBox(
                            height: 10,
                          ),
                      Row(
                        children: [
                      Icon(
                        WeatherIcons.humidity,
                        size: 15,
                        color: Colors.white,
                      ),
                      SizedBox(width: 20,),
                      Text('${humidity}',
                          style: TextStyle(
                              fontSize: 16, color: Colors.white))
                        ]
                      )
                        ]
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCardPotriate(double screenHeight, double screenWidth, double minTemp, double maxTemp, var humidity) {
    return Flexible(
      child: Container(
        height: screenHeight * 0.3,
        width: screenWidth * 0.8,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
                width: screenWidth * 0.005, color: Colors.white),
            color: Colors.transparent),
        child: Card(
          elevation: 4,
          color: Colors.transparent,
          shadowColor: Colors.black,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Text('Min Temp',style: TextStyle(color: Colors.white),),
                          SizedBox(
                            height: 10,
                          ),
                      Row(
                        children: [
                      Icon(
                        WeatherIcons.day_sunny,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        ' ${minTemp.toStringAsFixed(1)}',
                        style: const TextStyle(
                            fontSize: 18, color: Colors.white),
                      ),
                        ]
                      ),
                        ]
                      ),
                      SizedBox(
                        width: screenWidth * 0.3,
                      ),
                      Column(
                        children: [
                          Text('Wind Speed',style: TextStyle(color: Colors.white),),
                          
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                          Icon(
                            WeatherIcons.wind_beaufort_0,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            '${weather.list?[0].wind?.speed}',
                            style:
                                TextStyle(fontSize: 16, color: Colors.white),
                          ),
                            ]
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20),
                
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Text('MaxTemp ',style: TextStyle(color: Colors.white),),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                      Icon(
                        WeatherIcons.day_sunny,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        '${maxTemp.toStringAsFixed(1)}',
                        style:
                            TextStyle(fontSize: 16, color: Colors.white),
                      )
                            ]
                      ),
                        ]
                      ),
                      SizedBox(
                        width: screenWidth*0.3,
                      ),
                      Column(
                        children: [
                          Text('Humidity',style: TextStyle(color: Colors.white),),
                          SizedBox(
                            height: 10,
                          ),
                      Row(
                        children: [
                      Icon(
                        WeatherIcons.humidity,
                        size: 15,
                        color: Colors.white,
                      ),
                      SizedBox(width: 20,),
                      Text('${humidity}',
                          style: TextStyle(
                              fontSize: 16, color: Colors.white))
                        ]
                      )
                        ]
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }



}
