import 'package:dartz/dartz.dart';
import 'package:safall_final_mobile_app/core/error/failure.dart';
import 'package:safall_final_mobile_app/feature/order/data/data_source/order_local_data_source.dart';
import 'package:safall_final_mobile_app/feature/order/domain/entity/order_entity.dart';
import 'package:safall_final_mobile_app/feature/order/domain/repository/order_repository.dart';

// import 'package:softwarica_student_management_bloc/core/error/failure.dart';
// import 'package:softwarica_student_management_bloc/features/course/data/data_source/course_local_data_source.dart';
// import 'package:softwarica_student_management_bloc/features/course/domain/entity/course_entity.dart';
// import 'package:softwarica_student_management_bloc/features/course/domain/repository/course_repository.dart';

class OrderLocalRepository implements IOrderRepository {
  final OrderLocalDataSource _orderLocalDataSource;

  OrderLocalRepository({required OrderLocalDataSource orderLocalDataSource})
      : _orderLocalDataSource = orderLocalDataSource;

  @override
  Future<Either<Failure, void>> createOrder(OrderEntity order) {
    try {
      _orderLocalDataSource.createOrder(order);
      return Future.value(const Right(null));
    } catch (e) {
      return Future.value(Left(LocalDatabaseFailure(message: e.toString())));
    }
  }

  @override
  Future<Either<Failure, void>> deleteOrder(String id) {
    try {
      _orderLocalDataSource.deleteOrder(id);
      return Future.value(const Right(null));
    } catch (e) {
      return Future.value(Left(LocalDatabaseFailure(message: e.toString())));
    }
  }

  @override
  Future<Either<Failure, List<OrderEntity>>> getOrder() {
    try {
      return _orderLocalDataSource.getOrder().then(
        (value) {
          return Right(value);
        },
      );
    } catch (e) {
      return Future.value(Left(LocalDatabaseFailure(message: e.toString())));
    }
  }
}
