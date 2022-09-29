import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_clean_architecture/features/home/presentation/components/favorite_item_component.dart';

import '../../../../core/components/screen_status.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../core/utils/enums.dart';
import '../controllers/favorites/favorites_bloc.dart';

class FavoritesScreen extends StatelessWidget {
  final Map<int, bool> favorites;

  const FavoritesScreen({
    key,
    this.favorites = const {},
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesBloc, FavoritesState>(
      builder: (context, state) {
        print('favorite state $state');

        switch (state.getFavoritesState) {
          case RequestState.isLoading:
            return showLoading();

          case RequestState.success:
            return Scaffold(
              appBar: AppBar(
                title: const Text('Favorites'),
              ),
              body: BuildCondition(
                condition:
                    state.getFavoriteProducts!.data.favoritesData.isNotEmpty,
                builder: (context) => ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => FavoriteItemComponent(
                    data: state.getFavoriteProducts!.data.favoritesData[index],
                    favorites: favorites,
                  ),
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount:
                      state.getFavoriteProducts!.data.favoritesData.length,
                ),
                fallback: (context) => Center(
                  child: Column(
                    children: [
                      Image.asset('assets/images/no_favorites.svg'),
                      AppSize.sizedBox10,
                      Text(
                        'NoFavorites',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),
              ),
            );

          case RequestState.error:
            return showError(state.getFavoriteErrorMessage!);
        }
      },
    );
  }
}
