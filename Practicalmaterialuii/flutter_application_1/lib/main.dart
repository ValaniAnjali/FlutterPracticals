import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Demo_MaterialUi',
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent,
      child: Text(
        'Hello Flutter',
        style: TextStyle(color: Colors.yellow),   
      ),
    );
  }
}
