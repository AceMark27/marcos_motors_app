import 'package:flutter/material.dart';
import '../models/carro.dart';
import '../widgets/car_card.dart';

class CarGrid extends StatelessWidget {
  final List<Carro> cars;

  CarGrid(this.cars);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: cars.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (ctx, i) => CarCard(car: cars[i]),
    );
  }
}
