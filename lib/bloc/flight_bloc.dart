// bloc/flight_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/flight.dart';
import '../repositories/flight_repository.dart';

abstract class FlightEvent {}
class LoadFlights extends FlightEvent {}
class BookFlight extends FlightEvent {
  final Flight flight;
  BookFlight(this.flight);
}

abstract class FlightState {}
class FlightLoading extends FlightState {}
class FlightLoaded extends FlightState {
  final List<Flight> flights;
  FlightLoaded(this.flights);
}

class FlightBloc extends Bloc<FlightEvent, FlightState> {
  final FlightRepository flightRepository;

  FlightBloc(this.flightRepository) : super(FlightLoading()) {
    on<LoadFlights>((event, emit) async {
      final flights = await flightRepository.fetchFlights();
      emit(FlightLoaded(flights));
    });

    on<BookFlight>((event, emit) {
      flightRepository.bookFlight(event.flight);
    });
  }
}