import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DraggableScrollableSheet Demo',
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

/// Use case: a maps / ride-hailing screen.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // A Stack so the sheet can later be layered on top of this background.
      body: Stack(
        children: [
          // The background that stays visible behind the sheet.
          Container(
            color: Colors.green.shade100,
            child: const Center(
              child: Text('MAP', style: TextStyle(fontSize: 40)),
            ),
          ),
        ],
      ),
    );
  }
}
