import 'package:flutter/material.dart';

class CustomBottomNav extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const CustomBottomNav(
      {super.key, required this.selectedIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor:
          Colors.blue[900], // Fondo más oscuro para el BottomNavigationBar
      selectedItemColor: Colors.black, // Íconos seleccionados en blanco
      unselectedItemColor:
          Colors.grey[400], // Íconos no seleccionados en gris claro
      currentIndex: selectedIndex,
      onTap: onTap,
      elevation: 10, // Elevación para darle más visibilidad a la barra inferior
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home), // Icono de la casita
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bar_chart), // Icono para reportes
          label: 'Reportes',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings), // Icono de configuración
          label: 'Configuración',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.help), // Icono de ayuda
          label: 'Ayuda',
        ),
      ],
    );
  }
}
