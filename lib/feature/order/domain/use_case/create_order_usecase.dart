import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:safall_final_mobile_app/app/usecase/usease.dart';
import 'package:safall_final_mobile_app/core/error/failure.dart';
import 'package:safall_final_mobile_app/feature/order/domain/repository/order_repository.dart';

import '../entity/order_entity.dart';

class CreateOrderParams extends Equatable {
  final String orderName;

  const CreateOrderParams({required this.orderName});

  // Empty constructor
  const CreateOrderParams.empty() : orderName = '_empty.string';

  @override
  List<Object?> get props => [orderName];
}

class CreateOrderUsecase implements UsecaseWithParams<void, CreateOrderParams> {
  final IOrderRepository _orderRepository;

  CreateOrderUsecase({required IOrderRepository orderRepository})
      : _orderRepository = orderRepository;

  @override
  Future<Either<Failure, void>> call(CreateOrderParams params) {
    return _orderRepository.createOrder(
      OrderEntity(orderName: params.orderName),
    );
  }
}
