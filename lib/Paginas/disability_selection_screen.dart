import 'package:flutter/material.dart';
// Importa las ventanas a las que deseas navegar
import 'package:flutter_application_1/Paginas/PreguntasVisual/visual.dart';

class DisabilitySelectionScreen extends StatelessWidget {
  const DisabilitySelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Define el color directamente aquí
    final Color primaryColor = Colors.blueAccent;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('PANAS'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'logout') {
                Navigator.pushNamed(context, '/login');
              }
            },
            itemBuilder: (BuildContext context) {
              return {'Cerrar sesión'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 10),
                Text(
                  '¿Qué discapacidad presenta?',
                  style: TextStyle(
                    fontSize: 20,
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  _buildOptionCard(
                    context,
                    'Visual',
                    'assets/imagenes/visual_icon.png',
                    primaryColor,
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => QuestionScreen()),
                      );
                    },
                  ),
                  _buildOptionCard(
                    context,
                    'Auditiva',
                    'assets/imagenes/auditiva_icon.png',
                    primaryColor,
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => QuestionScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionCard(BuildContext context, String title, String iconPath,
      Color primaryColor, VoidCallback onTap) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(iconPath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
