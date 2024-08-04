import 'package:ezy_click_app/screens/bottom_navigation_bar.dart';
import 'package:ezy_click_app/screens/feature_pages/features_page.dart';
import 'package:ezy_click_app/screens/home_page.dart';
import 'package:ezy_click_app/screens/register_new_user.dart';
import 'package:ezy_click_app/utils/routes.dart';
import 'package:ezy_click_app/screens/add_product.dart';
import 'package:ezy_click_app/screens/business_register.dart';
import 'package:ezy_click_app/screens/otp_login_views/enter_otp.dart';
import 'package:ezy_click_app/screens/otp_login_views/login_with_otp.dart';
import 'package:ezy_click_app/screens/register_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  runApp(const AppInitializer());
}

class AppInitializer extends StatefulWidget {
  const AppInitializer({super.key});

  @override
  State<AppInitializer> createState() => _AppInitializerState();
}

class _AppInitializerState extends State<AppInitializer> {
  bool onboardingCompleted = false;
  bool hasValidSession = false;

  @override
  void initState() {
    super.initState();
    initializeApp();
  }

  Future<void> initializeApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    onboardingCompleted = prefs.getBool('onboardingCompleted') ?? false;
    hasValidSession = prefs.getBool('hasValidSession') ?? false;
    FlutterNativeSplash.remove();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to Ezy Click',
      home: onboardingCompleted
          ? (hasValidSession ? const Home() : const LoginMobileNumForm())
          : const FeatureIllustrationApp(),
      routes: {
        loginPage: (context) => const LoginMobileNumForm(),
        enterOtpView: (context) => const LoginOtpInpForm(),
        registerNewUser: (context) => RegisterUserPage(),
        bottomNavigationBar: (context) => CustomBottomNavBar(),
        homeView: (context) => const Home(),
        registerView: (context) => const RegisterView(),
        businessRegView: (context) => const BusinessRegistration(),
        addProduct: (context) => const AddProduct(),
        featurePages: (context) => const FeatureIllustrationApp(),
      },
    );
  }
}

class CustomPageRoute extends MaterialPageRoute {
  @override
  Duration get transitionDuration => const Duration(milliseconds: 1000);

  CustomPageRoute({builder}) : super(builder: builder);
}
