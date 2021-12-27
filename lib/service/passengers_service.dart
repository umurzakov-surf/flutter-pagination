import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_pagination/service/model/passenger.dart';
import 'package:flutter_pagination/service/network/dio_service.dart';

class PassengersService {
  final Dio dio = DioService().getDio();

  Future<List<Passenger>> getPassengers(int page) async {
    final passengersResponse =
        await dio.get<String>('v1/passenger?size=20&page=$page');
    // ignore: avoid_print
    print(passengersResponse);
    final bodyJson =
        jsonDecode(passengersResponse.data ?? '') as Map<String, dynamic>;
    final passengerJson = bodyJson['data'] as List;

    return [
      for (final passenger in passengerJson)
        Passenger.fromJson(passenger as Map<String, dynamic>),
    ];
  }
}
