import 'package:flutter/material.dart';
import '../models/carro.dart';

class CarProvider with ChangeNotifier {
  List<Carro> _carros = [
    Carro(
      id: '1',
      nome: 'Toyota Corolla',
      descricao: 'Um sedan compacto de alta qualidade.',
      imagemPath: 'assets/images/corolla.png',
      preco: 20000,
      cor: 'Branco',
      ano: 2020,
      combustivel: 'Gasolina',
      transmissao: 'Automática',
      kilometragem: 15000,
      outros: 'Ar condicionado, ABS, Airbags',
    ),
    Carro(
      id: '2',
      nome: 'Toyota Hilux',
      descricao: 'Uma caminhonete robusta e potente.',
      imagemPath: 'assets/images/hilux.png',
      preco: 35000,
      cor: 'Preto',
      ano: 2019,
      combustivel: 'Diesel',
      transmissao: 'Manual',
      kilometragem: 40000,
      outros: '4x4, Ar condicionado, ABS, Airbags',
    ),
    // Adicionando mais dois modelos de carros
    Carro(
      id: '3',
      nome: 'Toyota Camry',
      descricao: 'Um sedan espaçoso e confortável.',
      imagemPath: 'assets/images/camry.png',
      preco: 30000,
      cor: 'Prata',
      ano: 2021,
      combustivel: 'Híbrido',
      transmissao: 'Automática',
      kilometragem: 5000,
      outros: 'Ar condicionado, ABS, Airbags, Sistema de navegação',
    ),
    Carro(
      id: '4',
      nome: 'Toyota RAV4',
      descricao: 'Um SUV versátil e eficiente.',
      imagemPath: 'assets/images/rav4.png',
      preco: 32000,
      cor: 'Azul',
      ano: 2022,
      combustivel: 'Gasolina',
      transmissao: 'Automática',
      kilometragem: 8000,
      outros: 'Ar condicionado, ABS, Airbags, Controle de tração',
    ),
  ];

  List<Carro> _filteredCarros = [];

  List<Carro> get carros {
    return [..._carros];
  }

  List<Carro> get filteredCarros {
    return [..._filteredCarros];
  }

  Carro findById(String id) {
    return _carros.firstWhere((carro) => carro.id == id);
  }

  void addCar(Carro carro) {
    _carros.add(carro);
    notifyListeners();
  }

  void filterCars(String query) {
    if (query.isEmpty) {
      _filteredCarros = _carros;
    } else {
      _filteredCarros = _carros.where((car) => car.nome.toLowerCase().contains(query.toLowerCase())).toList();
    }
    notifyListeners();
  }

  List<Carro> _cartItems = [];

  List<Carro> get cartItems {
    return [..._cartItems];
  }

  void addToCart(String id) {
    var car = _carros.firstWhere((car) => car.id == id);
    _cartItems.add(car);
    notifyListeners();
  }

  void removeFromCart(String id) {
    _cartItems.removeWhere((car) => car.id == id);
    notifyListeners();
  }
  
}