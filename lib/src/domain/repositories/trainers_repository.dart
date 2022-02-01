import 'package:lepaya_app/src/domain/entities/trainer.dart';

import '../../core/resources/data_state.dart';

abstract class TrainersRepository {
  // API methods
  Future<DataState<List<Trainer>>> getTrainersList( );
}
