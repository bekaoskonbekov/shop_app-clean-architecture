import 'package:equatable/equatable.dart';
import 'package:shop_app_clean_architecture/features/home/domain/entities/home/banner.dart';
import 'package:shop_app_clean_architecture/features/home/domain/entities/home/product.dart';

class HomeData extends Equatable {
  final List<Banner> banners;
  final List<Product> products;

  const HomeData({
    required this.banners,
    required this.products,
  });

  @override
  List<Object> get props => [banners, products];
}
