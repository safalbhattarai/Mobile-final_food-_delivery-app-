// import 'package:flutter_test/flutter_test.dart';
// import 'package:safalll_food_app/feature/auth/domain/entity/auth_entity.dart';


// void main() {
//   group('AuthEntity', () {
//     test('should create an AuthEntity instance with required fields', () {
//       const authEntity = AuthEntity(
//         fName: 'Safal',
//         lName: 'Bhattarai',
//         email: 'safalbhattarai17@gmail.com',
//         phoneNo: '123456789',
//         address: 'Kathmandu',
//         username: 'Safal',
//         password: '12345',
//       );

//       expect(authEntity.fName, 'Safal');
//       expect(authEntity.lName, 'Bhattarai');
//       expect(authEntity.email, 'safalbhattarai17@gmail.com');
//       expect(authEntity.phoneNo, '123456789');
//       expect(authEntity.address, 'Kathmandu');
//       expect(authEntity.username, 'Safal');
//       expect(authEntity.password, '12345');
//       expect(authEntity.image, isNull);
//       expect(authEntity.userId, isNull);
//     });

//     test('should handle nullable fields for userId and image', () {
//       const authEntity = AuthEntity(
//         fName: 'Roshan',
//         lName: 'Baidar',
//         email: 'roshanbaidar@gmail.com',
//         phoneNo: '987654321',
//         address: 'Kathmandu',
//         username: 'Roshan',
//         password: '1234',
//       );

//       expect(authEntity.userId, isNull);
//       expect(authEntity.image, isNull);
//     });

//     test('should compare equal for two identical instances', () {
//       const authEntity1 = AuthEntity(
//         fName: 'Dipesh',
//         lName: 'Shrestha',
//         email: 'Dipeshshrestha@gmail.com',
//         phoneNo: '123456789',
//         address: 'Teku',
//         username: 'Dipesh',
//         password: 'password123',
//       );

//       const authEntity2 = AuthEntity(
//         fName: 'Dipesh',
//         lName: 'Shrestha',
//         email: 'Dipeshshrestha@gmail.com',
//         phoneNo: '123456789',
//         address: 'Teku',
//         username: 'Dipesh',
//         password: 'password123',
//       );

//       expect(authEntity1, equals(authEntity2));
//     });

//     test('should compare not equal for different instances', () {
//       const authEntity1 = AuthEntity(
//         fName: 'Samip',
//         lName: 'Shrestha',
//         email: 'samip@gmail.com',
//         phoneNo: '123456789',
//         address: 'Kathmandu',
//         username: 'Samip'  ,
//         password: 'password123',
//       );

//       const authEntity2 = AuthEntity(
//         fName: 'Jane',
//         lName: 'Doe',
//         email: 'jane.doe@example.com',
//         phoneNo: '987654321',
//         address: '456 Another St',
//         username: 'janedoe',
//         password: 'password456',
//       );

//       expect(authEntity1, isNot(equals(authEntity2)));
//     });

//     test('should ensure equality for userId field', () {
//       const authEntity1 = AuthEntity(
//         userId: '123',
//         fName: 'John',
//         lName: 'Doe',
//         email: 'john.doe@example.com',
//         phoneNo: '123456789',
//         address: '123 Main St',
//         username: 'johndoe',
//         password: 'password123',
//       );

//       const authEntity2 = AuthEntity(
//         userId: '123',
//         fName: 'John',
//         lName: 'Doe',
//         email: 'john.doe@example.com',
//         phoneNo: '123456789',
//         address: '123 Main St',
//         username: 'johndoe',
//         password: 'password123',
//       );

//       expect(authEntity1, equals(authEntity2));
//     });

//     test('should ensure inequality for userId field', () {
//       const authEntity1 = AuthEntity(
//         userId: '123',
//         fName: 'John',
//         lName: 'Doe',
//         email: 'john.doe@example.com',
//         phoneNo: '123456789',
//         address: '123 Main St',
//         username: 'johndoe',
//         password: 'password123',
//       );

