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
  final ScrollController scrollController = ScrollController();
  final EntityStateNotifier<List<Passenger>> _passengersState =
      EntityStateNotifier(null);

  ListenableState<EntityState<List<Passenger>>> get passengersState =>
      _passengersState;

  int _currentPage = 0;

  HomePageWM(HomePageModel model) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    scrollController.addListener(_scrollListener);
    _loadPassengers();
  }

  Future<void> _loadPassengers() async {
    try {
      final _previousData = _passengersState.value?.data?? [];
      _passengersState.loading(_previousData);
      final passengers = await model.getPassengers(_currentPage);
      _passengersState.content([..._previousData, ...passengers]);
    } on DioError catch (err) {
      _passengersState.error(err);
    }
  }

  void _scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      _currentPage++;
      _loadPassengers();
    }
  }
}
