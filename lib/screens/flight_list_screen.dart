// screens/flight_list_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/flight_bloc.dart';
import '../models/flight.dart';

class FlightListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("flight Booking")),
      body: BlocBuilder<FlightBloc, FlightState>(
        builder: (context, state) {
          if (state is FlightLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is FlightLoaded) {
            return ListView.builder(
              itemCount: state.flights.length,
              itemBuilder: (context, index) {
                final flight = state.flights[index];
                return ListTile(
                  title: Text("${flight.from} to ${flight.to}"),
                  subtitle: Text("Departure: ${flight.time}"),
                  trailing: ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<FlightBloc>(context).add(BookFlight(flight));
                    },
                    child: Text("Book"),
                  ),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}