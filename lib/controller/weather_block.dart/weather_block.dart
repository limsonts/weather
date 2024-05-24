import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/View/weather/weather_state.dart';
import 'package:weather/controller/weather_repostriy/wether_controller.dart';

import '../../View/weather/weather_event.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc(this.weatherRepository) : super(WeatherInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherLoading());
      try {
        dynamic weathers = await weatherRepository.fetchWeather(event.city);
        emit(WeatherLoaded(weathers));
      } catch (e) {
        emit(WeatherError("Could not fetch weather data"));
      }
    });
  }
}