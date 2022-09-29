import 'package:shop_app_clean_architecture/features/home/data/models/categories/categories_product_data_model.dart';

import '../../../domain/entities/categories/categories_data.dart';
import '../../../domain/entities/categories/categories_product_data.dart';

class CategoriesDataModel extends CategoriesData {
  const CategoriesDataModel({required super.products});

  factory CategoriesDataModel.fromJson(Map<String, dynamic> json) {
    return CategoriesDataModel(
      products: List<CategoriesProductData>.from(
        (json['data'] as List).map(
          (product) => CategoriesProductDataModel.fromJson(product),
        ),
      ),
    );
  }
}
