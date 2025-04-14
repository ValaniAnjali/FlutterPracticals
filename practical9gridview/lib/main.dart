import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GridView App',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      debugShowCheckedModeBanner: false,
      home: GridViewScreen(),
    );
  }
}

class GridViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GridView Example"),
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 1.0,
          ),
          itemCount: 20,
          itemBuilder: (context, index) {
            return GridItem(
              index: index,
            );
          },
        ),
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  final int index;
  const GridItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Center(
        child: Text(
          "Item $index",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}
