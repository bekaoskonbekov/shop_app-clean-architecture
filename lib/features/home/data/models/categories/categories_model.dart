import 'package:shop_app_clean_architecture/features/home/data/models/categories/categories_data_model.dart';

import '../../../domain/entities/categories/categories.dart';

class CategoriesModel extends Categories {
  const CategoriesModel({
    required super.status,
    required super.data,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      status: json['status'],
      data: CategoriesDataModel.fromJson(json['data']),
    );
  }
}
