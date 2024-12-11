import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'Registro',
          style: TextStyle(
            color: Colors.white, 
            fontWeight: FontWeight.bold, 
          ),
        ),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
      ),

      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Crea una cuenta para comenzar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                _nameInput(),
                SizedBox(height: 10),
                _lastNameInput(),
                SizedBox(height: 10),
                _idInput(),
                SizedBox(height: 10),
                _usernameInput(),
                SizedBox(height: 10),
                _emailInput(),
                SizedBox(height: 10),
                _passwordInput(),
                SizedBox(height: 10),
                _confirmPasswordInput(),
                SizedBox(height: 10),
                _addressInput(),
                SizedBox(height: 10),
                _phoneInput(),
                SizedBox(height: 20),
                _registerButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _nameInput() {
    return _buildInputField(label: 'Nombre');
  }

  Widget _lastNameInput() {
    return _buildInputField(label: 'Apellido');
  }

  Widget _idInput() {
    return _buildInputField(label: 'Cédula', keyboardType: TextInputType.number);
  }

  Widget _usernameInput() {
    return _buildInputField(label: 'Nombre de usuario');
  }

  Widget _emailInput() {
    return _buildInputField(label: 'Correo electrónico', keyboardType: TextInputType.emailAddress);
  }

  Widget _passwordInput() {
    return _buildInputField(label: 'Contraseña', obscureText: true);
  }

  Widget _confirmPasswordInput() {
    return _buildInputField(label: 'Confirmar contraseña', obscureText: true);
  }

  Widget _addressInput() {
    return _buildInputField(label: 'Dirección');
  }

  Widget _phoneInput() {
    return _buildInputField(label: 'Teléfono', keyboardType: TextInputType.phone);
  }

  Widget _registerButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Acción de registro
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF27C4D9), // Fondo del botón
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        'Registrarse',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
  }) {
    return TextField(
      obscureText: obscureText,
      keyboardType: keyboardType,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelText: label,
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
}
