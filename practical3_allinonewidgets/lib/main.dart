import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter Widgets Example by: Anjali"),
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          // Wrap the Column widget with SingleChildScrollView
          child: Column(
            children: [
              // Text Widget
              const Text(
                "This is the body section example of text widget",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.cyan,
                  overflow: TextOverflow.ellipsis,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 20), // Spacer

              // TextField Widget
              Padding(
                padding: const EdgeInsets.all(
                    16.0), // Add padding around the TextField
                child: const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your text here',
                    hintText: 'Enter Name i.e. (Anjali)',
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // Icon Widget
              const Icon(Icons.diamond, size: 50.0, color: Colors.blue),

              const SizedBox(height: 10),

              // Row Widget
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Text("Row Widget"),
                  Text("Lion"),
                  Text("Fox"),
                  Text("Tiger"),
                ],
              ),

              const SizedBox(height: 10),

              // Container Widget
              Container(
                width: 100,
                height: 100,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.orange, Colors.yellow, Colors.lime],
                  ),
                  shape: BoxShape.circle,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.blueAccent,
                      blurRadius: 15,
                      offset: Offset(10.0, 2.0),
                    )
                  ],
                ),
                child: const Text("Hello from Container"),
              ),

              const SizedBox(height: 10),

              // Column Widget
              Column(
                children: const [
                  Text('Anjali',
                      style: TextStyle(color: Colors.orange, fontSize: 30)),
                  Text('Aradhana'),
                  Text('Sneha'),
                ],
              ),

              const SizedBox(height: 10),

              // Image Widget
              SizedBox(
                width: 100,
                height: 100,
                child: Image.asset('assets/bird.png'),
              ),

              const SizedBox(height: 10),

              // RichText Widget
              RichText(
                text: const TextSpan(
                  style: TextStyle(fontSize: 20, color: Colors.black),
                  children: [
                    TextSpan(text: 'This is '),
                    TextSpan(
                      text: 'RichText ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                    TextSpan(text: 'Example.'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
