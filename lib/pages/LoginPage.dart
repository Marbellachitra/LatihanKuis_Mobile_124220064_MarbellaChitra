import 'package:flutter/material.dart';
import 'HomePage.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _username = "";
  String? _nickname;
  String _password = "";
  bool isClicked = false;

  // Function to navigate to the Home page
  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 2), () {});
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => HomePage(
              username: _username,
              nickname: _nickname)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 131, 156, 237), // Ganti dengan warna yang Anda inginkan
        ),

          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40),
                  _usernameField(),
                  SizedBox(height: 20),
                  _passwordField(),
                  SizedBox(height: 20),
                  _nicknameField(),
                  SizedBox(height: 20),
                  _loginButton(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _usernameField() {
    return TextFormField(
      enabled: true,
      onChanged: (value) {
        _username = value;
      },
      decoration: InputDecoration(
        hintText: 'Masukkan Username',
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      ),
    );
  }

  Widget _passwordField() {
    return TextFormField(
      enabled: true,
      obscureText: true,
      onChanged: (value) {
        _password = value;
      },
      decoration: InputDecoration(
        hintText: 'Masukkan Password',
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide.none,
        ),
        suffixIcon: IconButton(
          onPressed: () {
            print('mata');
          },
          icon: Icon(Icons.remove_red_eye),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      ),
    );
  }

  Widget _nicknameField() {
    return TextFormField(
      enabled: true,
      onChanged: (value) {
        _nickname = value;
      },
      decoration: InputDecoration(
        hintText: 'Masukkan Panggilan',
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: isClicked
            ? MaterialStateProperty.all(Colors.green)
            : MaterialStateProperty.all(const Color.fromARGB(255, 229, 210, 142)),
        padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 15)),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        )),
      ),
      onPressed: () {
        if (_username == "flutter" && _password == "mobile") {
          _navigateToHome();

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Login Berhasil'),
            ),
          );
          setState(() {
            isClicked = !isClicked;
            print(isClicked);
          });
        }
      },
      child: const Text(
        'Login',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
