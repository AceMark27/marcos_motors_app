import 'package:flutter/material.dart';

class SearchAndFilterBar extends StatelessWidget {
  final Function(String) onSearchChanged;

  SearchAndFilterBar({required this.onSearchChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Buscar',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          suffixIcon: Icon(Icons.search),
        ),
        onChanged: onSearchChanged,
      ),
    );
  }
}
