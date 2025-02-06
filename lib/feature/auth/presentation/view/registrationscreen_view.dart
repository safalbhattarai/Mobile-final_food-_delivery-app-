

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:safall_final_mobile_app/feature/auth/presentation/view_model/registration/bloc/registration_bloc.dart';
//
// class RegistrationscreenView extends StatefulWidget {
//   const RegistrationscreenView({super.key});
//
//   @override
//   State<RegistrationscreenView> createState() => _RegistrationScreenViewState();
// }
//
// class _RegistrationScreenViewState extends State<RegistrationscreenView> {
//   final _formKey = GlobalKey<FormState>();
//   final _fnameController = TextEditingController();
//   final _lnameController = TextEditingController();
//   final _phoneController = TextEditingController();
//   final _usernameController = TextEditingController();
//   final _passwordController = TextEditingController();
//
//   final _gap = const SizedBox(height: 15);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Registration Page'),
//         centerTitle: true,
//       ),
//       body: BlocListener<RegistrationBloc, RegistrationState>(
//         listener: (context, state) {
//           if (state.isSuccess) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(content: Text('Registration Successful')),
//             );
//           } else if (!state.isLoading && !state.isSuccess) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(content: Text('Registration Failed')),
//             );
//           }
//         },
//         child: SafeArea(
//           child: Column(
//             children: [
//               // Enlarged CircleAvatar
//               Expanded(
//                 flex: 2,
//                 child: Center(
//                   child: CircleAvatar(
//                     radius: 100, // Increase radius
//                     backgroundImage: const AssetImage(
//                         'assets/images/background.png'), // Adjust image path
//                   ),
//                 ),
//               ),
//               Expanded(
//                 flex: 5,
//                 child: SingleChildScrollView(
//                   padding: const EdgeInsets.all(20),
//                   child: Form(
//                     key: _formKey,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.stretch,
//                       children: [
//                         TextFormField(
//                           controller: _fnameController,
//                           decoration:
//                           const InputDecoration(labelText: 'First Name'),
//                           validator: (value) => value!.trim().isEmpty
//                               ? 'Please enter first name'
//                               : null,
//                         ),
//                         _gap,
//                         TextFormField(
//                           controller: _lnameController,
//                           decoration:
//                           const InputDecoration(labelText: 'Last Name'),
//                           validator: (value) => value!.trim().isEmpty
//                               ? 'Please enter last name'
//                               : null,
//                         ),
//                         _gap,
//                         TextFormField(
//                           controller: _phoneController,
//                           decoration:
//                           const InputDecoration(labelText: 'Phone Number'),
//                           keyboardType: TextInputType.phone,
//                           validator: (value) => value!.trim().isEmpty
//                               ? 'Please enter phone number'
//                               : null,
//                         ),
//                         _gap,
//                         TextFormField(
//                           controller: _usernameController,
//                           decoration:
//                           const InputDecoration(labelText: 'Username'),
//                           validator: (value) => value!.trim().isEmpty
//                               ? 'Please enter username'
//                               : null,
//                         ),
//                         _gap,
//                         TextFormField(
//                           controller: _passwordController,
//                           obscureText: true,
//                           decoration:
//                           const InputDecoration(labelText: 'Password'),
//                           validator: (value) => value!.trim().isEmpty
//                               ? 'Please enter password'
//                               : null,
//                         ),
//                         _gap,
//                         SizedBox(
//                           width: double.infinity,
//                           child: ElevatedButton(
//                             onPressed: () {
//                               if (_formKey.currentState!.validate()) {
//                                 context.read<RegistrationBloc>().add(
//                                   RegisterCustomer(
//                                     fName: _fnameController.text.trim(),
//                                     lName: _lnameController.text.trim(),
//                                     phoneNo: _phoneController.text.trim(),
//                                     username: _usernameController.text.trim(),
//                                     password: _passwordController.text.trim(),
//                                     context: context,
//                                   ),
//                                 );
//                               }
//                             },
//                             child: const Text('Register'),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//












import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart'; // Import the image_picker package
import 'dart:io';
import 'package:safall_final_mobile_app/feature/auth/presentation/view_model/registration/bloc/registration_bloc.dart';

class RegistrationscreenView extends StatefulWidget {
  const RegistrationscreenView({super.key});

  @override
  State<RegistrationscreenView> createState() => _RegistrationScreenViewState();
}

class _RegistrationScreenViewState extends State<RegistrationscreenView> {
  final _formKey = GlobalKey<FormState>();
  final _fnameController = TextEditingController();
  final _lnameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  File? _image;
  final ImagePicker _picker = ImagePicker();
  final _gap = const SizedBox(height: 15);

  Future<void> _pickImage(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() => _image = File(pickedFile.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration Page'),
        centerTitle: true,
      ),
      body: BlocListener<RegistrationBloc, RegistrationState>(
        listener: (context, state) {
          if (state.isSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Registration Successful')),
            );
          } else if (!state.isLoading && !state.isSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Registration Failed')),
            );
          }
        },
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Center(
                  child: GestureDetector(
                    onTap: () async {
                      await showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Wrap(
                            children: [
                              ListTile(
                                leading: const Icon(Icons.camera_alt),
                                title: const Text('Take a Photo'),
                                onTap: () {
                                  _pickImage(ImageSource.camera);
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                leading: const Icon(Icons.photo_library),
                                title: const Text('Choose from Gallery'),
                                onTap: () {
                                  _pickImage(ImageSource.gallery);
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: CircleAvatar(
                      radius: 100,
                      backgroundImage: _image != null
                          ? FileImage(_image!)
                          : const AssetImage('assets/images/background.png')
                      as ImageProvider,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextFormField(
                          controller: _fnameController,
                          decoration:
                          const InputDecoration(labelText: 'First Name'),
                          validator: (value) =>
                          value!.trim().isEmpty ? 'Please enter first name' : null,
                        ),
                        _gap,
                        TextFormField(
                          controller: _lnameController,
                          decoration:
                          const InputDecoration(labelText: 'Last Name'),
                          validator: (value) =>
                          value!.trim().isEmpty ? 'Please enter last name' : null,
                        ),
                        _gap,
                        TextFormField(
                          controller: _phoneController,
                          decoration:
                          const InputDecoration(labelText: 'Phone Number'),
                          keyboardType: TextInputType.phone,
                          validator: (value) =>
                          value!.trim().isEmpty ? 'Please enter phone number' : null,
                        ),
                        _gap,
                        TextFormField(
                          controller: _usernameController,
                          decoration:
                          const InputDecoration(labelText: 'Username'),
                          validator: (value) =>
                          value!.trim().isEmpty ? 'Please enter username' : null,
                        ),
                        _gap,
                        TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration:
                          const InputDecoration(labelText: 'Password'),
                          validator: (value) =>
                          value!.trim().isEmpty ? 'Please enter password' : null,
                        ),
                        _gap,
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<RegistrationBloc>().add(
                                  RegisterCustomer(
                                    fName: _fnameController.text.trim(),
                                    lName: _lnameController.text.trim(),
                                    phoneNo: _phoneController.text.trim(),
                                    username: _usernameController.text.trim(),
                                    password: _passwordController.text.trim(),
                                    context: context,
                                  ),
                                );
                              }
                            },
                            child: const Text('Register'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
















