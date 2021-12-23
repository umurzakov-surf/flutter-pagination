import 'package:flutter/material.dart';
import 'package:flutter_pagination/service/model/passenger.dart';

class PassengerTile extends StatelessWidget {
  final Passenger passenger;

  const PassengerTile({Key? key, required this.passenger}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(passenger.name),
    );
  }
}
