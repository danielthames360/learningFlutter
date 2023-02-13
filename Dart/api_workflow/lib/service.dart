import 'package:http/http.dart' as http;

import 'classes/reqres_response.dart';
import 'classes/country.dart' as c;

void getPeople() async {
  final url = Uri.https('reqres.in', '/api/users', {'page': '2'});
  final response = await http.get(url);
  // final body = jsonDecode(response.body);
  final reqResponse = reqResResponseFromJson(response.body);
  // print('Url: $url');
  // print('Response: $body');
  // print("Page: ${body['page']}");
  // print("Per page: ${body['per_page']}");
  // print("Third element id: ${body['data'][2]['id']}");

  print(reqResponse.data[2].firstName);
}

void getCountries() async {
  final url = Uri.https('restcountries.com', 'v2/alpha/col');
  final response = await http.get(url);

  final countryResponse = c.countryFromJson(response.body);

  generateSeparators();
  print("Country: ${countryResponse.name}");
  print("Population: ${countryResponse.population}");
  print("Borders:");
  countryResponse.borders.forEach((f) => print('    $f'));
  print("Languages: ${countryResponse.languages.first.name}");
  print("Latitude: ${countryResponse.latlng.first}");
  print("Longitude: ${countryResponse.latlng.last}");
  print("Currency: ${countryResponse.currencies.first.name}");
  print("Flag: ${countryResponse.flag}");

  generateSeparators();
}

void generateSeparators() => print("===========================");
