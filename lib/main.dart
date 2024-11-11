// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Paginas/Menu.dart';
import 'package:flutter_application_1/Paginas/inicio.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _dniController = TextEditingController();
  String _errorMessage = '';
  int _maxDigits = 8;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        if (_tabController.index == 0) {
          _maxDigits = 8; // DNI
          _dniController.clear();
        } else {
          _maxDigits = 10; // CE
          _dniController.clear();
        }
        _errorMessage = '';
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _dniController.dispose();
    super.dispose();
  }

  void _validateInput() {
    setState(() {
      if (_dniController.text.length != _maxDigits) {
        _errorMessage = 'Debe ser $_maxDigits dígitos';
      } else {
        _errorMessage = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 2, 13, 112),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          height: 400,
          width: 350,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Bienvenidos al programa SICONTIGO',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                'Por favor, seleccionar su tipo de documento.',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              TabBar(
                controller: _tabController,
                indicatorColor: Colors.blue,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                tabs: const [
                  Tab(text: 'DNI'),
                  Tab(text: 'CE'),
                ],
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _dniController,
                keyboardType: TextInputType.number,
                maxLength: _maxDigits,
                decoration: InputDecoration(
                  labelText:
                      'Ingrese número de ${_tabController.index == 0 ? "DNI" : "CE"}',
                  counterText: '', // Ocultar el contador de caracteres
                  errorText: _errorMessage.isNotEmpty ? _errorMessage : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onChanged: (value) {
                  if (value.length > _maxDigits) {
                    _dniController.text = value.substring(0, _maxDigits);
                    _dniController.selection = TextSelection.fromPosition(
                      TextPosition(offset: _dniController.text.length),
                    );
                  }
                  _validateInput();
                },
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  _validateInput();
                  if (_errorMessage.isEmpty) {
                    // Acción al presionar el botón si no hay error
                    print("Número válido: ${_dniController.text}");
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MenuScreen()));
                  }
                },
                child: Text('Ingresar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
