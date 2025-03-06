import 'dart:io';

import 'package:dio/dio.dart';
import 'package:stockvision_app/app/shared_prefs/token_shared_prefs.dart';
import 'package:stockvision_app/feature/auth/data/data_source/auth_data_source.dart';
import 'package:stockvision_app/feature/auth/domain/entity/auth_entity.dart';

class AuthRemoteDatasource implements IAuthDataSource {
  final Dio _dio;
  final TokenSharedPrefs userIdSharedPrefs;

  AuthRemoteDatasource(this._dio, this.userIdSharedPrefs);

  // This is where we return a default user without hitting the backend.
  AuthEntity _getDefaultUser() {
    return const AuthEntity(
      fName: 'John',
      lName: 'Doe',
      image: 'default.png',
      email: 'john.doe@example.com',
      phoneNo: '123-456-7890',
      address: '123 Default St, City, Country',
      username: 'johndoe',
      password: 'defaultpassword',
    );
  }

  @override
  Future<AuthEntity> getCurrentUser(String? token, String userId) async {
    try {
      // Instead of calling the backend, return a default user.
      print("Returning default user for getCurrentUser");
      return _getDefaultUser();

      // The backend call can be commented out for this purpose.
      /*
      Response response = await _dio.get(
        ApiEndpoints.getUser,
        data: {"token": token, "cred": userId},
      );
      if (response.statusCode == 200) {
        userIdSharedPrefs.setUser(userId as Map<String, dynamic>);
        return AuthEntity.fromJson(response.data);
      } else {
        throw Exception(response.statusMessage);
      }
      */
    } on DioException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<String> loginCustomer(String username, String password) async {
    try {
      // Hardcoded username and password for testing
      const String hardcodedUsername = 'hello';
      const String hardcodedPassword = '123456789';

      // Check if the provided credentials match the hardcoded ones
      if (username == hardcodedUsername && password == hardcodedPassword) {
        print("Login successful with hardcoded credentials.");
        // Return a hardcoded token for successful login
        return 'hardcoded-token-123'; // You can replace this with any dummy token you want
      } else {
        throw Exception('Invalid username or password');
      }

      // If you were hitting the backend, you would use the following code:
      /*
      Response response = await _dio.post(
        ApiEndpoints.login,
        data: {"username": username, "password": password},
      );
      if (response.statusCode == 200) {
        final str = response.data['token'];
        final cred = response.data['cred'];
        userIdSharedPrefs.setUser(cred);
        return str;
      } else {
        throw Exception(response.statusMessage);
      }
      */
    } catch (e) {
      throw Exception('Error logging in: $e');
    }
  }

  @override
  Future<void> registerCustomer(AuthEntity customer) async {
    try {
      // Skip the registration logic or just print a message
      print("Returning without registering customer (development mode).");
      // You can return early or skip backend API calls.
      return;

      // The backend call can be commented out for this purpose.
      /*
      Response response = await _dio.post(
        ApiEndpoints.register,
        data: {
          "fName": customer.fName,
          "lName": customer.lName,
          "image": customer.image,
          "phoneNo": customer.phoneNo,
          "email": customer.email,
          "username": customer.username,
          "password": customer.password,
          "address": customer.address,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return;
      } else if (response.statusCode == 400 &&
          response.data['error'] == 'User already exists') {
        throw Exception('User already exists');
      } else {
        throw Exception('Failed to register: ${response.statusMessage}');
      }
      */
    } on DioException catch (e) {
      throw Exception('DioException: ${e.message}');
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<String> uploadProfilePicture(File file) async {
    try {
      // You can either return a dummy response or skip the upload.
      print("Returning dummy file URL for profile picture upload.");
      return 'https://example.com/default-profile-picture.png';

      // The backend call can be commented out for this purpose.
      /*
      String fileName = file.path.split('/').last;
      FormData formData = FormData.fromMap({
        'profilePicture': await MultipartFile.fromFile(
          file.path,
          filename: fileName,
        ),
      });
      Response response = await _dio.post(
        ApiEndpoints.uploadImage,
        data: formData,
      );
      if (response.statusCode == 200) {
        return response.data['data'];
      } else {
        throw Exception(response.statusMessage);
      }
      */
    } on DioException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<String> getUserById(String username) {
    // Skip this logic for development.
    return Future.error("Not implemented");
  }

  @override
  Future<AuthEntity> updateUser(AuthEntity updatedUser) async {
    try {
      // You can simulate the update without backend interaction.
      print("Returning updated user without making a backend request.");
      return updatedUser; // Just return the updated user entity directly.

      // The backend call can be commented out for this purpose.
      /*
      var currentUser = await userIdSharedPrefs.getUser();
      currentUser?['fName'] = updatedUser.fName;
      currentUser?['lName'] = updatedUser.lName;
      currentUser?['email'] = updatedUser.email;
      currentUser?['phoneNo'] = updatedUser.phoneNo;
      currentUser?['address'] = updatedUser.address;
      currentUser?['username'] = updatedUser.username;

      var id = currentUser?['_id'];
      if (updatedUser.image != null) {
        currentUser?['image'] =
            await MultipartFile.fromFile(updatedUser.image!);
      }

      String? token = await userIdSharedPrefs.getToken();
      if (token == null) {
        throw Exception("Failed to retrieve token");
      }

      currentUser?.remove('__v');

      Response response = await _dio.put(ApiEndpoints.updateCustomer + id,
          data: currentUser,
          options: Options(
            headers: {
              "Authorization": "Bearer $token",
              "Accept": "application/json",
              "Content-Type": "application/json",
            },
          ));

      if (response.statusCode == 200) {
        Map<String, dynamic> newUserData = response.data['data'];
        await userIdSharedPrefs.updateUser(newUserData);
        return AuthEntity.fromJson(newUserData);
      } else {
        throw Exception('Failed to update user: ${response.statusMessage}');
      }
      */
    } catch (e) {
      throw Exception('Error updating user: $e');
    }
  }
}
