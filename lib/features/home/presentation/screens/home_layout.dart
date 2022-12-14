import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_clean_architecture/features/home/presentation/controllers/categories_bloc/categories_bloc.dart';
import 'package:shop_app_clean_architecture/features/home/presentation/controllers/home/home_bloc.dart';
import 'package:shop_app_clean_architecture/features/home/presentation/screens/categories_screen.dart';
import 'package:shop_app_clean_architecture/features/home/presentation/screens/favorites_screen.dart';
import 'package:shop_app_clean_architecture/features/home/presentation/screens/home_screen.dart';
import 'package:shop_app_clean_architecture/features/home/presentation/screens/settings_screen.dart';

import '../../../../core/services/service_locator.dart';
import '../../../../generated/locale_keys.g.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex = 0;

  final List<Widget> screens = [
    HomeScreen(),
    const CategoriesScreen(),
    const FavoritesScreen(),
    const SettingsScreen(),
  ];

  void changeIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<HomeBloc>()..add(const GetHomeDataEvent()),
        ),
        BlocProvider(
          create: (context) =>
              sl<CategoriesBloc>()..add(const GetCategoriesDataEvent()),
        ),
      ],
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (value) {
            changeIndex(value);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: LocaleKeys.home,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.apps),
              label: LocaleKeys.categories,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: LocaleKeys.favorites,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: LocaleKeys.settings,
            ),
          ],
        ),
        body: screens[currentIndex],
      ),
    );
  }
}
