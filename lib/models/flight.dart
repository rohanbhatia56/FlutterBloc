// models/flight.dart
class Flight {
  final String from;
  final String to;
  final String time;

  Flight(this.from, this.to, this.time);

  factory Flight.fromJson(Map<String, dynamic> json) {
    return Flight(
      json['from'],
      json['to'],
      json['time'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'from': from,
      'to': to,
      'time': time,
    };
  }
}
