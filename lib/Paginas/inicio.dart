import 'package:flutter/material.dart';
import 'package:flutter_application_1/Paginas/disability_selection_screen.dart';
import 'custom_bottom_nav.dart'; // Asegúrate de que esta ruta sea correcta.

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Lógica de navegación basada en el índice
    if (index == 0) {
      Navigator.popUntil(context, ModalRoute.withName('/'));
    } else if (index == 1) {
      Navigator.pushNamed(context, '/reports');
    } else if (index == 2) {
      Navigator.pushNamed(context, '/settings');
    } else if (index == 3) {
      Navigator.pushNamed(context, '/help');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('Menú Principal'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            _buildMenuOption(
              context,
              icon: Icons.accessibility,
              label: 'PANAS',
              color: Colors.blue[100]!,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DisabilitySelectionScreen(),
                  ),
                );
              },
            ),
            _buildMenuOption(
              context,
              icon: Icons.bar_chart,
              label: 'Reportes',
              color: Colors.green[100]!,
              onTap: () {
                // Acción cuando se presione el botón de Reportes
                Navigator.pushNamed(context, '/reports');
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNav(
        selectedIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildMenuOption(BuildContext context,
      {required IconData icon,
      required String label,
      required Color color,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.black87),
            const SizedBox(height: 10),
            Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
