import 'package:flutter/material.dart';
import '../models/carro.dart';
import '../widgets/car_card.dart';

class CarList extends StatelessWidget {
  final List<Carro> cars;

  CarList(this.cars);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cars.length,
      itemBuilder: (ctx, i) => CarCard(car: cars[i]),
    );
  }
}
