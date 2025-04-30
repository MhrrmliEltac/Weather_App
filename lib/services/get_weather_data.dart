import 'package:dio/dio.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/models/weather_data_model.dart';

class WeatherData {
    Future<String> _getLocation() async {
        final bool serviceEnabled;
        LocationPermission permission;

        serviceEnabled = await Geolocator.isLocationServiceEnabled();
        if (!serviceEnabled) {
            return Future.error("Location services are disabled");
        }

        permission = await Geolocator.checkPermission();
        if (permission == LocationPermission.denied) {
            permission = await Geolocator.requestPermission();
            if (permission == LocationPermission.denied) {
                return Future.error("Location permission are denied");
            }
        }

        if (permission == LocationPermission.deniedForever) {
            return Future.error(
                'Location permissions are permanently denied, we cannot request permissions.',
            );
        }

        Position position = await Geolocator.getCurrentPosition();

        List<Placemark> placemarks = await placemarkFromCoordinates(
            position.latitude,
            position.longitude,
        );

        final String city = placemarks[0].administrativeArea ?? "";

        return city;
    }

    Future<List<WeatherModel>> getWeatherData() async {
        final String currentLocation = await _getLocation();

        final String url =
            "https://api.collectapi.com/weather/getWeather?data.lang=tr&data.city=${currentLocation}";

        final Map<String, String> headers = {
            "authorization": "apikey 59eIsJoogZMRNKxj1aHMUX:7CDxuU8lXKSspPIeyKBfeM",
            "content-type": "application/json",
        };

        final dio = Dio();

        final response = await dio.get(url, options: Options(headers: headers));

        final List list = response.data["result"];
        final List<WeatherModel> weatherList =
            list.map((e) => WeatherModel.fromJson(e)).toList();

        return weatherList;
    }
}
