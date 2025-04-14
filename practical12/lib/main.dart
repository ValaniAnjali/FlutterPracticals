import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'User.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Info App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: UserListScreen(),
    );
  }
}

class UserListScreen extends StatefulWidget {
  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  late Future<List<User>> users;

  @override
  void initState() {
    super.initState();
    users = fetchUsers();
  }

  Future<List<User>> fetchUsers() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((user) => User.fromJson(user)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users List'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: FutureBuilder<List<User>>(
        future: users,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              padding: EdgeInsets.all(12),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                User user = snapshot.data![index];
                return Card(
                  elevation: 4,
                  margin: EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.name,
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 6),
                        Row(
                          children: [
                            Icon(Icons.person, size: 16, color: Colors.grey[700]),
                            SizedBox(width: 6),
                            Text(user.username),
                          ],
                        ),
                        SizedBox(height: 6),
                        Row(
                          children: [
                            Icon(Icons.email, size: 16, color: Colors.grey[700]),
                            SizedBox(width: 6),
                            Text(user.email),
                          ],
                        ),
                        SizedBox(height: 6),
                        Row(
                          children: [
                            Icon(Icons.phone, size: 16, color: Colors.grey[700]),
                            SizedBox(width: 6),
                            Text(user.phone),
                          ],
                        ),
                        SizedBox(height: 6),
                        Row(
                          children: [
                            Icon(Icons.web, size: 16, color: Colors.grey[700]),
                            SizedBox(width: 6),
                            Text(user.website),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
