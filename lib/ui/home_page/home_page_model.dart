import 'package:elementary/elementary.dart';
import 'package:flutter_pagination/service/model/passenger.dart';
import 'package:flutter_pagination/service/passengers_service.dart';

class HomePageModel extends ElementaryModel {
  final PassengersService _passengersService;

  HomePageModel(this._passengersService);

  Future<List<Passenger>> getPassengers(int page) async {
    return _passengersService.getPassengers(page);
  }
}
