import 'package:flutter/material.dart';
import 'package:marcos_motors/screens/cart_screen.dart';
import 'package:marcos_motors/screens/home_screen.dart';
import 'package:marcos_motors/screens/models_screen.dart';
import 'package:provider/provider.dart';
import '../providers/car_provider.dart';
import '../models/carro.dart';

class AddCarScreen extends StatefulWidget {
  static const routeName = '/add-car';

  @override
  _AddCarScreenState createState() => _AddCarScreenState();
}

class _AddCarScreenState extends State<AddCarScreen> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _formData = {
    'id': '',
    'nome': '',
    'descricao': '',
    'imagemPath': 'assets/images/default_car.png',
    'preco': '',
    'cor': '',
    'ano': '',
    'combustivel': '',
    'transmissao': '',
    'kilometragem': '',
    'outros': '',
  };

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Provider.of<CarProvider>(context, listen: false).addCar(
        Carro(
          id: DateTime.now().toString(),
          nome: _formData['nome'],
          descricao: _formData['descricao'],
          imagemPath: _formData['imagemPath'],
          preco: double.parse(_formData['preco']),
          cor: _formData['cor'],
          ano: int.parse(_formData['ano']),
          combustivel: _formData['combustivel'],
          transmissao: _formData['transmissao'],
          kilometragem: int.parse(_formData['kilometragem']),
          outros: _formData['outros'],
        ),
      );
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Novo Carro'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nome'),
                textInputAction: TextInputAction.next,
                onSaved: (value) {
                  _formData['nome'] = value!;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, insira um nome.';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Descrição'),
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                onSaved: (value) {
                  _formData['descricao'] = value!;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, insira uma descrição.';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Preço'),
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  _formData['preco'] = value!;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, insira um preço.';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Cor'),
                textInputAction: TextInputAction.next,
                onSaved: (value) {
                  _formData['cor'] = value!;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, insira uma cor.';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Ano'),
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  _formData['ano'] = value!;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, insira um ano.';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Combustível'),
                textInputAction: TextInputAction.next,
                onSaved: (value) {
                  _formData['combustivel'] = value!;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, insira o tipo de combustível.';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Transmissão'),
                textInputAction: TextInputAction.next,
                onSaved: (value) {
                  _formData['transmissao'] = value!;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, insira o tipo de transmissão.';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Kilometragem'),
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  _formData['kilometragem'] = value!;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, insira a kilometragem.';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Outros Detalhes'),
                textInputAction: TextInputAction.done,
                onSaved: (value) {
                  _formData['outros'] = value!;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, insira outros detalhes.';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveForm,
                child: const Text('Salvar Carro'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3,
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
