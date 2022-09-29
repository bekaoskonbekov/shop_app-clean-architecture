import '../../../../core/error/exception.dart';
import '../../../../core/helpers/dio_helper.dart';
import '../../../../core/network/api_constance.dart';
import '../../../../core/network/error_message_model.dart';
import '../../../../core/utils/constance.dart';
import '../../domain/entities/favorites/post_favorites.dart';
import '../../domain/usecases/add_product_to_favorite_usecase.dart';
import '../models/categories/categories_model.dart';
import '../models/favorites/get_favorite_products_model.dart';
import '../models/favorites/post_favorites_model.dart';
import '../models/home/home_model.dart';

abstract class HomeBaseRemoteDataSource {
  Future<HomeModel> getHomeData();
  Future<CategoriesModel> getCategories();
  Future<PostFavorite> changeFavoriteProductsStatus(
    AddProductToFavoriteUseCaseParameters parameters,
  );
  Future<GetFavoriteProductsModel> getFavoriteProducts();
}

class HomeRemoteDataSource extends HomeBaseRemoteDataSource {
  @override
  Future<HomeModel> getHomeData() async {
    final response = await DioHelper.getData(
      path: ApiConstance.homePath,
      token: token,
    );

    if (response.statusCode == 200) {
      return HomeModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<CategoriesModel> getCategories() async {
    final response = await DioHelper.getData(
      path: ApiConstance.categoriesPath,
    );

    if (response.statusCode == 200) {
      return CategoriesModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<PostFavorite> changeFavoriteProductsStatus(
    AddProductToFavoriteUseCaseParameters parameters,
  ) async {
    final response = await DioHelper.postData(
      path: ApiConstance.postFavoritesPath,
      data: {
        'product_id': parameters.productId,
      },
      token: token,
    );

    if (response.statusCode == 200) {
      return PostFavoritesModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<GetFavoriteProductsModel> getFavoriteProducts() async {
    final response = await DioHelper.getData(
      path: ApiConstance.getFavoritesPath,
      token: token,
    );

    if (response.statusCode == 200) {
      return GetFavoriteProductsModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
