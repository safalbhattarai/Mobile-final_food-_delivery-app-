
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safall_final_mobile_app/app/di/di.dart';
import 'package:safall_final_mobile_app/feature/auth/presentation/view/registrationscreen_view.dart';
import 'package:safall_final_mobile_app/feature/auth/presentation/view_model/login/bloc/login_bloc.dart';
import 'package:safall_final_mobile_app/feature/auth/presentation/view_model/registration/bloc/registration_bloc.dart';
import 'package:safall_final_mobile_app/feature/home/presentation/view/home_view.dart';

class LoginscreenView extends StatelessWidget {
  const LoginscreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();
    bool isPasswordVisible = false;

    const gap = SizedBox(height: 15);

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple, Colors.green],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // App logo
                  Image.asset(
                    'assets/images/logo.jpg',
                    height: 100,
                    width: 100,
                  ),
                  const SizedBox(height: 20),
                  gap,
                  // App title
                  const Text(
                    "QuickBite",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 50),
                  // Login Form
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        // Username field
                        TextFormField(
                          key: const ValueKey('username'),
                          controller: usernameController,
                          decoration: const InputDecoration(
                            labelText: "Username",
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: Icon(Icons.person, color: Colors.grey),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        gap,
                        // Password field
                        TextFormField(
                          key: const ValueKey('password'),
                          controller: passwordController,
                          obscureText: !isPasswordVisible,
                          decoration: InputDecoration(
                            labelText: "Password",
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: const Icon(Icons.lock, color: Colors.grey),
                            border: const OutlineInputBorder(),
                            suffixIcon: StatefulBuilder(
                              builder: (context, setState) {
                                return IconButton(
                                  icon: Icon(
                                    isPasswordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      isPasswordVisible = !isPasswordVisible;
                                    });
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Login Button
                  ElevatedButton(
                    onPressed: () async {
                      // Automatically login without validation
                      context.read<LoginBloc>().add(
                        NavigateHomeScreenEvent(
                          context: context,
                          destination: const HomeView(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.red,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "LOGIN",
                      style: TextStyle(
                        fontFamily: 'Montserrat Bold',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Forgot Password link
                  TextButton(
                    onPressed: () {
                      // Forgot password logic here
                    },
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Signup link
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(color: Colors.white70),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => BlocProvider(
                            create: (context) => getIt<RegistrationBloc>(),
                            child: const RegistrationscreenView(),
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      " Signup",
                      style: TextStyle(
                        color: Color(0xFF0ACF83),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}






























 










































































































































 





























 