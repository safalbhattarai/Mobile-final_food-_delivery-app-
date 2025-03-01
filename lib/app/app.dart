
import '../core/theme/app_theme.dart';
import '../feature/splash/presentation/view/splashscreen_view.dart';
import '../feature/splash/presentation/view_model/splash_cubit.dart';
import 'di/di.dart';
import 'widgets/custom_elevated_button.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipe App',
      theme: getApplicationTheme(),
      home: BlocProvider(
        create: (context) => getIt<SplashCubit>(),
        child: const SplashScreen(),
      ),
    );
  }
}

class BlocProvider {
}

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   List<User> registeredUsers = []; // Manage the list of registered users

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       initialRoute: '/',
//       theme: getApplicationTheme(),
//       routes: {
//         '/': (context) => const OnboardingScreen(),
//         '/login': (context) =>
//             LoginscreenView(registeredUsers: registeredUsers),
//         '/register': (context) => RegistrationScreen(
//               onUserRegistered: (user) {
//                 setState(() {
//                   registeredUsers.add(user); // Add the new user to the list
//                 });
//               },
//             ),
//         '/dashboard': (context) => const DashboardPage(),
//       },
//     );
//   }
// }
