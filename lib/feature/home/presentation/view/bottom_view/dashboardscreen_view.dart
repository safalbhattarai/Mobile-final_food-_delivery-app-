import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stockvision_app/feature/auth/presentation/view_model/profile/bloc/profile_bloc.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  File? _img;
  List<Map<String, dynamic>> recipes = [
    {
      'title': 'Yomari',
      'description': 'This is Yomari description',
      'imageUrl': 'assets/images/yomari.jpg',
      'isFavourite': true,
    },
    {
      'title': 'Kimchi',
      'description': 'This is Kimchi description.',
      'imageUrl': 'assets/images/kimchi.jpg',
      'isFavourite': true,
    },
    {
      'title': 'Salad',
      'description': 'This is salad description',
      'imageUrl': 'assets/images/salad.jpg',
      'isFavourite': false,
    },
    // {
    //   'title': 'Butter Chicken',
    //   'description': 'This is butterchicken description',
    //   'imageUrl': 'assets/images/butter.jpg',
    //   'isFavourite': false,
    // },
  ];

  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().loadClient();
  }

  Future _browseImage(ImageSource imagesource) async {
    try {
      final image = await ImagePicker().pickImage(source: imagesource);
      if (image != null) {
        setState(() {
          _img = File(image.path);
        });
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void _toggleFavourite(int index) {
    setState(() {
      recipes[index]['isFavourite'] = !recipes[index]['isFavourite'];
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double padding = screenWidth > 600 ? 40 : 16;

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Section with User Info Card
            BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
              if (state.isLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state.user == null) {
                return const Center(
                    child: Text("Latest Recipes",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)));
              } else {
                final user = state.user!;
                final String? imageUrl = user.image;
                final String baseUrl = Platform.isIOS
                    ? "http://127.0.0.1:3000"
                    : "http://10.0.2.2:3000";
                final String fullImageUrl =
                    imageUrl != null && imageUrl.isNotEmpty
                        ? "$baseUrl/uploads/$imageUrl"
                        : '';

                return UserInfoCard(
                  username: user.username,
                  email: user.email,
                  imageUrl: _img != null
                      ? _img!.path
                      : fullImageUrl.isNotEmpty
                          ? fullImageUrl
                          : '',
                );
              }
            }),

            const SizedBox(height: 20),

            // ListView for single recipe cards
            ListView.builder(
              shrinkWrap: true,
              itemCount: recipes.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final recipe = recipes[index];

                return RecipeCard(
                  imageUrl: recipe['imageUrl']!,
                  title: recipe['title']!,
                  description: recipe['description']!,
                  isFavourite: recipe['isFavourite'],
                  onSeeMore: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecipeDetailsPage(
                          recipeTitle: recipe['title']!,
                          recipeDescription: recipe['description']!,
                          recipeImageUrl: recipe['imageUrl']!,
                        ),
                      ),
                    );
                  },
                  onFavouriteToggle: () => _toggleFavourite(index),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class UserInfoCard extends StatelessWidget {
  final String username;
  final String email;
  final String imageUrl;

  const UserInfoCard({
    super.key,
    required this.username,
    required this.email,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: imageUrl.isNotEmpty
                  ? (imageUrl.startsWith('http') ||
                          imageUrl.startsWith('https'))
                      ? NetworkImage(imageUrl)
                      : FileImage(File(imageUrl))
                  : const AssetImage('assets/images/default_profile.png')
                      as ImageProvider,
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  username,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  email,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RecipeCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final bool isFavourite;
  final VoidCallback onSeeMore;
  final VoidCallback onFavouriteToggle;

  const RecipeCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.isFavourite,
    required this.onSeeMore,
    required this.onFavouriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(imageUrl, height: 200, fit: BoxFit.cover),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    isFavourite ? Icons.favorite : Icons.favorite_border,
                    color: isFavourite ? Colors.red : Colors.grey,
                  ),
                  onPressed: onFavouriteToggle,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: onSeeMore,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(
                          0xFF7F6BC1), // Set the background color to white
                      foregroundColor:
                          Colors.white, // Set the text color to black
                      elevation: 4, // Optional: Add elevation for shadow effect
                    ),
                    child: const Text('See More'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RecipeDetailsPage extends StatelessWidget {
  final String recipeTitle;
  final String recipeDescription;
  final String recipeImageUrl;

  const RecipeDetailsPage({
    super.key,
    required this.recipeTitle,
    required this.recipeDescription,
    required this.recipeImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipeTitle),
        backgroundColor: const Color(0xFF7F6BC1),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(recipeImageUrl, height: 200, fit: BoxFit.cover),
              const SizedBox(height: 20),
              Text(
                recipeTitle,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                recipeDescription,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
