import 'package:shop_app_clean_architecture/features/home/data/models/favorites/post_favorites_data_model.dart';

import '../../../domain/entities/favorites/post_favorites.dart';

class PostFavoritesModel extends PostFavorite {
  const PostFavoritesModel({
    required super.status,
    required super.message,
    required super.favoritesData,
  });

  factory PostFavoritesModel.fromJson(Map<String, dynamic> json) {
    return PostFavoritesModel(
      status: json['status'],
      message: json['message'],
      favoritesData: PostFavoritesDataModel.fromJson(json['data']),
    );
  }
}
