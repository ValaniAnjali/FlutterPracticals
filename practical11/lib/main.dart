import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(Practical11App());

class Practical11App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practical 11 - API Connection',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: ApiConnectPage(),
    );
  }
}

class ApiConnectPage extends StatefulWidget {
  @override
  _ApiConnectPageState createState() => _ApiConnectPageState();
}

class _ApiConnectPageState extends State<ApiConnectPage> {
  String _rawData = "Press the button to fetch data.";

  Future<void> fetchData() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/users');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        setState(() {
          _rawData = response.body;
        });
      } else {
        setState(() {
          _rawData = "Failed to load data. Status code: ${response.statusCode}";
        });
      }
    } catch (e) {
      setState(() {
        _rawData = "Error: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Connect to REST API'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Text(_rawData),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchData,
        child: Icon(Icons.cloud_download),
        tooltip: "Fetch Data",
      ),
    );
  }
}
