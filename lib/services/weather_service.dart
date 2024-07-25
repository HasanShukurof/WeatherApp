import 'package:dio/dio.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:request_api/models/wheather_model.dart';

class WeatherService {
  Future<String> _getLocation() async {
    final bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      Future.error("Servis Lokation Baglidir");
    }

    // Istifadecinin Location icazesini kontrol etdik
    LocationPermission permission = await Geolocator.checkPermission();

    // Eger icazesi yoxdursa , icaze istedik
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        Future.error("Icaze Vermelisiniz Location Ucun");
      }
    }

    // Istifadecinin position-unu aldiq
    final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    // Istifadecinin xeritedeki positionunun isharetli oldugu yeri aldiq
    final List<Placemark> placemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    // Istifadecinin sheherini aldiq
    final String? city = placemark[0].administrativeArea;

    if (city == null) Future.error("Xeta Bash Vedi");

    return city!;
  }

  Future<List<WheatherModel>> getWheatherData() async {
    final String city = await _getLocation();
    final String url = "https://api.collectapi.com/weather/getWeather?data.lang=tr&data.city=$city ";
    const Map<String,dynamic> headers = {
      "authorization": "apikey 446J3Im4g4BjfXZEAxBdhk:3CZ3ZfwY88ok51Nci0Jlj7",
      "content-type": "application/json"
    };
    final dio = Dio();
    final response = await dio.get(url,options: Options(headers: headers),);
    if(response.statusCode != 200) return Future.error("Xeta Bash Verdi");

    final List list = response.data['result'];
    final List<WheatherModel> wheatherList = list.map((e) => WheatherModel.fromJson(e)).toList();


    return wheatherList;
  }
}
