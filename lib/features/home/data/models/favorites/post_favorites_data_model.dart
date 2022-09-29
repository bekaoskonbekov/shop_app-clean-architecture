import 'package:shop_app_clean_architecture/features/home/data/models/favorites/post_favorite_product_model.dart';

import '../../../domain/entities/favorites/post_favorites_data.dart';

class PostFavoritesDataModel extends PostFavoritesData {
  const PostFavoritesDataModel({
    required super.favoriteProducts,
  });

  factory PostFavoritesDataModel.fromJson(Map<String, dynamic> json) {
    return PostFavoritesDataModel(
      favoriteProducts: PostFavoriteProductModel.fromJson(json['product']),
    );
  }
}
