import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:safall_final_mobile_app/core/error/failure.dart';
import 'package:safall_final_mobile_app/feature/auth/data/data_source/local_datasource/auth_local_datasource.dart';
import 'package:safall_final_mobile_app/feature/auth/domain/entity/auth_entity.dart';
import 'package:safall_final_mobile_app/feature/auth/domain/repository/auth_repository.dart';

class AuthLocalRepository implements IAuthRepository {
  final AuthLocalDataSource _authLocalDataSource;

  AuthLocalRepository(this._authLocalDataSource);

  @override
  Future<Either<Failure, AuthEntity>> getCurrentUser() async {
    try {
      final currentUser = await _authLocalDataSource.getCurrentUser();
      return Right(currentUser);
    } catch (e) {
      return Left(LocalDatabaseFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> loginCustomer(
    String email,
    String password,
  ) async {
    try {
      final token = await _authLocalDataSource.loginCustomer(email, password);
      return Right(token);
    } catch (e) {
      return Left(LocalDatabaseFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> registerCustomer(AuthEntity customer) async {
    try {
      return Right(_authLocalDataSource.registerCustomer(customer));
    } catch (e) {
      return Left(LocalDatabaseFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> uploadProfilePicture(File file) async {
    // TODO: implement uploadProfilePicture
    throw UnimplementedError();
  }
}
