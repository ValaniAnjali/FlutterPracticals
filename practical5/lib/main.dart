import 'package:flutter/material.dart';

//login form
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Login",
    home: LoginPage(),
  ));
}

class LoginPage extends StatelessWidget {
  // const LoginPage({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Form"),
        backgroundColor: Colors.tealAccent,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'UserName',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Username";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: "p",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Password";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 16.0,
                ),
                Container(
                  height: 50.0,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: _submitForm,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        foregroundColor: Colors.white,
                      ),
                      child: Text("Submit")),
                ),
              ],
            )),
      ),
    );
  }
}
