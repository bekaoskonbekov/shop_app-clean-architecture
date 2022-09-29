import 'package:shop_app_clean_architecture/features/home/data/models/favorites/get_favorite_product_model.dart';

import '../../../domain/entities/favorites/get_favorites.dart';

class GetFavoritesModel extends GetFavorites {
  const GetFavoritesModel({
    required super.favoriteProducts,
  });

  factory GetFavoritesModel.fromJson(Map<String, dynamic> json) {
    return GetFavoritesModel(
      favoriteProducts: FavoriteProductModel.fromJson(json['product']),
    );
  }
}
