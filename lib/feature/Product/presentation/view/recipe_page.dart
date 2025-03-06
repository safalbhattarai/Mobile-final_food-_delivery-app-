import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // Add this package to handle image picking

class CreateRecipePage extends StatefulWidget {
  const CreateRecipePage({super.key});

  @override
  _CreateRecipePageState createState() => _CreateRecipePageState();
}

class _CreateRecipePageState extends State<CreateRecipePage> {
  // Controllers for the form fields
  final TextEditingController nameController = TextEditingController();
  final TextEditingController smallDescriptionController =
      TextEditingController();
  final TextEditingController longDescriptionController =
      TextEditingController();

  // Variable to store the picked image file
  File? imageFile;

  // Image picker instance
  final ImagePicker _picker = ImagePicker();

  // Function to pick an image from the gallery
  Future<void> pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  // Function to save the recipe
  void saveRecipe() {
    final String recipeName = nameController.text;
    final String smallDescription = smallDescriptionController.text;
    final String longDescription = longDescriptionController.text;

    // Validate form fields
    if (recipeName.isEmpty ||
        smallDescription.isEmpty ||
        longDescription.isEmpty ||
        imageFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Please fill all fields and upload an image')),
      );
      return;
    }

    // Print the recipe data (In a real app, this would be an API call or saving to a database)
    print('Recipe Saved:');
    print('Name: $recipeName');
    print('Small Description: $smallDescription');
    print('Long Description: $longDescription');
    print('Image Path: ${imageFile?.path}');

    // Here you would send the recipe data to a server or save it in a database.
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Recipe saved successfully!')),
    );
    // Optionally, navigate back to the previous page after saving.
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Recipe"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Recipe Name Field
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Recipe Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Small Description Field
              TextField(
                controller: smallDescriptionController,
                decoration: const InputDecoration(
                  labelText: 'Small Description',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Long Description Field
              TextField(
                controller: longDescriptionController,
                decoration: const InputDecoration(
                  labelText: 'Long Description',
                  border: OutlineInputBorder(),
                ),
                maxLines: 5, // Allow for multiple lines in the long description
              ),
              const SizedBox(height: 16),

              // Image Upload Section
              imageFile == null
                  ? ElevatedButton(
                      onPressed: pickImage,
                      child: const Text('Upload Image'),
                    )
                  : Column(
                      children: [
                        Image.file(
                          imageFile!,
                          height: 200,
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: pickImage,
                          child: const Text('Change Image'),
                        ),
                      ],
                    ),
              const SizedBox(height: 20),

              // Save Recipe Button
              ElevatedButton(
                onPressed: saveRecipe,
                child: const Text('Save Recipe'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
