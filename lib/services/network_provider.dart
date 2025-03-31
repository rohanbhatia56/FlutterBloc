// services/network_provider.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/flight.dart';

class NetworkProvider {
  Future<List<Flight>> getFlights() async {
    final response = await http.get(Uri.parse("http://192.168.1.2:3000/flights"));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((flight) => Flight.fromJson(flight)).toList();
    } else {
      throw Exception("Failed to load flights");
    }
  }

  void bookFlight(Flight flight) async {
    await http.post(
      Uri.parse("https://api.example.com/book"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(flight.toJson()),
    );
  }
}