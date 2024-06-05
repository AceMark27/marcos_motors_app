import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/car_provider.dart';
import '../widgets/car_card.dart';
import '../screens/models_screen.dart';
import '../screens/cart_screen.dart';
import '../screens/add_car_screen.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (_selectedIndex != index) {
      setState(() {
        _selectedIndex = index;
      });
      if (index == 0) {
        Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
      } else if (index == 1) {
        Navigator.of(context).pushReplacementNamed(ModelsScreen.routeName);
      } else if (index == 2) {
        Navigator.of(context).pushReplacementNamed(CartScreen.routeName);
      } else if (index == 3) {
        Navigator.of(context).pushReplacementNamed(AddCarScreen.routeName);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final carProvider = Provider.of<CarProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Marcos Motors'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (carProvider.carros.isNotEmpty)
              CarouselSlider(
                items: carProvider.carros.map((carro) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset(carro.imagemPath, fit: BoxFit.cover),
                        ),
                      );
                    },
                  );
                }).toList(),
                options: CarouselOptions(
                  height: 300.0,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 4),
                  enlargeCenterPage: true,
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Bem-vindo à Marcos Motors!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Encontre o carro dos seus sonhos com a melhor qualidade e preço do mercado.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Nossos Modelos',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 250,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: carProvider.carros.length,
                      itemBuilder: (ctx, i) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CarCard(car: carProvider.carros[i]),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Stack(
                    children: [
                      Image.asset(
                        'assets/images/inspirational_car.png',
                        fit: BoxFit.cover,
                        height: 200,
                        width: double.infinity,
                      ),
                      Positioned(
                        bottom: 20,
                        left: 20,
                        child: Text(
                          'A liberdade de dirigir está a um passo de você.',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            backgroundColor: Colors.black54,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(ModelsScreen.routeName);
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.red,
                    ),
                    child: Text('Ver Modelos'),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Destaques',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 250,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: carProvider.carros.length,
                      itemBuilder: (ctx, i) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CarCard(car: carProvider.carros[i]),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Ofertas Especiais',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 250,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: carProvider.carros.length,
                      itemBuilder: (ctx, i) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CarCard(car: carProvider.carros[i]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        backgroundColor: Colors.blueGrey,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car),
            label: 'Modelos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Carrinho',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Adicionar Carro',
          ),
        ],
      ),
    );
  }
}
