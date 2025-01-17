import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:safall_final_mobile_app/app/constants/hive_table_constant.dart';
import 'package:safall_final_mobile_app/feature/auth/domain/entity/auth_entity.dart';
import 'package:uuid/uuid.dart';


part 'auth_hive_model.g.dart';

@HiveType(typeId: HiveTableConstant.customerTableId)
class AuthHiveModel extends Equatable {
  @HiveField(0)
  final String? customerId;
  @HiveField(1)
  final String fName;
  @HiveField(2)
  final String lName;
  @HiveField(3)
  final String? image;
  @HiveField(4)
  final String phoneNo;
  @HiveField(5)
  final String username;
  @HiveField(6)
  final String password;

  AuthHiveModel({
    String? customerId,
    required this.fName,
    required this.lName,
    this.image,
    required this.phoneNo,
    required this.username,
    required this.password,
  }) : customerId = customerId ?? const Uuid().v4();

  // Initial Constructor
  const AuthHiveModel.initial()
      : customerId = '',
        fName = '',
        lName = '',
        image = '',
        phoneNo = '',
        username = '',
        password = '';

  // From Entity
  factory AuthHiveModel.fromEntity(AuthEntity entity) {
    return AuthHiveModel(
      customerId: entity.userId,
      fName: entity.fName,
      lName: entity.lName,
      image: entity.image,
      phoneNo: entity.phoneNo,
      username: entity.username,
      password: entity.password,
    );
  }

  // To Entity
  AuthEntity toEntity() {
    return AuthEntity(
      userId: customerId,
      fName: fName,
      lName: lName,
      image: image,
      phoneNo: phoneNo,
      username: username,
      password: password,
    );
  }

  @override
  List<Object?> get props =>
      [customerId, fName, lName, image, username, password];
}
