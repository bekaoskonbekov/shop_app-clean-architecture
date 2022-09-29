import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_clean_architecture/features/register/presentation/controller/cubit/password_visibility_cubit.dart';
import 'package:shop_app_clean_architecture/features/register/presentation/screens/login_screen.dart';
import 'package:shop_app_clean_architecture/localization/localization_service.dart';
import 'core/helpers/dio_helper.dart';
import 'core/services/service_locator.dart';
import 'core/utils/app_string.dart';
import 'core/utils/styles/app_themes/light_theme.dart';
import 'features/home/presentation/controllers/categories_bloc/categories_bloc.dart';
import 'features/home/presentation/controllers/favorites/favorites_bloc.dart';
import 'features/home/presentation/controllers/home/home_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();
  ServiceLocator.init();

  await EasyLocalization.ensureInitialized();

  runApp(
    initialLocalization(child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

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
        BlocProvider(
          create: (context) =>
              sl<FavoritesBloc>()..add(GetFavoriteProductEvent()),
        ),
        BlocProvider(create: (context) => sl<PasswordVisibilityBloc>())
      ],
      child: MaterialApp(
        title: AppString.appName,
        debugShowCheckedModeBanner: false,
        theme: LightTheme.lightTheme,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: LoginScreen(),
      ),
    );
  }
}
