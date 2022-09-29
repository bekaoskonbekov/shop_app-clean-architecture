import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/error/network_exceptions.dart';
import '../../../../../core/usecase/base_use_case.dart';
import '../../../domain/entities/categories/categories.dart';
import '../../../domain/usecases/get_categories_usecase.dart';

part 'categories_event.dart';
part 'categories_state.dart';
part 'categories_bloc.freezed.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  GetCategoriesUseCase getCategoriesUseCase;

  CategoriesBloc(this.getCategoriesUseCase) : super(const LoadingState()) {
    on<GetCategoriesDataEvent>(_getCategoriesData);
  }

  FutureOr<void> _getCategoriesData(
    GetCategoriesDataEvent event,
    Emitter<CategoriesState> emit,
  ) async {
    final result = await getCategoriesUseCase(const NoParameters());
    result.fold((l) {
      emit(CategoriesState.error(l));
    }, (r) {
      emit(CategoriesState.success(r));
    });
  }
}
