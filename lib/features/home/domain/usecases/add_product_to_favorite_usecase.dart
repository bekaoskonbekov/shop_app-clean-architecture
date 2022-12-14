import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/network_exceptions.dart';
import '../../../../core/usecase/base_use_case.dart';
import '../entities/favorites/post_favorites.dart';
import '../repository/home_base_repository.dart';

class AddProductToFavoriteUseCase
    extends BaseUseCase<PostFavorite, AddProductToFavoriteUseCaseParameters> {
  final HomeBaseRepository homeBaseRepository;

  AddProductToFavoriteUseCase(this.homeBaseRepository);

  @override
  Future<Either<NetworkExceptions, PostFavorite>> call(
    AddProductToFavoriteUseCaseParameters parameters,
  ) async {
    return await homeBaseRepository.changeFavoriteProductsStatus(parameters);
  }
}

class AddProductToFavoriteUseCaseParameters extends Equatable {
  final int productId;

  const AddProductToFavoriteUseCaseParameters(this.productId);

  @override
  List<Object> get props => [productId];
}
