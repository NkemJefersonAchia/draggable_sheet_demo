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
/// The map stays visible while the list of nearby rides can be dragged
/// up to browse or pushed down out of the way.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // A Stack puts the sheet on top of the background.
      body: Stack(
        children: [
          // The background that stays visible behind the sheet.
          Container(
            color: Colors.green.shade100,
            child: const Center(
              child: Text('MAP', style: TextStyle(fontSize: 40)),
            ),
          ),

          // ----- The widget being presented -----
          DraggableScrollableSheet(
            // 1. Size the sheet takes when the screen first opens (30%).
            initialChildSize: 0.3,

            // 2. Smallest size it can be dragged down to (15%).
            minChildSize: 0.15,

            // 3. Largest size it can be dragged up to (90%).
            maxChildSize: 0.9,

            builder: (context, scrollController) {
              return Container(
                color: Colors.white,
                // The controller from the builder MUST go into the
                // scrollable child. It is what links scrolling the list
                // and dragging the sheet into one gesture.
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: const Icon(Icons.directions_car),
                      title: Text('Ride ${index + 1}'),
                      subtitle: Text('${index + 2} min away'),
                      trailing: Text('RWF ${(index + 1) * 500}'),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
