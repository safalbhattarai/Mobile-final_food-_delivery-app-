import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stockvision_app/core/common/snackbar/my_snackbar.dart';
import 'package:stockvision_app/feature/auth/domain/entity/auth_entity.dart';
import 'package:stockvision_app/feature/auth/presentation/view_model/profile/bloc/profile_bloc.dart';
import 'package:stockvision_app/feature/home/presentation/view_model/home_cubit.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  final _key = GlobalKey<FormState>();

  final _fnameController = TextEditingController();
  final _lnameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();
  final _usernameController = TextEditingController();

  File? _img;

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

  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().loadClient();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.user == null) {
            return const Center(child: Text("No users available"));
          } else {
            final user = state.user!;
            _fnameController.text = user.fName;
            _lnameController.text = user.lName;
            _phoneController.text = user.phoneNo;
            _emailController.text = user.email;
            _addressController.text = user.address;
            _usernameController.text = user.username;

            final String? imageUrl = user.image;
            final String baseUrl = Platform.isIOS
                ? "http://127.0.0.1:3000"
                : "http://10.0.2.2:3000";
            final String fullImageUrl = imageUrl != null && imageUrl.isNotEmpty
                ? "$baseUrl/uploads/$imageUrl"
                : '';

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Profile Image Section
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          backgroundColor: Colors.orange,
                          context: context,
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                          builder: (context) => Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ElevatedButton.icon(
                                  onPressed: () {
                                    _browseImage(ImageSource.camera);
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(Icons.camera),
                                  label: const Text('Camera'),
                                ),
                                ElevatedButton.icon(
                                  onPressed: () {
                                    _browseImage(ImageSource.gallery);
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(Icons.image),
                                  label: const Text('Gallery'),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      child: Center(
                        child: SizedBox(
                          height: 150,
                          width: 150,
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: _img != null
                                ? FileImage(_img!)
                                : (fullImageUrl.isNotEmpty
                                        ? NetworkImage(fullImageUrl)
                                        : const AssetImage(
                                            'assets/images/userlogo.jpg'))
                                    as ImageProvider,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // User Info Section
                    Text(
                      user.username,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${user.fName} ${user.lName}',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      user.email,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      user.phoneNo,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      user.address,
                      style: const TextStyle(fontSize: 16),
                    ),

                    const SizedBox(height: 20),

                    // Update User Info Button
                    ElevatedButton(
                      onPressed: () {
                        // Create an updated user object with the new data
                        final updatedUser = AuthEntity(
                          fName: _fnameController.text,
                          lName: _lnameController.text,
                          phoneNo: _phoneController.text,
                          email: _emailController.text,
                          address: _addressController.text,
                          username: _usernameController.text,
                          image: _img?.path,
                          password: '', // Include the new image if available
                        );

                        // Trigger the update event in the ProfileBloc
                        context
                            .read<ProfileBloc>()
                            .add(UpdateUserEvent(user: updatedUser));
                      },
                      child: const Text("Update Profile"),
                    ),

                    const SizedBox(height: 10),

                    // Logout Button
                    ElevatedButton(
                      onPressed: () {
                        // Show the logout snack bar
                        showMySnackBar(
                          context: context,
                          message: 'Logging out...',
                          color: Colors.red,
                        );

                        // Logout action
                        context.read<HomeCubit>().logout(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: const Text(
                        'Logout',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
