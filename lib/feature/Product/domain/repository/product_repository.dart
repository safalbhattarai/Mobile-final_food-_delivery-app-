import 'package:dartz/dartz.dart';
import 'package:safall_final_mobile_app/core/error/failure.dart';
import 'package:safall_final_mobile_app/feature/Product/domain/entity/product_entity.dart';


abstract interface class IProductRepository {
  Future<Either<Failure, List<ProductEntity>>> getProduct();
  Future<Either<Failure, void>> createProduct(ProductEntity product);
  Future<Either<Failure, void>> deleteProduct(String id);
}
