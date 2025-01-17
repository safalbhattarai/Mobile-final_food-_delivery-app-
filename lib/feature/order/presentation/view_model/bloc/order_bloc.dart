import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:safall_final_mobile_app/feature/order/domain/entity/order_entity.dart';
import 'package:safall_final_mobile_app/feature/order/domain/use_case/create_order_usecase.dart';
import 'package:safall_final_mobile_app/feature/order/domain/use_case/delete_order_usecase.dart';
import 'package:safall_final_mobile_app/feature/order/domain/use_case/get_all_order_usecase.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final GetAllOrderUsecase _getAllOrderUsecase;
  final CreateOrderUsecase _createOrderUsecase;
  final DeleteOrderUsecase _deleteOrderUsecase;

  OrderBloc({
    required GetAllOrderUsecase getAllOrderUsecase,
    required CreateOrderUsecase createOrderUsecase,
    required DeleteOrderUsecase deleteOrderUsecase,
  })  : _getAllOrderUsecase = getAllOrderUsecase,
        _createOrderUsecase = createOrderUsecase,
        _deleteOrderUsecase = deleteOrderUsecase,
        super(OrderState.initial()) {
    on<OrderLoad>(_onOrderLoad);
    on<CreateOrder>(_onCreateOrder);
    on<DeleteOrder>(_onDeleteOrder);

    add(OrderLoad()); // Automatically load orders when the bloc is initialized.
  }

  Future<void> _onOrderLoad(
    OrderLoad event,
    Emitter<OrderState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, error: null));
    final result = await _getAllOrderUsecase();
    result.fold(
      (failure) => emit(state.copyWith(
        isLoading: false,
        error: failure.message,
      )),
      (orders) => emit(state.copyWith(
        isLoading: false,
        order: orders,
        error: null,
      )),
    );
  }

  Future<void> _onCreateOrder(
    CreateOrder event,
    Emitter<OrderState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, error: null));
    final result = await _createOrderUsecase(
      CreateOrderParams(orderName: event.orderName),
    );
    result.fold(
      (failure) => emit(state.copyWith(
        isLoading: false,
        error: failure.message,
      )),
      (_) {
        emit(state.copyWith(isLoading: false));
        add(OrderLoad()); // Refresh orders after creation.
      },
    );
  }

  Future<void> _onDeleteOrder(
    DeleteOrder event,
    Emitter<OrderState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, error: null));
    final result = await _deleteOrderUsecase(DeleteOrderParams(id: event.id));
    result.fold(
      (failure) => emit(state.copyWith(
        isLoading: false,
        error: failure.message,
      )),
      (_) {
        emit(state.copyWith(isLoading: false));
        add(OrderLoad()); // Refresh orders after deletion.
      },
    );
  }
}

extension FailureMessage on Object? {
  String? get message => this is Exception ? (this as Exception).toString() : null;
}
