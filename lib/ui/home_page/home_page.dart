import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pagination/service/model/passenger.dart';
import 'package:flutter_pagination/ui/home_page/home_page_wm.dart';
import 'package:flutter_pagination/ui/home_page/widgets/passengers_list.dart';

class HomePage extends ElementaryWidget<HomePageWM> {
  const HomePage({Key? key}) : super(homePageWMFactory, key: key);

  @override
  Widget build(HomePageWM wm) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Pagination App'),
        ),
        body: Column(
          children: [
            Expanded(
              child: EntityStateNotifierBuilder<List<Passenger>>(
                listenableEntityState: wm.passengersState,
                loadingBuilder: (_, passengers) {
                  return PassengersList(
                    scrollController: wm.scrollController,
                    passengers: passengers?? [],
                  );
                },
                builder: (_, passengers) {
                  if (passengers == null) {
                    return const Text('error');
                  }

                  return PassengersList(
                    scrollController: wm.scrollController,
                    passengers: passengers,
                  );
                },
              ),
            ),
            EntityStateNotifierBuilder<List<Passenger>>(
              listenableEntityState: wm.passengersState,
              loadingBuilder: (_, __) {
                return Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator(),
                );
              },
              builder: (_, __) {
                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
