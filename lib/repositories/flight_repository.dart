// repositories/flight_repository.dart
import '../models/flight.dart';
import '../services/network_provider.dart';

class FlightRepository {
  final NetworkProvider networkProvider = NetworkProvider();

  Future<List<Flight>> fetchFlights() async {
    return await networkProvider.getFlights();
  }

  void bookFlight(Flight flight) {
    networkProvider.bookFlight(flight);
  }
}