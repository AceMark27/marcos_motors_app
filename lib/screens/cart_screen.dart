import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/car_provider.dart';
import '../widgets/car_card.dart';
import '../screens/home_screen.dart';
import '../screens/models_screen.dart';
import '../screens/add_car_screen.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final carProvider = Provider.of<CarProvider>(context);
    final cartItems = carProvider.cartItems;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Carrinho'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: cartItems.isEmpty
          ? Center(
              child: Text(
                'Seu carrinho está vazio!',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            )
          : ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (ctx, index) {
              final cartItem = cartItems[index];
              return ListTile(
                title: Text(cartItem.nome),
                subtitle: Text('Preço: ${cartItem.preco}'),
                trailing: IconButton(
                  icon: Icon(Icons.remove_circle),
                  onPressed: () {
                    Provider.of<CarProvider>(context, listen: false).removeFromCart(cartItem.id);
                  },      
                ),
              );
            }
            ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        backgroundColor: Colors.blueGrey,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (index == 0) {
            Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
          } else if (index == 1) {
            Navigator.of(context).pushReplacementNamed(ModelsScreen.routeName);
          } else if (index == 2) {
            Navigator.of(context).pushReplacementNamed(CartScreen.routeName);
          } else if (index == 3) {
            Navigator.of(context).pushReplacementNamed(AddCarScreen.routeName);
          }
        },
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
