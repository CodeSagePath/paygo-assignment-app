import 'package:paygo_app/screens/bottom_navigation_bar.dart';
import 'package:paygo_app/screens/home_page.dart';
import 'package:paygo_app/screens/register_new_user.dart';
import 'package:paygo_app/utils/routes.dart';
import 'package:paygo_app/screens/add_product.dart';
import 'package:paygo_app/screens/register_view.dart';
import 'package:flutter/material.dart';

void main() async {
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
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to PayGo',
      home: const CustomBottomNavBar(),
      routes: {
        registerNewUser: (context) => RegisterUserPage(),
        bottomNavigationBar: (context) => const CustomBottomNavBar(),
        homeView: (context) => const Home(),
        registerView: (context) => const RegisterView(),
        addProduct: (context) => const AddProduct(),
      },
    );
  }
}

class CustomPageRoute extends MaterialPageRoute {
  @override
  Duration get transitionDuration => const Duration(milliseconds: 1000);

  CustomPageRoute({builder}) : super(builder: builder);
}
