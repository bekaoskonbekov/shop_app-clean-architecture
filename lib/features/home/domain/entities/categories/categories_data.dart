import 'package:equatable/equatable.dart';
import 'package:shop_app_clean_architecture/features/home/domain/entities/categories/categories_product_data.dart';

class CategoriesData extends Equatable {
  final List<CategoriesProductData> products;

  const CategoriesData({
    required this.products,
  });

  @override
  List<Object> get props => [products];
}
