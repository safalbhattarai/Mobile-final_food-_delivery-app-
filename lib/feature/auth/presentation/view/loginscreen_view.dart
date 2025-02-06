// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:safall_final_mobile_app/app/di/di.dart';
// import 'package:safall_final_mobile_app/feature/auth/presentation/view/registrationscreen_view.dart';
// import 'package:safall_final_mobile_app/feature/auth/presentation/view_model/login/bloc/login_bloc.dart';
// import 'package:safall_final_mobile_app/feature/auth/presentation/view_model/registration/bloc/registration_bloc.dart';
// import 'package:safall_final_mobile_app/feature/home/presentation/view/home_view.dart';
//
//
//
// class LoginscreenView extends StatelessWidget {
//   const LoginscreenView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final formKey = GlobalKey<FormState>();
//     final usernameController = TextEditingController();
//     final passwordController = TextEditingController();
//     bool isPasswordVisible = false; // To track password visibility
//
//     const gap = SizedBox(height: 15);
//
//     return Scaffold(
//       body: Container(
//         height: MediaQuery.of(context).size.height,
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.purple, Colors.green],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: Center(
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   const Icon(
//                     Icons.inventory,
//                     color: Colors.white,
//                     size: 100,
//                   ),
//                   gap,
//                   const Text(
//                     "QuickBite",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 36,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 50),
//                   Form(
//                     key: formKey,
//                     child: Column(
//                       children: [
//                         TextFormField(
//                           key: const ValueKey('username'),
//                           controller: usernameController,
//                           decoration: const InputDecoration(
//                             labelText: "Username",
//                             filled: true,
//                             fillColor: Colors.white,
//                             prefixIcon: Icon(Icons.person, color: Colors.grey),
//                             border: OutlineInputBorder(),
//                           ),
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return 'Please enter username';
//                             }
//                             return null;
//                           },
//                         ),
//                         gap,
//                         TextFormField(
//                           key: const ValueKey('password'),
//                           controller: passwordController,
//                           obscureText: !isPasswordVisible,
//                           decoration: InputDecoration(
//                             labelText: "Password",
//                             filled: true,
//                             fillColor: Colors.white,
//                             prefixIcon:
//                                 const Icon(Icons.lock, color: Colors.grey),
//                             border: const OutlineInputBorder(),
//                             suffixIcon: IconButton(
//                               icon: Icon(
//                                 isPasswordVisible
//                                     // ignore: dead_code
//                                     ? Icons.visibility
//                                     : Icons.visibility_off,
//                                 color: Colors.grey,
//                               ),
//                               onPressed: () {
//                                 isPasswordVisible = !isPasswordVisible;
//                               },
//                             ),
//                           ),
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter password';
//                             }
//                             return null;
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 30),
//                   ElevatedButton(
//                     onPressed: () async {
//                       if (formKey.currentState!.validate()) {
//                         context.read<LoginBloc>().add(
//                               LoginCustomerEvent(
//                                 context: context,
//                                 username: usernameController.text,
//                                 password: passwordController.text,
//                               ),
//                             );
//                         if (usernameController.text == 'Safal' &&
//                             passwordController.text == '123456') {
//                           context.read<LoginBloc>().add(NavigateHomeScreenEvent(
//                               context: context, destination: const HomeView()));
//                         }
//                       }
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.white,
//                       foregroundColor: Colors.red,
//                       minimumSize: const Size(double.infinity, 50),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                     child: const Text(
//                       "LOGIN",
//                       style: TextStyle(
//                         fontFamily: 'Montserrat Bold',
//                         fontWeight: FontWeight.bold,
//                         fontSize: 18,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   TextButton(
//                     onPressed: () {
//                       // Forgot Password logic
//                     },
//                     child: const Text(
//                       "Forgot Password?",
//                       style: TextStyle(color: Colors.white, fontSize: 16),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   const Text(
//                     "Don't have an account?",
//                     style: TextStyle(color: Colors.white70),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.of(context).push(
//                         MaterialPageRoute(
//                           builder: (_) => BlocProvider(
//                             create: (context) => getIt<RegistrationBloc>(),
//                             child: const RegistrationscreenView(),
//                           ),
//                         ),
//                       );
//                     },
//                     child: const Text(
//                       " Signup",
//                       style: TextStyle(
//                         color: Color(0xFF0ACF83),
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
//
//


























// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:safall_final_mobile_app/app/di/di.dart';
// import 'package:safall_final_mobile_app/feature/auth/presentation/view/registrationscreen_view.dart';
// import 'package:safall_final_mobile_app/feature/auth/presentation/view_model/login/bloc/login_bloc.dart';
// import 'package:safall_final_mobile_app/feature/auth/presentation/view_model/registration/bloc/registration_bloc.dart';
// import 'package:safall_final_mobile_app/feature/home/presentation/view/home_view.dart';
//
// class LoginscreenView extends StatelessWidget {
//   const LoginscreenView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final formKey = GlobalKey<FormState>();
//     final usernameController = TextEditingController();
//     final passwordController = TextEditingController();
//     bool isPasswordVisible = false; // To track password visibility
//
//     const gap = SizedBox(height: 15);
//
//     return Scaffold(
//       body: Container(
//         height: MediaQuery.of(context).size.height,
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.purple, Colors.green],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: Center(
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   // Image added here
//                   Image.asset(
//                     'assets/images/logo.jpg', // Path to your image
//                     height: 100, // Adjust height
//                     width: 1000, // Adjust width
//                   ),
//                   const SizedBox(height: 20), // Add spacing below the image
//
//
//                   gap,
//                   const Text(
//                     "QuickBite",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 36,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 50),
//                   Form(
//                     key: formKey,
//                     child: Column(
//                       children: [
//                         TextFormField(
//                           key: const ValueKey('username'),
//                           controller: usernameController,
//                           decoration: const InputDecoration(
//                             labelText: "Username",
//                             filled: true,
//                             fillColor: Colors.white,
//                             prefixIcon: Icon(Icons.person, color: Colors.grey),
//                             border: OutlineInputBorder(),
//                           ),
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return 'Please enter username';
//                             }
//                             return null;
//                           },
//                         ),
//                         gap,
//                         TextFormField(
//                           key: const ValueKey('password'),
//                           controller: passwordController,
//                           obscureText: !isPasswordVisible,
//                           decoration: InputDecoration(
//                             labelText: "Password",
//                             filled: true,
//                             fillColor: Colors.white,
//                             prefixIcon:
//                             const Icon(Icons.lock, color: Colors.grey),
//                             border: const OutlineInputBorder(),
//                             suffixIcon: StatefulBuilder(
//                               builder: (context, setState) {
//                                 return IconButton(
//                                   icon: Icon(
//                                     isPasswordVisible
//                                         ? Icons.visibility
//                                         : Icons.visibility_off,
//                                     color: Colors.grey,
//                                   ),
//                                   onPressed: () {
//                                     setState(() {
//                                       isPasswordVisible = !isPasswordVisible;
//                                     });
//                                   },
//                                 );
//                               },
//                             ),
//                           ),
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter password';
//                             }
//                             return null;
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 30),
//                   ElevatedButton(
//                     onPressed: () async {
//                       if (formKey.currentState!.validate()) {
//                         context.read<LoginBloc>().add(
//                           LoginCustomerEvent(
//                             context: context,
//                             username: usernameController.text,
//                             password: passwordController.text,
//                           ),
//                         );
//                         if (usernameController.text == 'Safal' &&
//                             passwordController.text == '123456') {
//                           context.read<LoginBloc>().add(NavigateHomeScreenEvent(
//                               context: context, destination: const HomeView()));
//                         }
//                       }
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.white,
//                       foregroundColor: Colors.red,
//                       minimumSize: const Size(double.infinity, 50),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                     child: const Text(
//                       "LOGIN",
//                       style: TextStyle(
//                         fontFamily: 'Montserrat Bold',
//                         fontWeight: FontWeight.bold,
//                         fontSize: 18,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   TextButton(
//                     onPressed: () {
//                       // Forgot Password logic
//                     },
//                     child: const Text(
//                       "Forgot Password?",
//                       style: TextStyle(color: Colors.white, fontSize: 16),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   const Text(
//                     "Don't have an account?",
//                     style: TextStyle(color: Colors.white70),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.of(context).push(
//                         MaterialPageRoute(
//                           builder: (_) => BlocProvider(
//                             create: (context) => getIt<RegistrationBloc>(),
//                             child: const RegistrationscreenView(),
//                           ),
//                         ),
//                       );
//                     },
//                     child: const Text(
//                       " Signup",
//                       style: TextStyle(
//                         color: Color(0xFF0ACF83),
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }



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



