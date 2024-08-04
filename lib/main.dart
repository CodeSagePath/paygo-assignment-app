import 'package:firebase_core/firebase_core.dart';
import 'package:paygo_app/firebase_options.dart';
import 'package:paygo_app/screens/bottom_navigation_bar.dart';
import 'package:paygo_app/screens/home_page.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Firebase with the default options
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const AppInitializer());
}

class AppInitializer extends StatefulWidget {
  const AppInitializer({super.key});

  @override
  State<AppInitializer> createState() => _AppInitializerState();
}

class _AppInitializerState extends State<AppInitializer> {
  @override
  void initState() {
    super.initState();
    // Additional initialization if needed
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to PayGo',
      home: const CustomBottomNavBar(),
      routes: {
        // Ensure route names are correctly defined
        '/bottomNavigationBar': (context) => const CustomBottomNavBar(),
        '/homeView': (context) => const Home(),
      },
    );
  }
}

class CustomPageRoute extends MaterialPageRoute {
  @override
  Duration get transitionDuration => const Duration(milliseconds: 1000);

  CustomPageRoute({required WidgetBuilder builder}) : super(builder: builder);
}
