import 'package:equatable/equatable.dart';


abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

   @override
  List<Object> get props => [];
}

class FetchWeather extends WeatherEvent{
  final dynamic city;
  const FetchWeather(this.city);
 
   @override
  List<Object> get props => [city];

}
