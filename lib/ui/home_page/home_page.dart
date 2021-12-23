import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pagination/service/model/passenger.dart';
import 'package:flutter_pagination/ui/home_page/home_page_wm.dart';
import 'package:flutter_pagination/ui/home_page/widgets/passenger_tile.dart';

class HomePage extends ElementaryWidget<HomePageWM> {
  const HomePage({Key? key}) : super(homePageWMFactory, key: key);

  @override
  Widget build(HomePageWM wm) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagination App'),
      ),
      body: EntityStateNotifierBuilder<List<Passenger>>(
        listenableEntityState: wm.passengersState,
        builder: (_, passengers) {
          if(passengers == null) {
            return const Text('error');
          }

          return ListView.builder(
            itemCount: passengers.length,
            itemBuilder: (_, index) {
              return PassengerTile(passenger: passengers[index]);
            },
          );
        },
      ),
    );
  }
}
