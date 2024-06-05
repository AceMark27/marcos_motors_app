import 'package:flutter/material.dart';
import 'package:marcos_motors/screens/add_car_screen.dart';
import 'package:marcos_motors/screens/cart_screen.dart';
import 'package:marcos_motors/screens/models_screen.dart';
import 'package:provider/provider.dart';
import '../providers/car_provider.dart';

class CarDetailScreen extends StatelessWidget {
  static const routeName = '/car-detail';

  @override
  Widget build(BuildContext context) {
    final carId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedCar = Provider.of<CarProvider>(context).findById(carId);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(selectedCar.nome),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                selectedCar.imagemPath,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200,
              ),
            ),
            SizedBox(height: 20),
            Text(
              selectedCar.nome,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              selectedCar.descricao,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Preço: \$${selectedCar.preco}',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Cor: ${selectedCar.cor}',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Ano: ${selectedCar.ano}',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Combustível: ${selectedCar.combustivel}',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Transmissão: ${selectedCar.transmissao}',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Kilometragem: ${selectedCar.kilometragem}',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Outros: ${selectedCar.outros}',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Provider.of<CarProvider>(context, listen: false)
                    .addToCart(selectedCar.id);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Adicionado ao carrinho!'),
                  ),
                );
              },
              child: Text('Adicionar ao Carrinho'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
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
            label: 'Adicionar',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.of(context).pushReplacementNamed('/');
          } else if (index == 1) {
            Navigator.of(context).pushReplacementNamed(ModelsScreen.routeName);
          } else if (index == 2) {
            Navigator.of(context).pushReplacementNamed(CartScreen.routeName);
          } else if (index == 3) {
            Navigator.of(context).pushReplacementNamed(AddCarScreen.routeName);
          }
        },
      ),
    );
  }
}
