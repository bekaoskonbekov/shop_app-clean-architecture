import 'package:shop_app_clean_architecture/features/home/data/models/favorites/get_favorites_model.dart';

import '../../../domain/entities/favorites/get_favorite_products_data.dart';

class GetFavoriteProductsDataModel extends GetFavoriteProductsData {
  const GetFavoriteProductsDataModel({
    required super.favoritesData,
  });

  factory GetFavoriteProductsDataModel.fromJson(Map<String, dynamic> json) {
    return GetFavoriteProductsDataModel(
      favoritesData: List<GetFavoritesModel>.from(
        (json['data'] as List).map(
          (product) => GetFavoritesModel.fromJson(product),
        ),
      ),
    );
  }
}
