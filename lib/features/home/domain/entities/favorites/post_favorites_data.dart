import 'package:equatable/equatable.dart';
import 'package:shop_app_clean_architecture/features/home/domain/entities/favorites/post_favorite_product.dart';

class PostFavoritesData extends Equatable {
  final PostFavoriteProduct favoriteProducts;

  const PostFavoritesData({
    required this.favoriteProducts,
  });

  @override
  List<Object> get props => [favoriteProducts];
}
