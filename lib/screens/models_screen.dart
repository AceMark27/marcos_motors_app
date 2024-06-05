import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/car_provider.dart';
import '../widgets/car_card.dart';
import '../widgets/search_and_filter_bar.dart';
import '../screens/cart_screen.dart';
import '../screens/add_car_screen.dart';
import '../screens/home_screen.dart';

class ModelsScreen extends StatefulWidget {
  static const routeName = '/modelos';

  @override
  _ModelsScreenState createState() => _ModelsScreenState();
}

class _ModelsScreenState extends State<ModelsScreen> {
  String _searchQuery = '';
  int _selectedIndex = 1;
  
  get selected => null;
  
  void _updateSearchQuery(String newQuery) {
    setState(() {
      _searchQuery = newQuery;
    });
    Provider.of<CarProvider>(context, listen: false).filterCars(newQuery);
  }

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
    final filteredCarros = carProvider.filteredCarros.isNotEmpty
        ? carProvider.filteredCarros
        : carProvider.carros;
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Modelos'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          SearchAndFilterBar(onSearchChanged: _updateSearchQuery),
          Expanded(
            child: ListView.builder(
              itemCount: filteredCarros.length,
              itemBuilder: (ctx, i) => GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    '/car-detail',
                    arguments: filteredCarros[i].id,
                  );
                },
                child: CarCard(car: filteredCarros[i]),
              ),
            ),
          ),
        ],
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