//       const authEntity2 = AuthEntity(
//         userId: '124',
//         fName: 'John',
//         lName: 'Doe',
//         email: 'john.doe@example.com',
//         phoneNo: '123456789',
//         address: '123 Main St',
//         username: 'johndoe',
//         password: 'password123',
//       );

//       expect(authEntity1, isNot(equals(authEntity2)));
//     });

//     test('should ensure equality for image field', () {
//       const authEntity1 = AuthEntity(
//         image: 'profile1.jpg',
//         fName: 'John',
//         lName: 'Doe',
//         email: 'john.doe@example.com',
//         phoneNo: '123456789',
//         address: '123 Main St',
//         username: 'johndoe',
//         password: 'password123',
//       );

//       const authEntity2 = AuthEntity(
//         image: 'profile1.jpg',
//         fName: 'John',
//         lName: 'Doe',
//         email: 'john.doe@example.com',
//         phoneNo: '123456789',
//         address: '123 Main St',
//         username: 'johndoe',
//         password: 'password123',
//       );

//       expect(authEntity1, equals(authEntity2));
//     });

//     test('should handle empty strings for all fields', () {
//       const authEntity = AuthEntity(
//         fName: '',
//         lName: '',
//         email: '',
//         phoneNo: '',
//         address: '',
//         username: '',
//         password: '',
//       );

//       expect(authEntity.fName, '');
//       expect(authEntity.lName, '');
//       expect(authEntity.email, '');
//       expect(authEntity.phoneNo, '');
//       expect(authEntity.address, '');
//       expect(authEntity.username, '');
//       expect(authEntity.password, '');
//     });

//     test('should handle null values for optional fields', () {
//       const authEntity = AuthEntity(
//         fName: 'Alice',
//         lName: 'Smith',
//         email: 'alice.smith@example.com',
//         phoneNo: '987654321',
//         address: '789 Some St',
//         username: 'alicesmith',
//         password: 'password789',
//         image: null,
//       );

//       expect(authEntity.image, isNull);
//     });

//     test('should handle instance creation with a userId', () {
//       const authEntity = AuthEntity(
//         userId: '1001',
//         fName: 'Bob',
//         lName: 'Brown',
//         email: 'bob.brown@example.com',
//         phoneNo: '1122334455',
//         address: '101 Some St',
//         username: 'bobbrown',
//         password: 'securepassword',
//       );

//       expect(authEntity.userId, '1001');
//     });
//   });
// }

























import 'package:flutter_test/flutter_test.dart';
import 'package:safalll_food_app/feature/auth/domain/entity/auth_entity.dart';


