import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

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
    return _buildInputField(controller: nameController, label: 'Nombre');
  }

  Widget _lastNameInput() {
    return _buildInputField(controller: lastNameController, label: 'Apellido');
  }

  Widget _idInput() {
    return _buildInputField(controller: idController, label: 'Cédula', keyboardType: TextInputType.number);
  }

  Widget _usernameInput() {
    return _buildInputField(controller: usernameController, label: 'Nombre de usuario');
  }

  Widget _emailInput() {
    return _buildInputField(controller: emailController, label: 'Correo electrónico', keyboardType: TextInputType.emailAddress);
  }

  Widget _passwordInput() {
    return _buildInputField(controller: passwordController, label: 'Contraseña', obscureText: true);
  }

  Widget _confirmPasswordInput() {
    return _buildInputField(controller: confirmPasswordController, label: 'Confirmar contraseña', obscureText: true);
  }

  Widget _addressInput() {
    return _buildInputField(controller: addressController, label: 'Dirección');
  }

  Widget _phoneInput() {
    return _buildInputField(controller: phoneController, label: 'Teléfono', keyboardType: TextInputType.phone);
  }

  Widget _registerButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        await _registerUser(context);
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
    required TextEditingController controller,
    required String label,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
  }) {
    return TextField(
      controller: controller,
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

  Future<void> _registerUser(BuildContext context) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // Guardar datos en Realtime Database
      DatabaseReference ref = FirebaseDatabase.instance.ref("usuarios/${credential.user?.uid}");
      await ref.set({
        "nombre": nameController.text,
        "apellido": lastNameController.text,
        "cedula": idController.text,
        "nombre_usuario": usernameController.text,
        "correo": emailController.text,
        "direccion": addressController.text,
        "telefono": phoneController.text,
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('La contraseña proporcionada es demasiado débil.');
      } else if (e.code == 'email-already-in-use') {
        print('Ya existe una cuenta con ese correo.');
      }
    } catch (e) {
      print(e);
    }
  }
}
