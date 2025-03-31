import 'interfaces/flight_booking.dart';
import 'implementations/domestic_flight.dart';
import 'implementations/international_flight.dart';

typedef FlightCreator = FlightBooking Function();

class FlightBookingFactory {
  static final Map<String, FlightCreator> _flightRegistry = {};

  // Method to register new flight types dynamically
  static void registerFlight(String type, FlightCreator creator) {
    _flightRegistry[type] = creator;
  }

  // Method to create a flight dynamically
  static FlightBooking createFlight(String type) {
    final creator = _flightRegistry[type];
    if (creator != null) {
      return creator();
    } else {
      throw Exception("Invalid flight type: $type");
    }
  }
}

// Registering default flight types (can be done elsewhere in the app)
void registerDefaultFlights() {
  FlightBookingFactory.registerFlight("domestic", () => DomesticFlight());
  FlightBookingFactory.registerFlight("international", () => InternationalFlight());
}
