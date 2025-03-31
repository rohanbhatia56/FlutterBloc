// main.dart
import 'package:flightbookingflutterapp/repositories/flight_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/flight_bloc.dart';
import 'screens/flight_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => FlightRepository(),
      child: BlocProvider(
        create: (context) => FlightBloc(RepositoryProvider.of<FlightRepository>(context))..add(LoadFlights()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: FlightListScreen(),
        ),
      ),
    );
  }
}