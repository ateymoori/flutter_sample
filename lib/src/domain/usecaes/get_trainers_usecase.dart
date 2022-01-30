import 'package:lepaya_app/src/core/params/trainers_request.dart';
import 'package:lepaya_app/src/domain/entities/trainer.dart';
import 'package:lepaya_app/src/domain/repositories/trainers_repository.dart';

import '../../core/resources/data_state.dart';
import '../../core/usecase/usecase.dart';

class GetTrainersUseCase implements UseCase<DataState<List<Trainer>>, TrainersRequestParams> {
  final TrainersRepository _trainersRepository;
  GetTrainersUseCase(this._trainersRepository);

  @override
  Future<DataState<List<Trainer>>> call({TrainersRequestParams params}) {
    return _trainersRepository.getTrainersList( );
  }
}
