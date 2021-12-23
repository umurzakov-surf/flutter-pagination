import 'package:dio/dio.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pagination/service/model/passenger.dart';
import 'package:flutter_pagination/service/passengers_service.dart';
import 'package:flutter_pagination/ui/home_page/home_page.dart';
import 'package:flutter_pagination/ui/home_page/home_page_model.dart';

HomePageWM homePageWMFactory(BuildContext _) =>
    HomePageWM(HomePageModel(PassengersService()));

class HomePageWM extends WidgetModel<HomePage, HomePageModel> {
  final EntityStateNotifier<List<Passenger>> _passengersState =
      EntityStateNotifier(null);
  final int _currentPage = 0;

  ListenableState<EntityState<List<Passenger>>> get passengersState =>
      _passengersState;

  HomePageWM(HomePageModel model) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    _loadWeather();
  }

  Future<void> _loadWeather() async {
    final passengers = await model.getPassengers(_currentPage);
    _passengersState.content(passengers);
  }
}
