import 'package:flutter/material.dart';
import 'package:marcos_motors/screens/add_car_screen.dart';
import 'package:marcos_motors/screens/cart_screen.dart';
import 'package:provider/provider.dart';
import './screens/home_screen.dart';
import './screens/models_screen.dart';
import './screens/car_detail_screen.dart';
import './screens/cart_screen.dart' as cart_screen;
import './screens/add_car_screen.dart' as add_car_screen;
import './providers/car_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (ctx) => CarProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marcos Motors',
      theme: ThemeData(
        primaryColor: Colors.red,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.red,
          secondary: Colors.redAccent,
        ),
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.black),
          bodyMedium: TextStyle(color: Colors.black),
        ),
      ),
      initialRoute: HomeScreen.routeName,
        routes: {
          HomeScreen.routeName: (ctx) => HomeScreen(),
          ModelsScreen.routeName: (ctx) => ModelsScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          AddCarScreen.routeName: (ctx) => AddCarScreen(),
          '/car-detail': (ctx) => CarDetailScreen(),
      },
    );
  }
}
