import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:safall_final_mobile_app/feature/Product/domain/entity/product_entity.dart';
import 'package:safall_final_mobile_app/feature/Product/domain/use_case/create_product_usecase.dart';
import 'package:safall_final_mobile_app/feature/Product/domain/use_case/delete_product_usecase.dart';
import 'package:safall_final_mobile_app/feature/Product/domain/use_case/get_all_product_usecase.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final CreateProductUseCase _createProductUseCase;
  final GetAllProductUseCase _getAllProductUseCase;
  final DeleteProductUsecase _deleteProductUsecase;

  ProductBloc({
    required CreateProductUseCase createProductUseCase,
    required GetAllProductUseCase getAllProductUseCase,
    required DeleteProductUsecase deleteProductUsecase,
  })  : _createProductUseCase = createProductUseCase,
        _getAllProductUseCase = getAllProductUseCase,
        _deleteProductUsecase = deleteProductUsecase,
        super(ProductState.initial()) {
    on<LoadProduct>(_onLoadProduct);
    on<AddProduct>(_onAddProduct);
    on<DeleteProduct>(_onDeleteProduct);

    // Call this event whenever the bloc is created to load the Productes
    add(LoadProduct());
  }

  Future<void> _onLoadProduct(
      LoadProduct event, Emitter<ProductState> emit) async {
    emit(state.copyWith(isLoading: true));
    final result = await _getAllProductUseCase.call();
    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.message)),
      (product) => emit(state.copyWith(isLoading: false)),
    );
  }

  Future<void> _onAddProduct(
      AddProduct event, Emitter<ProductState> emit) async {
    emit(state.copyWith(isLoading: true));
    final result = await _createProductUseCase
        .call(CreateProductParams(productName: event.productName));
    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.message)),
      (product) {
        emit(state.copyWith(isLoading: false, error: null));

        add(LoadProduct());
      },
    );
  }

  Future<void> _onDeleteProduct(
      DeleteProduct event, Emitter<ProductState> emit) async {
    emit(state.copyWith(isLoading: true));
    final result = await _deleteProductUsecase
        .call(DeleteProductParams(productId: event.productId));
    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.message)),
      (product) {
        emit(state.copyWith(isLoading: false, error: null));
        add(LoadProduct());
      },
    );
  }
}

extension on Object? {
}
