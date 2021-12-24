// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passenger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Passenger _$PassengerFromJson(Map<String, dynamic> json) => Passenger(
      id: json['_id'] as String,
      name: json['name'] as String?,
      trips: json['trips'] as int?,
      airline: (json['airline'] as List<dynamic>)
          .map((e) => Airline.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PassengerToJson(Passenger instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'trips': instance.trips,
      'airline': instance.airline,
    };
