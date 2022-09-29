import 'package:equatable/equatable.dart';
import 'package:shop_app_clean_architecture/features/home/domain/entities/favorites/post_favorites_data.dart';

class PostFavorite extends Equatable {
  final bool status;
  final String message;
  final PostFavoritesData favoritesData;

  const PostFavorite({
    required this.status,
    required this.message,
    required this.favoritesData,
  });

  @override
  List<Object> get props => [status, message, favoritesData];
}
