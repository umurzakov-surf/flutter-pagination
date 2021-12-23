import 'package:flutter_pagination/service/model/airline.dart';
import 'package:json_annotation/json_annotation.dart';

part 'passenger.g.dart';

@JsonSerializable()
class Passenger {
  @JsonKey(name: '_id')
  final String id;
  final String name;
  final int trips;
  final List<Airline> airline;

  Passenger({
    required this.id,
    required this.name,
    required this.trips,
    required this.airline,
  });

  factory Passenger.fromJson(Map<String, dynamic> json) =>
      _$PassengerFromJson(json);

  Map<String, dynamic> toJson() => _$PassengerToJson(this);
}
