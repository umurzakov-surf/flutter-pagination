import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_pagination/service/model/passenger.dart';

const baseUrl = 'https://api.instantwebtools.net/';

class PassengersService {
  final dio = Dio(BaseOptions(baseUrl: baseUrl));

  Future<List<Passenger>> getPassengers(int page) async {
    final passengersResponse =
        await dio.get<String>('v1/passenger?size=20&page=$page');
    final bodyJson =
        jsonDecode(passengersResponse.data ?? '') as Map<String, dynamic>;
    final passengerJson = bodyJson['data'] as List;

    return [
      for (final passenger in passengerJson)
        Passenger.fromJson(passenger as Map<String, dynamic>),
    ];
  }
}
