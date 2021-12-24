import 'package:flutter/material.dart';
import 'package:flutter_pagination/service/model/passenger.dart';

class PassengerTile extends StatelessWidget {
  final Passenger passenger;
  final int index;

  const PassengerTile({
    Key? key,
    required this.passenger,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text('${index + 1}', style: const TextStyle(fontSize: 24),),
      title: Text(passenger.name ?? 'NO NAME'),
      subtitle: Text(
        passenger.trips != null ? 'trips: ${passenger.trips}' : 'NO TRIPS',
      ),
    );
  }
}
