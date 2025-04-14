import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FirstScreen extends StatelessWidget {
  // const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FirstScreen"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.black45),
            child: Text("Go To Second Screen")),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  // const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SecondScreen"),
        backgroundColor: Colors.black26,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.black,
            ),
            child: Text("Go to First Screen")),
      ),
    );
  }
}
