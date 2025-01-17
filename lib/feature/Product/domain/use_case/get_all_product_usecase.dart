import 'package:dartz/dartz.dart';
import 'package:safall_final_mobile_app/app/usecase/usease.dart';
import 'package:safall_final_mobile_app/core/error/failure.dart';
import 'package:safall_final_mobile_app/feature/Product/domain/entity/product_entity.dart';
import 'package:safall_final_mobile_app/feature/Product/domain/repository/product_repository.dart';


class GetAllProductUseCase
    implements UsecaseWithoutParams<List<ProductEntity>> {
  final IProductRepository productRepository;

  GetAllProductUseCase({required this.productRepository});

  @override
  Future<Either<Failure, List<ProductEntity>>> call() {
    return productRepository.getProduct();
  }
}
