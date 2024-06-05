// lib/widgets/car_carousel.dart
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import '../providers/car_provider.dart';

class CarCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final carProvider = Provider.of<CarProvider>(context);
    final carros = carProvider.carros;

    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 4),
        height: 200.0,
      ),
      items: carros.map((carro) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(carro.imagemPath),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Text(
                  carro.nome,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    backgroundColor: Colors.black54,
                  ),
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
