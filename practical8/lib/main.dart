import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: "ListView",
      debugShowCheckedModeBanner: false,
      home: ListViewPage(),
    ),
  );
}

class ListViewPage extends StatelessWidget {
  // const ListViewPage({super.key});
  List<String> products = [
    "Laptop",
    "TV",
    "Mobile",
    "AC",
    "MacBook",
    "Computer",
    "Smart Watch",
    "Washing Machine"
  ];

  List<String> productDetails = [
    "Various laptops",
    "Amazing Sony TV ",
    "Various brands mobile",
    "Cooler AC",
    "Best macbook",
    "All kind of computers",
    "Smartest people's choice",
    "Best quality wash"
  ];

  List<int> price = [10000, 20000, 30000, 5000, 20000, 4000, 1500, 6000];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Electronic Products",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.purple,
                child: Text(
                  products[index][0],
                  style: TextStyle(color: Colors.white),
                ),
              ),
              title: Text(products[index]),
              subtitle: Text(productDetails[index]),
              trailing: Text("₹ " + price[index].toString()),
            );
          },
        ),
      ),
    );
  }
}
