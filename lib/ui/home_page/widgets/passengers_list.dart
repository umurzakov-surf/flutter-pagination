import 'package:flutter/material.dart';
import 'package:flutter_pagination/service/model/passenger.dart';
import 'package:flutter_pagination/ui/home_page/widgets/passenger_tile.dart';

class PassengersList extends StatelessWidget {
  final ScrollController scrollController;
  final List<Passenger> passengers;

  const PassengersList({
    Key? key,
    required this.scrollController,
    required this.passengers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      itemCount: passengers.length,
      itemBuilder: (_, index) {
        return PassengerTile(
          passenger: passengers[index],
          index: index,
        );
      },
    );
  }
}
