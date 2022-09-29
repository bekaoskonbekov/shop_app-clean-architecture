import 'package:dartz/dartz.dart';

import '../../../../../core/error/network_exceptions.dart';
import '../entities/categories/categories.dart';
import '../entities/favorites/get_favorite_products.dart';
import '../entities/favorites/post_favorites.dart';
import '../entities/home/home.model.dart';
import '../usecases/add_product_to_favorite_usecase.dart';

abstract class HomeBaseRepository {
  Future<Either<NetworkExceptions, Home>> getHomeData();
  Future<Either<NetworkExceptions, Categories>> getCategories();
  Future<Either<NetworkExceptions, PostFavorite>> changeFavoriteProductsStatus(
    AddProductToFavoriteUseCaseParameters parameters,
  );
  Future<Either<NetworkExceptions, GetFavoriteProducts>> getFavoriteProducts();
}