void main() {
  group('AuthEntity', () {
    test('should create an AuthEntity instance with required fields', () {
      const authEntity = AuthEntity(
        fName: 'Safal',
        lName: 'Bhattarai',
        email: 'safalbhattarai17@gmail.com',
        phoneNo: '123456789',
        address: 'Kathmandu',
        username: 'Safal',
        password: '12345',
      );

      expect(authEntity.fName, 'Safal');
      expect(authEntity.lName, 'Bhattarai');
      expect(authEntity.email, 'safalbhattarai17@gmail.com');
      expect(authEntity.phoneNo, '123456789');
      expect(authEntity.address, 'Kathmandu');
      expect(authEntity.username, 'Safal');
      expect(authEntity.password, '12345');
      expect(authEntity.image, isNull);
      expect(authEntity.userId, isNull);
    });

    test('should handle nullable fields for userId and image', () {
      const authEntity = AuthEntity(
        fName: 'Roshan',
        lName: 'Baidar',
        email: 'roshanbaidar@gmail.com',
        phoneNo: '987654321',
        address: 'Kathmandu',
        username: 'Roshan',
        password: '1234',
      );

      expect(authEntity.userId, isNull);
      expect(authEntity.image, isNull);
    });

    test('should compare equal for two identical instances', () {
      const authEntity1 = AuthEntity(
        fName: 'Dipesh',
        lName: 'Shrestha',
        email: 'Dipeshshrestha@gmail.com',
        phoneNo: '123456789',
        address: 'Teku',
        username: 'Dipesh',
        password: 'password123',
      );

      const authEntity2 = AuthEntity(
        fName: 'Dipesh',
        lName: 'Shrestha',
        email: 'Dipeshshrestha@gmail.com',
        phoneNo: '123456789',
        address: 'Teku',
        username: 'Dipesh',
        password: 'password123',
      );

      expect(authEntity1, equals(authEntity2));
    });

    test('should compare not equal for different instances', () {
      const authEntity1 = AuthEntity(
        fName: 'Samip',
        lName: 'Shrestha',
        email: 'samip@gmail.com',
        phoneNo: '123456789',
        address: 'Kathmandu',
        username: 'Samip'  ,
        password: 'password123',
      );

      const authEntity2 = AuthEntity(
        fName: 'Jane',
        lName: 'Doe',
        email: 'jane.doe@example.com',
        phoneNo: '987654321',
        address: '456 Another St',
        username: 'janedoe',
        password: 'password456',
      );

      expect(authEntity1, isNot(equals(authEntity2)));
    });

    test('should ensure equality for userId field', () {
      const authEntity1 = AuthEntity(
        userId: '123',
        fName: 'John',
        lName: 'Doe',
        email: 'john.doe@example.com',
        phoneNo: '123456789',
        address: '123 Main St',
        username: 'johndoe',
        password: 'password123',
      );

      const authEntity2 = AuthEntity(
        userId: '123',
        fName: 'John',
        lName: 'Doe',
        email: 'john.doe@example.com',
        phoneNo: '123456789',
        address: '123 Main St',
        username: 'johndoe',
        password: 'password123',
      );

      expect(authEntity1, equals(authEntity2));
    });

    test('should ensure inequality for userId field', () {
      const authEntity1 = AuthEntity(
        userId: '123',
        fName: 'John',
        lName: 'Doe',
        email: 'john.doe@example.com',
        phoneNo: '123456789',
        address: '123 Main St',
        username: 'johndoe',
        password: 'password123',
      );

      const authEntity2 = AuthEntity(
        userId: '124',
        fName: 'John',
        lName: 'Doe',
        email: 'john.doe@example.com',
        phoneNo: '123456789',
        address: '123 Main St',
        username: 'johndoe',
        password: 'password123',
      );

      expect(authEntity1, isNot(equals(authEntity2)));
    });

    test('should ensure equality for image field', () {
      const authEntity1 = AuthEntity(
        image: 'profile1.jpg',
        fName: 'John',
        lName: 'Doe',
        email: 'john.doe@example.com',
        phoneNo: '123456789',
        address: '123 Main St',
        username: 'johndoe',
        password: 'password123',
      );

      const authEntity2 = AuthEntity(
        image: 'profile1.jpg',
        fName: 'John',
        lName: 'Doe',
        email: 'john.doe@example.com',
        phoneNo: '123456789',
        address: '123 Main St',
        username: 'johndoe',
        password: 'password123',
      );

      expect(authEntity1, equals(authEntity2));
    });

    test('should handle empty strings for all fields', () {
      const authEntity = AuthEntity(
        fName: '',
        lName: '',
        email: '',
        phoneNo: '',
        address: '',
        username: '',
        password: '',
      );

      expect(authEntity.fName, '');
      expect(authEntity.lName, '');
      expect(authEntity.email, '');
      expect(authEntity.phoneNo, '');
      expect(authEntity.address, '');
      expect(authEntity.username, '');
      expect(authEntity.password, '');
    });

    test('should handle null values for optional fields', () {
      const authEntity = AuthEntity(
        fName: 'Alice',
        lName: 'Smith',
        email: 'alice.smith@example.com',
        phoneNo: '987654321',
        address: '789 Some St',
        username: 'alicesmith',
        password: 'password789',
        image: null,
      );

      expect(authEntity.image, isNull);
    });

    test('should handle instance creation with a userId', () {
      const authEntity = AuthEntity(
        userId: '1001',
        fName: 'Bob',
        lName: 'Brown',
        email: 'bob.brown@example.com',
        phoneNo: '1122334455',
        address: '101 Some St',
        username: 'bobbrown',
        password: 'securepassword',
      );

      expect(authEntity.userId, '1001');
    });
  });
}

















































































































