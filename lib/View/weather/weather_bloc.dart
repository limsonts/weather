import 'package:bloc/bloc.dart';
import 'package:weather/View/weather/weather_event.dart';
import 'package:weather/View/weather/weather_state.dart';
import 'package:weather/controller/weather_repostriy/wether_controller.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc(this.weatherRepository) : super(WeatherInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherLoading());
      try {
        final weather = await weatherRepository.fetchWeather(event.city);
        emit(WeatherLoaded(weather));
      } catch (e) {
        print(e);
        emit(WeatherError("Could not fetch weather data"));
      }
    });
  }
}
