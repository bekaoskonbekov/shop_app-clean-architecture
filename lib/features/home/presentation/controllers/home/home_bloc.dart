import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/error/network_exceptions.dart';
import '../../../../../core/usecase/base_use_case.dart';
import '../../../domain/entities/home/home.model.dart';
import '../../../domain/usecases/get_home_data_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  GetHomeDataUseCase getHomeDataUseCase;

  HomeBloc(this.getHomeDataUseCase) : super(const LoadingState()) {
    on<GetHomeDataEvent>(_homeData);
  }

  FutureOr<void> _homeData(
    GetHomeDataEvent event,
    Emitter<HomeState> emit,
  ) async {
    final result = await getHomeDataUseCase(const NoParameters());
    result.fold((l) {
      emit(HomeState.error(l));
    }, (r) {
      emit(HomeState.success(r));
    });
  }
}
