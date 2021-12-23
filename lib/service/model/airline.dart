import 'package:json_annotation/json_annotation.dart';

part 'airline.g.dart';

@JsonSerializable()
class Airline {
  final int id;
  final String name;
  final String country;
  final String logo;
  final String slogan;
  @JsonKey(name: 'head_quaters')
  final String headQuaters;
  final String website;
  final String established;

  Airline({
    required this.id,
    required this.name,
    required this.country,
    required this.logo,
    required this.slogan,
    required this.headQuaters,
    required this.website,
    required this.established,
  });

  factory Airline.fromJson(Map<String, dynamic> json) =>
      _$AirlineFromJson(json);

  Map<String, dynamic> toJson() => _$AirlineToJson(this);
}
