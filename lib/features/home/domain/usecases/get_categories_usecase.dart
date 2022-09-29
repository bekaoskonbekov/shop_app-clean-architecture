import 'package:dartz/dartz.dart';
import 'package:shop_app_clean_architecture/core/usecase/base_use_case.dart';
import '../../../../core/error/network_exceptions.dart';
import '../entities/categories/categories.dart';
import '../repository/home_base_repository.dart';

class GetCategoriesUseCase extends BaseUseCase<Categories, NoParameters> {
  final HomeBaseRepository homeBaseRepository;

  GetCategoriesUseCase(this.homeBaseRepository);

  @override
  Future<Either<NetworkExceptions, Categories>> call(
    NoParameters parameters,
  ) async {
    return await homeBaseRepository.getCategories();
  }
}
