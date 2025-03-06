import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stockvision_app/feature/splash/presentation/view_model/splash_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    context.read<SplashCubit>().init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Light background for a fresh look
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Add a food-related image (you could use a logo, or an image of a dish)
            Image.asset(
              'assets/images/2.png', // Update with a suitable recipe app logo
              height: 120,
              width: 120,
            ),
            const SizedBox(height: 30),
            // App Name with a soft, friendly font style
            const Text(
              'CookBook',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.orangeAccent, // Playful color
                fontFamily:
                    'Nunito', // Use a rounded and modern font for a cozy feel
              ),
            ),
            const SizedBox(height: 10),
            // Tagline with a lighter font weight and color
            Text(
              'Your Recipe Companion',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[700],
                fontFamily: 'Nunito', // Same font family for consistency
              ),
            ),
            const SizedBox(height: 40),
            // A food-related icon like a fork and spoon can enhance the theme
            const Icon(
              Icons.restaurant_menu,
              size: 50,
              color: Colors.orangeAccent,
            ),
            const SizedBox(height: 20),
            // Soft text or progress indicator (optional)
            const CircularProgressIndicator(
              color: Colors.orangeAccent,
            ),
          ],
        ),
      ),
    );
  }
}
