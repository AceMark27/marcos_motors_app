import 'package:flutter/material.dart';
import '../models/carro.dart';

class CarCard extends StatelessWidget {
  final Carro car;

  CarCard({required this.car});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.asset(car.imagemPath),
          Text(car.nome),
          Text('\$${car.preco}'),
        ],
      ),
    );
  }
}
