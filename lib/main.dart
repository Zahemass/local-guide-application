import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:crowd_local_lens/screens/welcome_page.dart';
=======
import 'onboarding_screen/welcome_page.dart';
>>>>>>> b6342f831fc382dea66c101ab74520eda15b7f1f

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
<<<<<<< HEAD
      title: 'Liquid Glass Signup',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      home: const WelcomePage(),
    );
  }
}
=======
      debugShowCheckedModeBanner: false,
      title: 'Local Lens',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
      ),
      home: const WelcomePage(), // 👈 Replaced with your welcome screen
    );
  }
}
>>>>>>> b6342f831fc382dea66c101ab74520eda15b7f1f
