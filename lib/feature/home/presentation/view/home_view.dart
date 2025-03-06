import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stockvision_app/feature/home/presentation/view_model/home_cubit.dart';
import 'package:stockvision_app/feature/home/presentation/view_model/home_state.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/images/1.jpg'),
            ),
            SizedBox(width: 10),
            Text(
              'Recipe App',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xFF5044C1),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app,
                color: Colors.white), // Set icon color to white
            onPressed: () {
              // Call the logout function to clear session or user data
              context.read<HomeCubit>().logout(
                  context); // Assuming you have a logout method in HomeCubit

              // Navigate to the login page after logging out
              Navigator.pushReplacementNamed(
                  context, '/login'); // Make sure '/login' is the correct route
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none_outlined,
                color: Colors.white), // Set icon color to white
            onPressed: () {
              // Notifications functionality (if any)
            },
          ),
        ],
      ),
      body: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
        return state.views.elementAt(state.selectedIndex);
      }),
      bottomNavigationBar: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined,
                    color: Colors.white), // Set icon color to white
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.local_dining_outlined,
                    color: Colors.white), // Set icon color to white
                label: 'Recipes',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border_outlined,
                    color: Colors.white), // Set icon color to white
                label: 'Favorites',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined,
                    color: Colors.white), // Set icon color to white
                label: 'Settings',
              ),
            ],
            currentIndex: state.selectedIndex,
            selectedItemColor: Colors.white, // Set selected icon color to white
            unselectedItemColor:
                Colors.white, // Set unselected icon color to white
            backgroundColor: const Color(0xFF7F6BC1),
            onTap: (index) {
              context.read<HomeCubit>().onTabTapped(index);
            },
            type: BottomNavigationBarType.fixed,
          );
        },
      ),
    );
  }
}
