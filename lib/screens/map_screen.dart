import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final LatLng _center = LatLng(-33.796923, 151.144623); // Macquarie Park
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          // Flutter Map (cross-platform)
          FlutterMap(
            options: MapOptions(
              center: _center,
              zoom: 13.0,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.local_lens',
              ),
            ],
          ),

          // Glassmorphic Top Search Bar
          Positioned(
            top: 40,
            left: 16,
            right: 16,
            child: GlassmorphicContainer(
              width: double.infinity,
              height: 60,
              borderRadius: 20,
              blur: 20,
              alignment: Alignment.center,
              border: 1,
              linearGradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.2),
                  Colors.white38.withOpacity(0.2)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderGradient: LinearGradient(
                colors: [Colors.white24, Colors.white10],
              ),
              child: Row(
                children: [
                  const SizedBox(width: 12),
                  const Icon(Icons.menu, color: Colors.white),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: "Search places",
                        hintStyle: TextStyle(color: Colors.white70),
                        border: InputBorder.none,
                        icon: Icon(Icons.search, color: Colors.white),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  const Icon(Icons.settings, color: Colors.white),
                  const SizedBox(width: 12),
                ],
              ),
            ),
          ),

          // Floating Location Icon
          Positioned(
            bottom: 100,
            right: 20,
            child: FloatingActionButton(
              backgroundColor: Colors.white.withOpacity(0.8),
              child: const Icon(Icons.my_location, color: Colors.blueAccent),
              onPressed: () {
                // Optional: add functionality to center map
                print('Recenter tapped');
              },
            ),
          ),
        ],
      ),

      // Glassmorphic Bottom Navigation Bar
      bottomNavigationBar: GlassmorphicContainer(
        width: double.infinity,
        height: 70,
        borderRadius: 30,
        blur: 20,
        alignment: Alignment.bottomCenter,
        border: 1,
        linearGradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.2),
            Colors.white38.withOpacity(0.2)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderGradient: LinearGradient(
          colors: [Colors.white24, Colors.white10],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedItemColor: Colors.pinkAccent,
          unselectedItemColor: Colors.white70,
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.fastfood),
              label: 'Food',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.emoji_emotions),
              label: 'Fun',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.place),
              label: 'Hidden',
            ),
          ],
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}
