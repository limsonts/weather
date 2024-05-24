import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/View/weather/weather_bloc.dart';
import 'package:weather/View/weather/weather_event.dart';
import 'package:weather/View/weather/weather_second.dart';
import 'package:weather/View/weather/weather_state.dart';
import 'package:weather/controller/weather_repostriy/wether_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => WeatherBloc(WeatherRepository()),
        child: WeatherPage(),
      ),
    );
  }
}

class WeatherPage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final List<dynamic> cities = ['Mysore', 'Mumbai', 'Munnar', 'Chennai','Trichy',];
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text('Weather App',style: TextStyle(color: Colors.white),),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('asset/images/bg_blck.jpg'),
                fit: BoxFit.fill)
          ),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Card(
              color: Colors.transparent,
              child: Column(
                    
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    child: Card(
                      elevation: 4,
                      child: TextField(
                        //enabled: false,
                        controller: _controller,
                        decoration: InputDecoration(
                          hintText: 'Enter City',
                          suffixIcon: IconButton(
                            icon: Icon(Icons.search),
                            onPressed: () {
                              final city = _controller.text;
                              if (city.isNotEmpty) {
                                BlocProvider.of<WeatherBloc>(context).add(FetchWeather(city));
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Flexible(
                    child: ListView.builder(
                      itemCount: cities.length,
                      itemBuilder: (context, index) {
                        final city = cities[index];
                        return Column(
                          children: [
                            ListTile(  
                              title: Text(city,style: TextStyle(color: Colors.white),),
                              onTap: () {
                                BlocProvider.of<WeatherBloc>(context).add(FetchWeather(city));
                              },                              
                            ),
                            Divider(
                              color: Colors.white,
                            )
                          ],
                        );  
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  BlocConsumer<WeatherBloc, WeatherState>(
                    listener: (context, state) {
                      if (state is WeatherLoaded) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WeatherDetailScreen(weather: state.weather),
                          ),
                        );
                      } else if (state is WeatherError) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.message)),
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is WeatherInitial) {
                        return Text('Enter a city to see the weather');
                      } else if (state is WeatherLoading) {
                        return CircularProgressIndicator();
                      }
                      return Container();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
