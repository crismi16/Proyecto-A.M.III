import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'Iniciar Sesión',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Inicia sesión para continuar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              _emailInput(),
              SizedBox(height: 10),
              _passwordInput(),
              SizedBox(height: 20),
              _loginButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _emailInput() {
    return TextField(
      controller: emailController,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelText: 'Correo electrónico',
        labelStyle: TextStyle(color: Colors.black),
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF27C4D9)),
        ),
      ),
    );
  }

  Widget _passwordInput() {
    return TextField(
      controller: passwordController,
      obscureText: true,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelText: 'Contraseña',
        labelStyle: TextStyle(color: Colors.black),
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF27C4D9)),
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Acción de inicio de sesión
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF27C4D9),
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        'Iniciar Sesión',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
