import 'package:flutter/material.dart';
import 'package:reddit/signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController;
  TextEditingController _passwordController;
  bool _passwordVisibility = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log in'),
        actions: [
          TextButton(
            child: const Text('Sign Up'),
            style: TextButton.styleFrom(
              primary: Colors.white,
            ),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => SignupPage()));
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.remove_red_eye,
                    color: (_passwordVisibility
                        ? Colors.deepOrange
                        : Colors.black),
                  ),
                  onPressed: () {
                    setState(() {
                      _passwordVisibility = !_passwordVisibility;
                    });
                  },
                ),
              ),
              obscureText: !_passwordVisibility,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 50,
          child:
              ElevatedButton(child: const Text('Continue'), onPressed: () {}),
        ),
      ),
    );
  }
}
