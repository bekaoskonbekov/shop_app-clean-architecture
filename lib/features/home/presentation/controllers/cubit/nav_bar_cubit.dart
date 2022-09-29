import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_clean_architecture/features/home/presentation/controllers/cubit/nav_bar_state.dart';

import '../../screens/categories_screen.dart';
import '../../screens/favorites_screen.dart';
import '../../screens/home_screen.dart';
import '../../screens/settings_screen.dart';

class NavBarCubit extends Cubit<NavBarStates> {
  NavBarCubit() : super(NavBarInitialState());

  static NavBarCubit get(context) => BlocProvider.of(context);

  final List<Widget> screens = [
    HomeScreen(),
    const CategoriesScreen(),
    const FavoritesScreen(),
    const SettingsScreen(),
  ];

  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    emit(AppBottomNavBarState());
  }
}
