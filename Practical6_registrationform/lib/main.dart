import 'package:flutter/material.dart';

//Registration form
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Registration",
    home: RegistrationPage(),
  ));
}

class RegistrationPage extends StatelessWidget {
  // const RegistrationPage({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration Form"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Name";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Email";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'MobileNumber',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Mobile Number";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 16.0,
                ),
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
                  decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Password";
                    } else if (value.length < 8) {
                      return "Password must be of length 8.";
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
                        backgroundColor: Colors.black,
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
