import 'package:dartz/dartz.dart';

import '../../../../core/error/network_exceptions.dart';
import '../../../../core/usecase/base_use_case.dart';
import '../entities/home/home.model.dart';
import '../repository/home_base_repository.dart';

class GetHomeDataUseCase extends BaseUseCase<Home, NoParameters> {
  final HomeBaseRepository homeBaseRepository;

  GetHomeDataUseCase(this.homeBaseRepository);

  @override
  Future<Either<NetworkExceptions, Home>> call(NoParameters parameters) async {
    return await homeBaseRepository.getHomeData();
  }
}
